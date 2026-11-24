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
#define EEPROM_AXI_ADDR     XPAR_AXI_IIC_0_BASEADDR
#define EEPROM_I2C_ADDR     0x50    /* 7-bit I2C slave address (e.g., 0x50 - 0x57) */
// EEPROM Memory/Register Offsets
#define EEPROM_MAC_ADDR     0xFA    /* Target internal memory address */
#define MAC_SIZE            6       /* Number of bytes to write/read */
#define DATA_LENGTH         6       /* Number of bytes to write/read */

// SFPx I2C 7-bit Addresses
#define SFP1_AXI_ADDR       XPAR_AXI_IIC_1_BASEADDR
#define SFP2_AXI_ADDR       XPAR_AXI_IIC_2_BASEADDR
// SFP Memory / Register Offsets
#define SFP_STATIC_ADDR         0x50  // SFF-8472 SFP Static ID & Vendor Info EEPROM (A0h)
#define SPF_VENDOR_ADDR         0x14  // Vendor name EEPROM address offset
#define SPF_VENDOR_LENGTH       16    // Vendor name EEPROM length
#define SPF_VENDOR_OUI_ADDR     0x25  // Vendor OUI IEEE ID address offset
#define SPF_VENDOR_OUI_LENGTH   3     // Vendor OUI IEEE ID length
#define SPF_VENDOR_PN_ADDR      0x28  // Vendor Part Number address offset
#define SPF_VENDOR_PN_LENGTH    16    // Vendor Part Number length
#define SPF_VENDOR_REV_ADDR     0x38  // Vendor Revision address offset
#define SPF_VENDOR_REV_LENGTH   4     // Vendor Revision length
#define SPF_VENDOR_SN_ADDR      0x44  // Vendor Serial Number address offset
#define SPF_VENDOR_SN_LENGTH    16    // Vendor Serial length
#define SPF_VENDOR_DATE_ADDR    0x54  // Vendor Date Code address offset
#define SPF_VENDOR_DATE_LENGTH  8     // Vendor Date Code length
// SFP Diagnostic Register Offsets
#define SFP_DDMDOM_ADDR         0x51  // SFF-8472 SFP Diagnostic Info DDM/DOM (A2h)
#define SPF_TEMP_ADDR           0x60  // Temperature register offset
#define SPF_TEMP_LENGTH         2     // Temperature length
#define SPF_VOLTAGE_ADDR        0x62  // Supply Voltage register offset
#define SPF_VOLTAGE_LENGTH      2     // Supply Voltage length
#define SPF_TX_BIAS_ADDR        0x64  // TX Bias Current (2 uA) register offset
#define SPF_TX_BIAS_LENGTH      2     // TX Bias Current length
#define SPF_TX_POWER_ADDR       0x66  // TX Power (0.1uW) register offset
#define SPF_TX_POWER_LENGTH     2     // TX Power length
#define SPF_RX_POWER_ADDR       0x68  // RX Power (0.1uW) register offset
#define SPF_RX_POWER_LENGTH     2     // RX Powere length
#define SPF_CTRL_STAT_ADDR      0x6E  // Control & Status register offset
#define SPF_CTRL_STAT_LENGTH    1     // RX Powere length
#define SPF_ALARM_ADDR          0x70  // Alarm register offset
#define SPF_ALARM_LENGTH        2     // Alarm length
#define SPF_WARNING_ADDR        0x74  // Warning register offset
#define SPF_WARNING_LENGTH      2     // Warning length

// CS2000 address
#define CS2000_I2C_ADDR     0x4E   //AD0 = LOW
//CS2000 Registers       
#define CS2000_DEVICE_ID	0x01
#define CS2000_DEVICE_CTRL	0x02
#define CS2000_DEVICE_CFG1	0x03
#define CS2000_DEVICE_CFG2	0x04
#define CS2000_GLOBAL_CFG	0x05
#define CS2000_RATIO0		0x06
#define CS2000_RATIO1		0x0A
#define CS2000_RATIO2		0x0E
#define CS2000_RATIO3		0x12
#define CS2000_FUNCT_CFG1	0x16
#define CS2000_FUNCT_CFG2	0x17
#define CS2000_FUNCT_CFG3	0x1E

/* Set to 2 for larger EEPROMs (e.g., 24LC32, 24LC64), or 1 for <= 16Kb (e.g., 24LC02) */
#define ADDR_BYTE_LEN       1

//#define XIIC_RFD_REG_OFFSET 0x10                  // Provides the number of data bytes present in the Receive FIFO

// Function Prototypes
//int i2c_init(); // Needed for interrupt based version
int I2CWritePolled(UINTPTR AXIBusAddress, u8 IICAddress, u16 MemAddr, u8 *WriteBuf, u16 ByteCount);
int I2CReadPolled(UINTPTR AXIBusAddress, u8 IICAddress, u16 MemAddr, u8 *ReadBuf, u16 ByteCount);
int ReadMACAddress(void);
int cs2000_init(u8 mode);

#endif // I2C_H

#endif // __MICROBLAZE__