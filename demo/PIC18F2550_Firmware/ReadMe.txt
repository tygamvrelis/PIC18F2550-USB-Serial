Boot --> Download this program into the PIC18F2550. This contains startup code that branches into the virtual COM port code, but can be easily modified to branch into different programs depending on sensor input.


USBConverter --> This contains all the files for the bidirectional USB to serial converter that shows up as a virtual COM port on a PC. The "Boot" program directly depends on the contents of this folder.
	**NOTE: This folder contains ALL the source files for this functionality.
		Thus, any changes here will be reflected in Boot and vice versa.**

Also, the USBConverter folder contains a driver file that can be used to install the virtual COM port driver on a Windows PC.