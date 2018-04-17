
#include "system.h"
#include "system_config.h"
#include "usb.h"

void interrupt SYS_InterruptHigh() {
    //Check which interrupt flag caused the interrupt.
    //Service the interrupt
    //Clear the interrupt flag
    //Etc.
#if defined(USB_INTERRUPT)
    USBDeviceTasks();
#endif
} //This return will be a "retfie fast"
void interrupt low_priority SYS_InterruptLow() {
    //Check which interrupt flag caused the interrupt.
    //Service the interrupt
    //Clear the interrupt flag
    //Etc.
}

/*********************************************************************
* Function: void SYSTEM_Initialize( SYSTEM_STATE state )
*
* Overview: Initializes the system.
*
* PreCondition: None
*
* Input:  SYSTEM_STATE - the state to initialize the system into
*
* Output: None
*
 * Edited by Tyler Gamvrelis on Sept 3, 12:44 p.m.
********************************************************************/
void SYSTEM_Initialize( SYSTEM_STATE state )
{
    switch(state)
    {
        case SYSTEM_STATE_USB_START:
            /* Force primary (external) oscillator operation */
//            OSCCONbits.IRCF = 0b111; /* 8 MHz internal oscillator just in case anything 
//                                      * needs it */
//            OSCCONbits.SCS1 = 0;
//            OSCCONbits.SCS0 = 0;
            
            /* PIN I/O */
            TRISA = 0b11111111; /* All of port A as inputs. */
            TRISB = 0b00001111; // RB7-4 as output and RB3-0 as inputs
            TRISC = 0b10000000; // RC7 (RX) as input, RC6-0 as outputs

            /* Output low on all latches except RB7-4 */
            LATA = 0x00;
            LATB = 0xF0; // Set LAT of all output pins on port B to output high
            LATC = 0b10000000;
            
            ADCON1 |= 0x0F;                 // Default all pins to digital
            break;

        case SYSTEM_STATE_USB_SUSPEND:
            break;

        case SYSTEM_STATE_USB_RESUME:
            break;
    }
}

