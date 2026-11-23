#ifdef __MICROBLAZE__

#include "i2c.h"

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

int cs2000_init(void)
{
    int status;
    u8 ReadBytes[4]  = {0}; 
    
    status = I2CReadPolled(XPAR_AXI_IIC_3_BASEADDR , CS2000_I2C_ADDR, CS2000_DEVICE_ID , ReadBytes, 1);
    if (status != XST_SUCCESS) {
        xil_printf("\nCS2000 Read Failed!");
        return XST_FAILURE;
    }

    xil_printf("\nCS2000 Device ID: %02X", ReadBytes[0]);

    return XST_SUCCESS;
}


#endif // __MICROBLAZE__