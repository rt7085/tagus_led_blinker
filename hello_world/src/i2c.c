#ifdef __MICROBLAZE__

#include "i2c.h"


int EepromWritePolled(u16 MemAddr, u8 *WriteBuf, u16 ByteCount) {
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
    SentCount = XIic_Send(IIC_BASE_ADDRESS,
                          EEPROM_I2C_ADDR,
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


int EepromReadPolled(u16 MemAddr, u8 *ReadBuf, u16 ByteCount) {
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
    SentCount = XIic_Send(IIC_BASE_ADDRESS,
                          EEPROM_I2C_ADDR,
                          AddrBuffer,
                          ADDR_BYTE_LEN,
                          XIIC_STOP);

    if (SentCount != ADDR_BYTE_LEN) {
        return XST_FAILURE;
    }

    /* 3. Read Data: Clock out the requested number of bytes and issue STOP */
    RecvCount = XIic_Recv(IIC_BASE_ADDRESS,
                          EEPROM_I2C_ADDR,
                          ReadBuf,
                          ByteCount,
                          XIIC_STOP);

    if (RecvCount != ByteCount) {
        return XST_FAILURE;
    }

    return XST_SUCCESS;
}


#endif // __MICROBLAZE__