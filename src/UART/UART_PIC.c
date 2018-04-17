/*
 * File:   UART_PIC.c
 * Author: Tyler Gamvrelis
 *
 * Created on July 17, 2017, 11:10 AM
 */


#include "UART_PIC.h"

/**************************** External variables ******************************/
/* Initialize pointer of the UART_t type. This will serve as a "handle" for all
 * UART operations. The benefit of this in code is that if the PIC had multiple
 * UART modules, they could all be declared in this manner and passed as
 * arguments into functions. The functions would then not have to be hardcoded
 * to use a specific UART module on the microcontroller, and they would be much
 * more scalable. */
UART_t uart = {0};
UART_t* UART = &uart;

/****************************** Public Functions ******************************/
void uartTransmitBlocking(unsigned char* data, unsigned char numBytes){
    /* Transmits an array of data over UART in blocking mode (no interrupts
     * required). RC6 is the TX pin.
     *
     * Arguments: data, pointer to the data to be transmitted. It is the 
     *                  programmer's responsibility to ensure this pointer is 
     *                  not NULL, and that the size of the array does not
     *                  exceed numBytes.
     *            numBytes, the number of bytes to be transmitted.
     * 
     * Returns: none
     */

    /* Ensure this function is not called while the UART transmitter is busy. */
    while(UART -> _stateTX == UART_STATE_BUSY){ continue;   }
    
    /* Set TX state to busy */
    UART -> _stateTX = UART_STATE_BUSY;

    /* Local variable declaration and initialization */
    unsigned char numTransmits = 0;

    /* Enable transmit module */
    __UART_ENABLE_TX();

    /* Iterate through the data array to be transmitted */
    while(numTransmits < numBytes){
        /* Wait until the previous TXREG data has completed its transfer 
         * into the TSR and the TSR has finished transmitting all bits 
         * before loading the TXREG register. */
        while(!IF_TX | !TSR_IS_READY){   continue;   }
        NOP();
        
        /* Load data into transmit register TXREG */
        UARTinterruptState = INTCONbits.GIE; // Enter critical section
        di();
        TXREG =  data[numTransmits];
        INTCONbits.GIE = UARTinterruptState; // Exit critical section
        
        numTransmits++;
        /* The rest of the transmission is implemented in hardware and 
         * therefore could execute in parallel with the user-defined program
         * if interrupts were used. */
    }
    
    /* Set TX state to ready */
    UART -> _stateTX = UART_STATE_READY;
}

void uartTransmitIT(unsigned char* data, unsigned char numBytes){
    /* Transmits an array of data over UART in non-blocking mode (uses
     * interrupts). For this function to work properly, the GIE and PEIE bits
     * in the INTCON register must be set. RC6 is the TX pin.
     *
     * Arguments: data, pointer to the data to be transmitted. It is the 
     *                  programmer's responsibility to ensure this pointer is 
     *                  not NULL, and that the size of the array does not
     *                  exceed numBytes.
     *            numBytes, the number of bytes to be transmitted.
     *            
     * Returns: none
     */
    
    /* Ensure this function is not called while the UART transmitter is busy. */    
    while(UART -> _stateTX == UART_STATE_BUSY){ continue;   }
    
    /* Set TX state to busy */
    UART -> _stateTX = UART_STATE_BUSY;

    /* Initialize UART transmit members in the UART_HandleTypeDef struct */
    UART -> _dataTX = data;
    UART -> _numBytesTX = numBytes;
    UART -> _numTransmits = 0;
    
    /* Enable transmit module */
    __UART_ENABLE_TX();
    IE_TX = 1; // Enable TXIF interrupt. Also sets TXIF
    
    /* The rest of transmit is executed in TXIF's ISR (IF_TX) */
}

void uartReceiveBlocking(unsigned char numBytes){
    /* Receives data over UART in blocking mode (no interrupts). RC7 is the RX 
     * pin. The data received is stored in an array in UART -> _dataRX.
     * 
     * Arguments: numBytes, the number of bytes to be received. Must be less
     *                      than or equal to BUFF_SIZE_RX
     * 
     * Returns: none
     */
    
    /* Ensure this function is not called while the UART receiver is busy. */    
    while(UART -> _stateRX == UART_STATE_BUSY){ continue;   }
    
    /* Set RX state to busy */
    UART -> _stateRX = UART_STATE_BUSY;

    /* Local variable declaration and initialization */
    unsigned char numReceives = 0;
    UART -> _lastReceiveFERR = 1; // Assume framing error
    UART -> _lastReceiveOERR = 1; // Assume overload error

    /* Enable receive module */
    __UART_ENABLE_RX();
    unsigned char temp = RCREG; // Flush receive register

    /* Iterate through the data array to be transmitted */
    while(numReceives < numBytes){  
        /* Wait until the receive buffer RCREG is full */
        while(!IF_RX){   continue;   }
        
        /* Check/clear framing error (too many or too few bytes between start
         * and stop bit.*/
        if(FRAMING_ERROR){
            /* Store information for now. If there is a framing error, it will 
             * be cleared when the receive register RCREG is read. But, in this
             * case, that entry in _dataRX will be garbage */
            UART -> _lastReceiveFERR = 1;
        }
        else{
            UART -> _lastReceiveFERR = 0;
        }

        /* Read RCREG into memory */
        UARTinterruptState = INTCONbits.GIE; // Enter critical section
        di();
        UART -> _dataRX[numReceives] = RCREG;
        INTCONbits.GIE = UARTinterruptState; // Exit critical section

        /* Check/clear overrun error (next byte arrives before previous
         * was read). */
        if(OVERRUN_ERROR){
            /* Receive buffer flushed in hardware when receiver is reset */
            RCSTAbits.CREN = 0;
            RCSTAbits.CREN = 1;
        }
        else{
            UART -> _lastReceiveOERR = 0;
        }

        numReceives++; // Increment receive count
    }

    /* Set RX state to ready */
    UART -> _stateRX = UART_STATE_READY;
}

void uartReceiveIT(unsigned char numBytes){
    /* Receives data over UART in non-blocking mode (uses interrupts). For this 
     * function to work properly, the GIE and PEIE bits in the INTCON register 
     * must be set. RC7 is the RX pin. The data received is stored in an array 
     * in UART -> _dataRX.
     * 
     * Arguments: numBytes, the number of bytes to be received. Must be less
     * than or equal to BUFF_SIZE_RX
     * 
     * Returns: none
     */
    
    /* Ensure this function is not called while the UART is busy. */        
    while(UART -> _stateRX == UART_STATE_BUSY){ continue;   }
    
    /* Set RX state to busy */
    UART -> _stateRX = UART_STATE_BUSY;    

    /* Initialize UART transmit members in the UART_HandleTypeDef struct */
    UART -> _numBytesRX = numBytes;
    UART -> _numReceives = 0;
    UART -> _lastReceiveFERR = 1; // Assume framing error
    UART -> _lastReceiveOERR = 1; // Assume overload error

    /* Enable receive module */
    __UART_ENABLE_RX();
    IE_RX = 1; // Enable RCIF interrupt for when reception is complete
    
    /* The rest of receive is executed in RCIF's ISR (IF_RX) */
}

void UART_Init(long baud){
    /* Initializes the UART control registers.
     *
     * Arguments: baud, the desired baud rate (configuration optimized for 9600
     *                  since this baud rate has the least error (0.16%) with
     *                  the 40 MHz clock frequency. If not using baud = 9600, 
     *                  the SPBRGH register and BRGH bit may need to be set
     *                  (see pg. 206 & 207 in datasheet).
     * 
     * Returns: none
     */
    
    /* Configure baud rate generator control register */
    SPBRG = (unsigned char)((_XTAL_FREQ / (64 * baud)) - 1);
    
    /* Configure transmit control register */
    TXSTAbits.TX9 = 0; // Use 8-bit transmission (8 data bits, no parity bit)
    TXSTAbits.SYNC = 0; // Asynchronous communication
    TXSTAbits.TXEN = 1; // Enable transmitter
    
    /* Configure receive control register */
    RCSTAbits.RX9 = 0; // Use 8-bit reception (8 data bits, no parity bit)
    RCSTAbits.CREN = 1; // Enable receiver
    
    /* Enable RX and TX in software */
    UART -> _stateTX = UART_STATE_READY;
    UART -> _stateRX = UART_STATE_READY;

    /* Initialize receive buffer. */
    uart._dataRX = arr_dataRX;
    
    /* Enforce correct pin configuration for relevant TRISCx */
    TRISC6 = 0; // TX = output
    TRISC7 = 1; // RX = input
    
    /* Enable serial peripheral */
    RCSTAbits.SPEN = 1;
}