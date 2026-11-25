#ifdef __MICROBLAZE__

#include "i2c.h"
#include "sleep.h"
#include <math.h>

// Functions

int I2CWritePolled(UINTPTR AXIBusAddress, u8 IICAddress, u16 MemAddr, u8 *WriteBuf, u16 ByteCount) {
    u8 TxBuffer[ADDR_BYTE_LEN + DATA_LENGTH];
    u8 SentCount;

    /* 1. Load internal EEPROM memory address into the start of the buffer */
#if (ADDR_BYTE_LEN == 2)
    TxBuffer[0] = (u8)(MemAddr >> 8);   /* High byte */
    TxBuffer[1] = (u8)(MemAddr & 0xFF); /* Low byte */
#else
    TxBuffer[0] = (u8)(MemAddr & 0xFF); /* Single byte */
#endif

    /* 2. Copy payload data immediately after the address bytes */
    for (int i = 0; i < ByteCount; i++) {
        TxBuffer[ADDR_BYTE_LEN + i] = WriteBuf[i];
    }

    /* 3. Blocking send: Address + Data with STOP condition (XIIC_STOP) */
    SentCount = XIic_Send(AXIBusAddress,
                          IICAddress,
                          TxBuffer,
                          ADDR_BYTE_LEN + ByteCount,
                          XIIC_STOP);

    if (SentCount != (ADDR_BYTE_LEN + ByteCount)) {
        return XST_FAILURE;
    }

    /* 4. Wait for internal EEPROM write cycle to complete (typically 5ms - 10ms) */
    usleep(10000);

    return XST_SUCCESS;
}


int I2CReadPolled(UINTPTR AXIBusAddress, u8 IICAddress, u16 MemAddr, u8 *ReadBuf, u16 ByteCount) {
    u8 AddrBuffer[ADDR_BYTE_LEN];
    unsigned int SentCount;
    unsigned int RecvCount;

    /* 1. Prepare the internal memory address for the dummy write */
#if (ADDR_BYTE_LEN == 2)
    AddrBuffer[0] = (u8)(MemAddr >> 8);
    AddrBuffer[1] = (u8)(MemAddr & 0xFF);
#else
    AddrBuffer[0] = (u8)(MemAddr & 0xFF);
#endif

    /* 2. Dummy Write: Send target memory address. 
     * Use XIIC_REPEATED_START to keep bus ownership, or XIIC_STOP depending on EEPROM */
    SentCount = XIic_Send(AXIBusAddress,
                          IICAddress,
                          AddrBuffer,
                          ADDR_BYTE_LEN,
                          XIIC_STOP);

    if (SentCount != ADDR_BYTE_LEN) {
        return XST_FAILURE;
    }

    /* 3. Read Data: Clock out the requested number of bytes and issue STOP */
    RecvCount = XIic_Recv(AXIBusAddress,
                          IICAddress,
                          ReadBuf,
                          ByteCount,
                          XIIC_STOP);

    if (RecvCount != ByteCount) {
        return XST_FAILURE;
    }

    return XST_SUCCESS;
}


int ReadMACAddress(void)
{
    int status;
    u8 ReadBytes[MAC_SIZE]  = {0}; 

    /* Read data back from EEPROM */
    status = I2CReadPolled(XPAR_AXI_IIC_0_BASEADDR, EEPROM_I2C_ADDR, EEPROM_MAC_ADDR, ReadBytes, MAC_SIZE);
    if (status != XST_SUCCESS) {
        xil_printf("\nEEPROM MAC Read Failed!");
        return XST_FAILURE;
    }

    xil_printf("\nMAC: %02X:%02X:%02X:%02X:%02X:%02X", 
                ReadBytes[0], ReadBytes[1], ReadBytes[2], 
                ReadBytes[3], ReadBytes[4], ReadBytes[5]);

    return XST_SUCCESS;
}

int cs2000_init(u8 mode, u32 samplerate) // master = 0, subordinate = 1
{
    int status;
    int error = 0;
    u8 WriteData[5] = {0};
    u8 ReadBytes[5] = {0}; 
    
    status = I2CReadPolled(XPAR_AXI_IIC_3_BASEADDR, CS2000_I2C_ADDR, CS2000_DEVICE_ID , ReadBytes, 1);
    if (status != XST_SUCCESS) {
        error = 1;
    }
    //xil_printf("\nCS2000 Device ID: %02X", ReadBytes[0]);

    // Reset the CS2000
    WriteData[0] = 0x00; 
    status = I2CWritePolled(XPAR_AXI_IIC_3_BASEADDR, CS2000_I2C_ADDR, CS2000_GLOBAL_CFG, WriteData, 1);
    if (status != XST_SUCCESS) {
        error = 1;
    }
    usleep(10000); //10ms delay

    WriteData[0] = 0x09; // Set Freeze, EnDevCfg2
    status = I2CWritePolled(XPAR_AXI_IIC_3_BASEADDR, CS2000_I2C_ADDR, CS2000_GLOBAL_CFG, WriteData, 1);
    if (status != XST_SUCCESS) {
        error = 1;
    }
    
    WriteData[0] = 0x00; // Aux Out, ClockOut Enable
    status = I2CWritePolled(XPAR_AXI_IIC_3_BASEADDR, CS2000_I2C_ADDR, CS2000_DEVICE_CTRL, WriteData, 1);
    if (status != XST_SUCCESS) {
        error = 1;
    }      

    WriteData[0] = 0x07; // Aux Out = PLL Lock Status, EnDevCfg1
    status = I2CWritePolled(XPAR_AXI_IIC_3_BASEADDR, CS2000_I2C_ADDR, CS2000_DEVICE_CFG1, WriteData, 1);
    if (status != XST_SUCCESS) {
        error = 1;
    }

    if (mode == 0) // master mode
    {
        WriteData[0] = 0x00; // Synthezier mode: Static Ratio
        status = I2CWritePolled(XPAR_AXI_IIC_3_BASEADDR, CS2000_I2C_ADDR, CS2000_DEVICE_CFG2, WriteData, 1);
        if (status != XST_SUCCESS) {
            error = 1;
        }   
        
        // Caluclate ration
		u32 ratio = ((double)(512*samplerate)/(double)(CS2000_REF_CLK))*pow((double)2,20);
		 
/*      //DEBUG
        xil_printf("\nRATIO: 0x%02X 0x%02X 0x%02X 0x%02X = %d",
           (ratio >> 24) & 0xFF,
           (ratio >> 16) & 0xFF,
           (ratio >> 8)  & 0xFF,
           ratio & 0xFF, 
           ratio);

        // 48k -    > 24.5760   = 0x00 0x0f 0xba 0x88
		// 44.1k    -> 22.5792  = 0x00 0x0e 0x73 0x60
		// 32k      -> 16.3840  = 0x00 0x0a 0x7c 0x5a
*/
		WriteData[0] = ratio>>24;
		WriteData[1] = (ratio & 0xFF0000)>>16;
		WriteData[2] = (ratio & 0xFF00)>>8;
		WriteData[3] = ratio & 0xFF;   
        status = I2CWritePolled(XPAR_AXI_IIC_3_BASEADDR, CS2000_I2C_ADDR, (0x80 | CS2000_RATIO0), WriteData, 4);
        if (status != XST_SUCCESS) {
            error = 1;
        }      

        WriteData[0] = 0x08; // 
        status = I2CWritePolled(XPAR_AXI_IIC_3_BASEADDR, CS2000_I2C_ADDR, CS2000_FUNCT_CFG1, WriteData, 1);
        if (status != XST_SUCCESS) {
            error = 1;
        }  

        WriteData[0] = 0x08; // 
        status = I2CWritePolled(XPAR_AXI_IIC_3_BASEADDR, CS2000_I2C_ADDR, CS2000_FUNCT_CFG2, WriteData, 1);
        if (status != XST_SUCCESS) {
            error = 1;
        }  
   
        WriteData[0] = 0x00; // 
        status = I2CWritePolled(XPAR_AXI_IIC_3_BASEADDR, CS2000_I2C_ADDR, CS2000_FUNCT_CFG3, WriteData, 1);
        if (status != XST_SUCCESS) {
            error = 1;
        }  

        WriteData[0] = 0x01; // 
        status = I2CWritePolled(XPAR_AXI_IIC_3_BASEADDR, CS2000_I2C_ADDR, CS2000_GLOBAL_CFG, WriteData, 1);
        if (status != XST_SUCCESS) {
            error = 1;
        }       
        
    }   
    else // subordinate mode
    {
        WriteData[0] = 0x01; // PLL mode
        status = I2CWritePolled(XPAR_AXI_IIC_3_BASEADDR, CS2000_I2C_ADDR, CS2000_DEVICE_CFG2, WriteData, 1);
        if (status != XST_SUCCESS) {
            error = 1;
        }   
        
        WriteData[0] = 0x20; //512x
        WriteData[1] = 0x00;
        WriteData[2] = 0x00;
        WriteData[3] = 0x00;
        status = I2CWritePolled(XPAR_AXI_IIC_3_BASEADDR, CS2000_I2C_ADDR, (0x80 | CS2000_RATIO0), WriteData, 4);
        if (status != XST_SUCCESS) {
            error = 1;
        }      

        WriteData[0] = 0x08; // 
        status = I2CWritePolled(XPAR_AXI_IIC_3_BASEADDR, CS2000_I2C_ADDR, CS2000_FUNCT_CFG1, WriteData, 1);
        if (status != XST_SUCCESS) {
            error = 1;
        }  

        WriteData[0] = 0x08; // 
        status = I2CWritePolled(XPAR_AXI_IIC_3_BASEADDR, CS2000_I2C_ADDR, CS2000_FUNCT_CFG2, WriteData, 1);
        if (status != XST_SUCCESS) {
            error = 1;
        }  

        WriteData[0] = 0x00; // 
        status = I2CWritePolled(XPAR_AXI_IIC_3_BASEADDR, CS2000_I2C_ADDR, CS2000_FUNCT_CFG3, WriteData, 1);
        if (status != XST_SUCCESS) {
            error = 1;
        }  

        WriteData[0] = 0x01; // 
        status = I2CWritePolled(XPAR_AXI_IIC_3_BASEADDR, CS2000_I2C_ADDR, CS2000_GLOBAL_CFG, WriteData, 1);
        if (status != XST_SUCCESS) {
            error = 1;
        }        
    }

    if (error) 
    {
        xil_printf("\nError: CS2000 configuration error");
        return XST_FAILURE;
    }
    
    if (mode == 0)
    {
        xil_printf("\nCS2000 INIT SUCCESFUL (SYNTHESIZER MODE, FS = %d)", samplerate);
    }
    else
    {
        xil_printf("\nCS2000 INIT SUCCESFUL (PLL MODE, FS = %d)", samplerate);
    }
    
    return XST_SUCCESS;
}


#endif // __MICROBLAZE__