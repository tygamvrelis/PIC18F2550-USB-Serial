# PIC18F2550-USB-Serial
Virtual serial port program (USB to UART and vice versa). Immediately usable on a PIC18F2550. This project is a modified version of a modified MLA project made by Microchip forums user vloki. Developed for usage in the course AER201 at the University of Toronto, in summer 2017.

## Instructions:
1. Navigate to demo\PIC18F2550_Firmware
2. Open the Boot.X project
3. By default, this project contains code that will run as an interrupt-based USB to serial converter (bidirectional). Comments indicate where user code can be added to co-exist with the serial converter code. Alternatively, comments indicate where code to acquire sensor input could be used to modify which program is booted into, and a function for user-defined code is provided.