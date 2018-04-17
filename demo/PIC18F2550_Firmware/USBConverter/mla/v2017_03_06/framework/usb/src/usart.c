/********************************************************************
 Software License Agreement:

 The software supplied herewith by Microchip Technology Incorporated
 (the "Company") for its PIC(R) Microcontroller is intended and
 supplied to you, the Company's customer, for use solely and
 exclusively on Microchip PIC Microcontroller products. The
 software is owned by the Company and/or its supplier, and is
 protected under applicable copyright laws. All rights are reserved.
 Any use in violation of the foregoing restrictions may subject the
 user to criminal sanctions under applicable laws, as well as to
 civil liability for the breach of the terms and conditions of this
 license.

 THIS SOFTWARE IS PROVIDED IN AN "AS IS" CONDITION. NO WARRANTIES,
 WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED
 TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE COMPANY SHALL NOT,
 IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL OR
 CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
 *******************************************************************/

#include <usart.h>
#include <stdbool.h>
#include <xc.h>
#include <usb_config.h>
#include <usb_device_cdc.h>

/******************************************************************************
 * Function:        void USART_Initialize(void)
 *
 * PreCondition:    None
 *
 * Input:           None
 *
 * Output:          None
 *
 * Side Effects:    None
 *
 * Overview:        This routine initializes the UART to the value set by Host Terminal Application
 *
 * Note:
 *
 *****************************************************************************/

void USART_Initialize()
{
        unsigned char c;

        /* Configure transmit control register */
        TXSTAbits.TX9 = 0; // Use 8-bit transmission (8 data bits, no parity bit)
        TXSTAbits.SYNC = 0; // Asynchronous communication
        TXSTAbits.TXEN = 1; // Enable transmitter
        
        /* Configure receive control register */
        RCSTAbits.RX9 = 0; // Use 8-bit reception (8 data bits, no parity bit)
        RCSTAbits.CREN = 1; // Enable receiver
       
        UART_TRISRx = 1;				// RX
        UART_TRISTx = 0;				// TX

        /* Enable serial peripheral */
        RCSTAbits.SPEN = 1;

        c = RCREG;				// read
    

}//end USART_Initialize

/******************************************************************************
 * Function:        void USART_putcUSART(char c)
 *
 * PreCondition:    None
 *
 * Input:           char c - character to print to the UART
 *
 * Output:          None
 *
 * Side Effects:    None
 *
 * Overview:        Print the input character to the UART
 *
 * Note:
 *
 *****************************************************************************/
void USART_putcUSART(char c)
{
      TXREG = c;
}


/******************************************************************************
 * Function:        void USART_mySetLineCodingHandler(void)
 *
 * PreCondition:    USB_CDC_SET_LINE_CODING_HANDLER is defined
 *
 * Input:           None
 *
 * Output:          None
 *
 * Side Effects:    None
 *
 * Overview:        This function gets called when a SetLineCoding command
 *                  is sent on the bus.  This function will evaluate the request
 *                  and determine if the application should update the baudrate
 *                  or not.
 *
 * Note:
 *
 *****************************************************************************/
#if defined(USB_CDC_SET_LINE_CODING_HANDLER)
void USART_mySetLineCodingHandler(void)
{
    //Update the baudrate info in the CDC driver
    CDCSetBaudRate(cdc_notice.GetLineCoding.dwDTERate);

    //Update the baudrate of the UART
    
    uint32_t dwBaud;
    dwBaud = ((GetSystemClock()/64) / line_coding.dwDTERate) - 1;
    SPBRG = (uint8_t) dwBaud;
    SPBRGH = (uint8_t)((uint16_t) (dwBaud >> 8));

        
    USART_Initialize();
}
#endif

/******************************************************************************
 * Function:        void USART_getcUSART(char c)
 *
 * PreCondition:    None
 *
 * Input:           None
 *
 * Output:          unsigned char c - character to received on the UART
 *
 * Side Effects:    None
 *
 * Overview:        Print the input character to the UART
 *
 * Note:
 *
 *****************************************************************************/
unsigned char USART_getcUSART ()
{
	char  c;

	if (RCSTAbits.OERR)  // in case of overrun error
	{                    // we should never see an overrun error, but if we do,
		RCSTAbits.CREN = 0;  // reset the port
		c = RCREG;
		RCSTAbits.CREN = 1;  // and keep going.
	}
	else
    {
		c = RCREG;
    }
// not necessary.  EUSART auto clears the flag when RCREG is cleared
//	PIR1bits.RCIF = 0;    // clear Flag

  
	return c;
}