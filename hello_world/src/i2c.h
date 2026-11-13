#ifndef I2C_H
#define I2C_H

#ifdef __MICROBLAZE__

#include <xil_types.h>
#include <stdlib.h>
#include "xparameters.h"
//#include "xiic.h"     // Needed for higher lebel Interrupt based I2C API
#include "xiic_l.h"     // Needed for lower level polled I2C API
#include "xgpio.h"
#include "xil_printf.h"
#include "sleep.h"      // Needed to allow EEPROM to write data


/* Update these defines to match your xparameters.h and EEPROM datasheet */
#define IIC_BASE_ADDRESS    XPAR_AXI_IIC_0_BASEADDR
#define EEPROM_I2C_ADDR     0x50    /* 7-bit I2C slave address (e.g., 0x50 - 0x57) */
#define EEPROM_MAC_ADDR     0xFA    /* Target internal memory address */
#define DATA_LENGTH         6       /* Number of bytes to write/read */

/* Set to 2 for larger EEPROMs (e.g., 24LC32, 24LC64), or 1 for <= 16Kb (e.g., 24LC02) */
#define ADDR_BYTE_LEN       1

//#define XIIC_RFD_REG_OFFSET 0x10                  // Provides the number of data bytes present in the Receive FIFO

// Function Prototypes
//int i2c_init(); // Needed for interrupt based version
int EepromWritePolled(u16 MemAddr, u8 *WriteBuf, u16 ByteCount);
int EepromReadPolled(u16 MemAddr, u8 *ReadBuf, u16 ByteCount);


#endif // I2C_H

#endif // __MICROBLAZE__