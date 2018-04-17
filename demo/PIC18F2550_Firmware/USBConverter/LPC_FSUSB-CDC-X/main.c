
#include "main_cdc.h"

void main(void){
    SYSTEM_Initialize(SYSTEM_STATE_USB_START);

    USBDeviceInit();            //usb_device.c
    USBDeviceAttach();        //usb_device.c
    
    while(1){
        CDC_Routine();
    }
}