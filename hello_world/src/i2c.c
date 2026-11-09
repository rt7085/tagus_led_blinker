#ifdef __MICROBLAZE__

#include "i2c.h"


// Variables
XIic i2c0;  // Instance of the IIC Device
XIic_Config *i2c0_config;



// Public Functions
int i2c_init()
{
    u8 write_buffer[1];
    u8 mac_address[MAC_ADDR_LEN];
    
    int status = XST_SUCCESS;
    
    i2c0_config = XIic_LookupConfig(XPAR_AXI_IIC_0_BASEADDR);
    status = XIic_CfgInitialize(&i2c0, i2c0_config, i2c0_config->BaseAddress);
 
    if(status == XST_SUCCESS)
		xil_printf("I2C0 (EEPROM) INIT SUCCESSFUL\n");
	else
		xil_printf("I2C0 (EEPROM) INIT FAILED\n");

    // Start the i2c peripheral
    XIic_Start(&i2c0);

    // Set the 7-bit slave address of the target EEPROM
    status = XIic_SetAddress(&i2c0, XII_ADDR_TO_SEND_TYPE, EEPROM_I2C_ADDRESS);
    if (status != XST_SUCCESS) {
        xil_printf("Error: Setting I2C Address failed\r\n");
        return XST_FAILURE;
    }

    // 5. Send the internal memory pointer (offset 0xFA) to the EEPROM
    write_buffer[0] = MAC_START_OFFSET;
    
    // XIic_MasterSend transmits the offset; we don't send a STOP condition yet
    // so we can execute a repeated START for the read phase.
    status = XIic_MasterSend(&i2c0, write_buffer, 1);
    if (status != XST_SUCCESS) {
        xil_printf("Error: Failed to send EEPROM memory offset\r\n");
        return XST_FAILURE;
    }

    // 6. Read the 6-byte MAC address into our buffer
    status = XIic_MasterRecv(&i2c0, mac_address, MAC_ADDR_LEN);
    if (status != XST_SUCCESS) {
        xil_printf("Error: Failed to receive MAC address bytes\r\n");
        return XST_FAILURE;
    }

    if (status == XST_SUCCESS) {
        xil_printf("\nMAC: ");
        xil_printf("%02X:%02X:%02X:%02X:%02X:%02X", 
                   mac_address[0], mac_address[1], mac_address[2], 
                   mac_address[3], mac_address[4], mac_address[5]);
    } else {
        xil_printf("Failed to read MAC address from EEPROM.\r\n");
    }

    return XST_SUCCESS;
}




#endif // __MICROBLAZE__