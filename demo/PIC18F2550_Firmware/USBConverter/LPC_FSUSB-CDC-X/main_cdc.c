/********************************************************************
 FileName:      main_cdc.c
 Dependencies:  See INCLUDES section
 Processor:     PIC18 USB Microcontrollers
 
 Hardware:	This firmware is made based on Microchip USB demo
 		board code supported by the MCHPFSUSB stack.
 		(*** Device - CDC - Custom Demos ***)
 		
 Complier:      Microchip C18 / XC8 (for PIC18)
 Company:	HS-Ulm

********************************************************************
 File Description:

 Change History:
  Rev   Date    Description
  ----  ------- -----------------------------------------------------
  1.0   ?       Initial release
  2.0   May 14  major changes (added XC8 / MLA 2013_12_20)

 ********************************************************************/

/** INCLUDES *******************************************************/

#include "system.h"
#include "usb.h"
#include "usb_device_cdc.h"
#include "app_device_cdc_to_uart.h"


/** DECLARATIONS ***************************************************/


/********************************************************************
 * Function:        void main(void)
 *
 * PreCondition:    None
 *
 * Input:           None
 *
 * Output:          None
 *
 * Side Effects:    None
 *
 * Overview:        Main program entry point.
 *
 * Note:            None
 *******************************************************************/
void CDC_Routine(void)
{   
    /* If the USB device isn't configured yet, we can't really do anything
     * else since we don't have a host to talk to.  So jump back to the
     * top of the while loop. */
    if( USBGetDeviceState() < CONFIGURED_STATE )
    {
        /* Jump back to the top of the while loop. */
        return;
    }

    /* If we are currently suspended, then we need to see if we need to
     * issue a remote wakeup.  In either case, we shouldn't process any
     * keyboard commands since we aren't currently communicating to the host
     * thus just continue back to the start of the while loop. */
    if( USBIsDeviceSuspended()== true )
    {
        /* Jump back to the top of the while loop. */
        return;
    }

    //Application specific tasks
    APP_DeviceCDCEmulatorTasks();
}//end while

/*******************************************************************
 * Function:        BOOL USER_USB_CALLBACK_EVENT_HANDLER(
 *                        USB_EVENT event, void *pdata, WORD size)
 *
 * PreCondition:    None
 *
 * Input:           USB_EVENT event - the type of event
 *                  void *pdata - pointer to the event data
 *                  WORD size - size of the event data
 *
 * Output:          None
 *
 * Side Effects:    None
 *
 * Overview:        This function is called from the USB stack to
 *                  notify a user application that a USB event
 *                  occurred.  This callback is in interrupt context
 *                  when the USB_INTERRUPT option is selected.
 *
 * Note:            None
 *******************************************************************/
bool USER_USB_CALLBACK_EVENT_HANDLER(USB_EVENT event, void *pdata, uint16_t size)
{
    switch(event)
    {
        case EVENT_TRANSFER:
            //Add application specific callback task or callback function here if desired.
            break;
        case EVENT_SOF:
            break;
        case EVENT_SUSPEND:
            break;
        case EVENT_RESUME:
            break;
        case EVENT_CONFIGURED:
            /* When the device is configured, we can (re)initialize the demo
             * code. */
            APP_DeviceCDCEmulatorInitialize();
            break;
        case EVENT_SET_DESCRIPTOR:
            break;
        case EVENT_EP0_REQUEST:
            /* We have received a non-standard USB request.  The CDC driver
             * needs to check to see if the request was for it. */
            USBCheckCDCRequest();
            break;
        case EVENT_BUS_ERROR:
            break;
        case EVENT_TRANSFER_TERMINATED:
            //Add application specific callback task or callback function here if desired.
            //The EVENT_TRANSFER_TERMINATED event occurs when the host performs a CLEAR
            //FEATURE (endpoint halt) request on an application endpoint which was
            //previously armed (UOWN was = 1).  Here would be a good place to:
            //1.  Determine which endpoint the transaction that just got terminated was
            //      on, by checking the handle value in the *pdata.
            //2.  Re-arm the endpoint if desired (typically would be the case for OUT
            //      endpoints).
            break;
        default:
            break;
    }
    return true;
}

/** EOF main_hid.c ************************************************************/
