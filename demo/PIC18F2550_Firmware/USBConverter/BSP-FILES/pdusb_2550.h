/* 
 * File:   pdusb_2550.h
 * Author: vsk hs-ulm
 *
 * Created on 9. Mai 2014, 10:39
 * 
 * Edited by Tyler Gamvrelis on Sept 3, 12:44 
 */

#ifndef PDUSB_2550_H
#define	PDUSB_2550_H

// ------------------------------------------------------ fixed_address_momory.h
#define FIXED_ADDRESS_MEMORY

#define HID_CUSTOM_OUT_DATA_BUFFER_ADDRESS  0x500
#define HID_CUSTOM_IN_DATA_BUFFER_ADDRESS   0x540

#define IN_DATA_BUFFER_ADDRESS_TAG      @0x500    // for CDC device (XC8)
#define OUT_DATA_BUFFER_ADDRESS_TAG     @0x540
#define CONTROL_BUFFER_ADDRESS_TAG      @0x580

#endif	/* PDUSB_2550_H */
