/* 
 * File:   UART_PIC.h
 * Author: Tyler Gamvrelis
 *
 * Created on July 17, 2017, 11:11 AM
 */

#ifndef UART_PIC_H
#define	UART_PIC_H

/********************************** Includes **********************************/
#include <xc.h>

#ifdef _PIC18F4620_H_
    #include "../PIC18F4620/configBits.h"
#endif
#ifdef _PIC18F2550_H_
    #include "../PIC18F2550/configBits.h"
#endif

/*********************************** Macros ***********************************/
/* Enables the hardware transmitter. Needs a few CPU cycles for stabilizing, 
 * hence the delay. */
#define __UART_ENABLE_TX()      TXSTAbits.TXEN = 1; __delay_ms(5);

 /* Disables the hardware transmitter. Needs a delay for shifting out the last 
  * byte. */
#define __UART_DISABLE_TX()     __delay_ms(5);    TXSTAbits.TXEN = 0;

/* Enables the hardware receiver. */
#define __UART_ENABLE_RX()      RCSTAbits.CREN = 1

/* Disables the hardware receiver. */
#define __UART_DISABLE_RX()     RCSTAbits.CREN = 0

/*********************************** Defines **********************************/
#define BUFF_SIZE_RX    16 // Number of bytes for receive buffer
#define IE_TX           TXIE
#define IF_TX           TXIF
#define TSR_IS_READY    TRMT
#define IE_RX           RCIE
#define IF_RX           RCIF
#define FRAMING_ERROR   RCSTAbits.FERR
#define OVERRUN_ERROR   RCSTAbits.OERR

/************************************ Types ***********************************/
/* UART state definitions. These are used to indicate that transmit and/or
 * receive processes are in progress so that multiple sections of code will not
 * try to access the peripheral at the same time */
typedef enum{
    UART_STATE_BUSY = 0x00,
    UART_STATE_READY = 0x01,
}UART_StateTypeDef;

/* UART handle structure definition (i.e. reference to the UART resources).
 * Any resources that are modified in an ISR and are also used outside of that
 * ISR are declared with the keyword volatile. This ensures that the program
 * will always load these resources from memory, and prevents the compiler from
 * making optimizations that may instead store these resources in a temporary
 * register. */
typedef struct{
    unsigned char* _dataTX;                         /*!< Pointer to data to be transmitted                                                  */
    unsigned char _numBytesTX;                      /*!< Number of bytes to be transmitted                                                  */
    volatile unsigned char _numTransmits;           /*!< The number of transmits executed for the current function call                     */
    unsigned char* _dataRX;                         /*!< Pointer to receive buffer                                                          */
    unsigned char _numBytesRX;                      /*!< The number of bytes to be received                                                 */
    volatile unsigned char _numReceives;            /*!< The number of receives executed for the current function call                      */
    volatile unsigned char _stateTX;                /*!< 1 if no transmit process in progress, else 0                                       */
    volatile unsigned char _stateRX;                /*!< 1 if no recieve process in progress, else 0                                        */
    volatile unsigned char _lastReceiveFERR;        /*!< 1 if framing error occurred with last packet received, else 0                      */
    volatile unsigned char _lastReceiveOERR;        /*!< 1 if overrun error occurred with last packet received, else 0                      */
}UART_t;

/***************************** Private variables ******************************/
volatile unsigned char UARTinterruptState;

/**************************** External variables ******************************/
unsigned char arr_dataRX[BUFF_SIZE_RX]; // Receive buffer
UART_t* UART; // Pointer to UART handle 

/****************************** Public Interfaces *****************************/
void uartTransmitBlocking(unsigned char* data, unsigned char numBytes);
void uartTransmitIT(unsigned char* data, unsigned char numBytes);
void uartReceiveBlocking(unsigned char numBytes);
void uartReceiveIT(unsigned char numBytes);

/* Initialization */
void UART_Init(long baud);

#endif	/* UART_PIC_H */
