#include <xc.h>

void machineConfig(void) {
    /* OSCILLATOR */
    /* Force internal oscillator operation */
    OSCCONbits.IRCF = 0b111; // 8 MHz internal oscillator
    OSCCONbits.SCS1 = 1; 
    OSCCONbits.SCS0 = 0;
    
    /* PIN I/O */
    TRISA = 0b11011111; /* All of port A as inputs except for RA5 (data
                         * available pin). */
    TRISB = 0b00001111; // RB7-4 as output and RB3-0 as inputs
    TRISC = 0b10000000; // RC7 (RX) as input, RC6-0 as outputs
   
    /* Output low on all latches except RB7-4 */
    LATA = 0x00;
    LATB = 0xF0; // Set LAT of all output pins on port B to output high
    LATC = 0b10000000;
    
    /** Analog to digital converter (ADC) module **/
    ADCON1 = 0x0F; // Set ADCON for digital input on all pins
    ADCON0bits.ADON = 0; // Disable ADC for now
    
    /** Interrupts **/
    PEIE = 1; // Enable peripheral interrupts
    ADIE = 0; // Disable A/D conversion interrupts
    RCONbits.IPEN = 0;
    di(); // Disable all interrupts for now
}
