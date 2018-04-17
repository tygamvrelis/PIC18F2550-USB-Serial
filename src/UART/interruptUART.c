/* 
 * File:   interrupt.c
 * Author: Tyler Gamvrelis
 *
 * Created on July 17, 2017, 1:57 PM
 */

#include "UART_PIC.h"

void interrupt interruptHandlerUART(void){
    /* Any time that an interrupt is generated, the microcontroller will branch
     * here. As such, any interrupts that are enabled need to be handled in this
     * function. Otherwise, unexpected behavior can arise.
     */
    
    /* UART transmit: TXREG empty */
    if(IF_TX){
        /* Load data into transmit register TXREG */
        UARTinterruptState = INTCONbits.GIE; // Enter critical section
        di();
        TXREG = UART -> _dataTX[UART -> _numTransmits];
        INTCONbits.GIE = UARTinterruptState; // Exit critical section
        
        UART -> _numTransmits++; // Increment transmit count

        /* Disable transmit interrupts if last byte transmitted */
        if((UART -> _numTransmits) == (UART -> _numBytesTX)){
            IE_TX = 0;
            
            /* Set TX state to ready */
            UART -> _stateTX = UART_STATE_READY;
        }
    }
    
    /* UART receive: RCREG full */
    if(IF_RX){
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
        UART -> _dataRX[UART -> _numReceives] = RCREG;
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
        
        UART -> _numReceives++; // Increment receive count
        
        /* Disable RX interrupts if last byte received */
        if(UART -> _numReceives >= UART -> _numBytesRX){
            IE_RX = 0;
            
            /* Set RX state to ready */
            UART -> _stateRX = UART_STATE_READY; 
        }
    }
}