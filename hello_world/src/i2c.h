#ifndef I2C_H
#define I2C_H

#ifdef __MICROBLAZE__

#include <xil_types.h>
#include <stdlib.h>
#include "xparameters.h"
#include "xiic.h"
#include "xgpio.h"
#include "xil_printf.h"


// Constants / Macros
#define EEPROM_I2C_ADDRESS  0x50                  // 7-bit I2C address for the 24AA025E48 EEPROM
#define MAC_START_OFFSET    0xFA                  // Factory programmed MAC address starts at 0xFA
#define MAC_ADDR_LEN        6                     // MAC address length is 6 bytes

// Command function pointer type




// Function Prototypes
int i2c_init();


#endif // I2C_H

#endif // __MICROBLAZE__