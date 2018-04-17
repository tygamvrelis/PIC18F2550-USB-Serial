/*
 * File:   main.c
 * Author: Tyler Gamvrelis
 *
 * Created on August 30, 2017, 11:34 PM
 * 
 * Description: Co-processor firmware with startup boot options.
 */

/* Includes. */
#include <xc.h>
#include "../../../src/PIC18F2550/configBits.h"
#include "../../../src/PIC18F2550/machineConfig.h"
#include "../../../src/UART/UART_PIC.h"
#include "../USBConverter/LPC_FSUSB-CDC-X/main_cdc.h"

/* Defines. */
#define COM_PORT                0
#define USER_DEFINED_CODE       1  

/* Function prototypes. */
void bootComPort(void);
void bootUserCode(void); /* USER-DEFINED CODE GOES IN THIS FUNCTION. */

/* Entry point (executes once). */
void main(void) {
    /* Configure pins, SFRs, and on-board modules. */
    machineConfig();
    
    __delay_ms(10); // Just in case
    
    /* Declare local variables. */
    signed char boot = 0; /* Store which program to boot into. */
    
    
    /* INSERT CODE HERE TO CHANGE boot BASED ON SENSOR INPUT
     * (e.g. a key press) */
    
    
    /* Boot into selected program. */
    switch(boot){
        case COM_PORT:
            bootComPort();
            break;
        case USER_DEFINED_CODE:
            bootUserCode();
            break;
        default:
            bootComPort();
            break;
    }
}

void bootComPort(void){
    /* Runs the USB to serial converter routine, forever.
     * 
     * Arguments: none
     * 
     * Returns: none
     */
    
    ei(); // Enable interrupts
   
    SYSTEM_Initialize(SYSTEM_STATE_USB_START);

    USBDeviceInit();
    USBDeviceAttach();
    
    while(1){
        CDC_Routine();

        /* Add your own state-based tasks here */
        //...
    }
}

void bootUserCode(void){
    /* Calls user defined code, forever.
     *
     * Arguments: none
     *
     * Returns: none
     */
    
    while(1){
        /* YOUR CODE HERE */
    }
}