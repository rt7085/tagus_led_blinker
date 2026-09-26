#ifdef __MICROBLAZE__

#include "serial.h"


// Variables
XUartLite uart;
XUartLite_Config *uart_config;

extern XTmrCtr tmr;
extern XTmrCtr_Config *tmr_config;

// UART flags
volatile int TxPerfomed = 0;
volatile int RxPerfomed = 0;
uint8_t RxBuffer[1];

// Ring buffer variables
volatile char rx_buffer[BUFFER_SIZE];
volatile uint8_t rx_head = 0;
volatile uint8_t rx_tail = 0;


// Public Functions

int uart_init()
{
    int status = XST_SUCCESS;
    
    uart_config = XUartLite_LookupConfig(XPAR_XUARTLITE_0_BASEADDR);    
	status = XUartLite_Initialize(&uart, uart_config->RegBaseAddr);

    if(status == XST_SUCCESS)
		xil_printf("UART INIT SUCCESSFUL\n");
	else
		xil_printf("UART INIT FAILED\n");

    // Map application callbacks inside the UART Driver
    XUartLite_SetRecvHandler(&uart, uartRX_intcHandler, &uart);
    XUartLite_SetSendHandler(&uart, uartTX_intcHandler, &uart);

    // Enable UART internal interrupts
    XUartLite_EnableInterrupt(&uart);

    // Start a background receive so the RX FIFO triggers an interrupt on incoming data
    XUartLite_Recv(&uart, RxBuffer, 1);

    return XST_SUCCESS;
}

void uartRX_intcHandler()
{
    RxPerfomed = 1;
    // xil_printf("Uart Interrupt Occurred, RX\n");
}

void uartTX_intcHandler() 
{
    TxPerfomed = 1;
    // xil_printf("Uart Interrupt Occurred, TX\n");
}

// Non-blocking check for a full line
int get_line(char *line_out, uint8_t max_len) 
{
    static uint8_t line_idx = 0;

    // Handle the uart
    if (RxPerfomed) 
    {
        RxPerfomed = 0;

        uint8_t next_head = (rx_head + 1) % BUFFER_SIZE;
        if (next_head != rx_tail) {
            rx_buffer[rx_head] = RxBuffer[0];
            rx_head = next_head;
        }
        
        // Rearm UART Receiver for the next incoming character
        XUartLite_Recv(&uart, RxBuffer, 1);
    }
    
    while (rx_tail != rx_head) 
    {
        char c = rx_buffer[rx_tail];
        rx_tail = (rx_tail + 1) % BUFFER_SIZE;
        
        if (c == '\n' || c == '\r') {
            line_out[line_idx] = '\0';
            line_idx = 0;
            return 1; // Full command string ready
        } else if (line_idx < (max_len - 1)) {
            line_out[line_idx++] = c;
        }
    }  
    return 0; // Not yet received full command
}

// Parse and execute command
void process_command(char *line) {
    char *argv[MAX_ARGS];
    int argc = 0;
    
    char *token = strtok(line, " ");
    while (token != NULL && argc < MAX_ARGS) {
        argv[argc++] = token;
        token = strtok(NULL, " ");
    }
    
    // Empty line
    if (argc == 0){
        // line feed and drop a cursor arrow
        xil_printf("\n>");
        return; 
    } 
    
    // Search lookup table
    for (size_t i = 0; i < NUM_COMMANDS; i++) 
    {
        if (strcmp(argv[0], cmd_table[i].name) == 0) 
        {
            cmd_table[i].function(argc, argv);
            // line feed and drop a cursor arrow
            xil_printf("\n>");
            return;
        }
    }
    xil_printf("\nUnknown command: %s", argv[0]);
    // line feed and drop a cursor arrow
    xil_printf("\n>");
}

// Command implementations 
void cmd_help() 
{
    xil_printf("\nAvailable commands:");
    for (size_t i = 0; i < NUM_COMMANDS; i++) {
        xil_printf("\n%s - %s", cmd_table[i].name, cmd_table[i].help);
    }
}

void cmd_bram_test() 
{  
    unsigned int *baseaddr;
    unsigned int maxlocations;
    
    u32 data_pattern = 0xFFFFF000;
    
    u32 data_read = 0;
    u32 data_written = 0;
    u32 i = 0;
    u32 errors = 0;
    
    u32 StartTicks, EndTicks, TotalTicks;
    double TotalBytesTransferred, DurationSec, BandwidthMBs;
        
    // Write and Read to BRAM (Example: Memory size is 8k (1FFF hex), so depth is 8192 / 32 bits = 2048 locations) 
    baseaddr = (unsigned int *)XPAR_XBRAM_0_BASEADDR;
    maxlocations = (XPAR_XBRAM_0_HIGHADDR - XPAR_XBRAM_0_BASEADDR + 1) / (XPAR_XBRAM_0_DATA_WIDTH / 8);
   
    xil_printf("\nRunning full BRAM test... please wait:");

    // NOTE: Literature suggests to apply an offset of 4 to a data location, but it seems correct without using xsdb mrd checks
    // Upon checking Xil_Out32() it appears the compiler handles it with volatile u32 pointer arithmetic which automatically applies offsets of 4
    
    // Arm timer 1
    XTmrCtr_Reset(&tmr, TIMER_ID_1);
    StartTicks = XTmrCtr_GetValue(&tmr, TIMER_ID_1);
    XTmrCtr_Start(&tmr, TIMER_ID_1);
    
    // Write to BRAM
    xil_printf("\nWriting %d memory locations...", maxlocations);
    for(i = 0 ; i < maxlocations; i++)
    {
        Xil_Out32((UINTPTR)(baseaddr + i), data_pattern+i);
    }
    
    // 4. End measurement
    XTmrCtr_Stop(&tmr, TIMER_ID_1);
    EndTicks = XTmrCtr_GetValue(&tmr, TIMER_ID_1);

    // Calculate Metrics
    TotalTicks = EndTicks - StartTicks;
    DurationSec = (double)TotalTicks / (double)AXI_TIMER_FREQ;
    
    // Bandwidth = (Written Bytes) / Time
    // 1 MB = 1,048,576 bytes (1024 * 1024)
    TotalBytesTransferred = (double)(maxlocations * (XPAR_XBRAM_0_DATA_WIDTH / 8));
    // u64 TotalBytesTransferred = (u64)maxlocations * 4; //(XPAR_XBRAM_0_DATA_WIDTH / 8);

    // Calculate MB (Integer and Fractional parts)
    // u64 MB_integer = TotalBytesTransferred / 1048576;
    // u64 MB_fraction = ((TotalBytesTransferred % 1048576) * 100) / 1048576; // 2 decimal places

    // Calculate Execution Time in seconds (Integer and Fractional parts)
    // u32 TimerFrequencyHz = AXI_TIMER_FREQ;
    // u64 DurationSec_integer = TotalTicks / TimerFrequencyHz;
    // u64 DurationSec_fraction = ((TotalTicks % TimerFrequencyHz) * 1000000) / TimerFrequencyHz; // 6 decimal places

    
    BandwidthMBs = (TotalBytesTransferred / (1024.0 * 1024.0)) / DurationSec;
    // Calculate Memory Bandwidth in MB/s (Integer and Fractional parts)
    // Bandwidth = TotalBytesTransferred / (1048576 * DurationSec)
    // To prevent integer division from dropping to 0, we scale up the numerator first.
    // We use a 3-step scale up to avoid 64-bit overflow during the multiplication.
    // u64 Bandwidth_scaled = (TotalBytesTransferred * TimerFrequencyHz) / 1048576; 
    // u64 BandwidthMBs_integer = Bandwidth_scaled / TotalTicks;
    // u64 BandwidthMBs_fraction = ((Bandwidth_scaled % TotalTicks) * 100) / TotalTicks; // 2 decimal places

    // Report write time metrics
    // Use printf() for floats, not xil_printf()
    printf("\nData Size:        %.2f MB", (double)(TotalBytesTransferred / (1024.0 * 1024.0)));
    printf("\nAXI Timer Ticks:  %lu", (unsigned long)TotalTicks);
    printf("\nExecution Time:   %.6f seconds", DurationSec);
    printf("\nMemory Bandwidth: %.2f MB/s", BandwidthMBs);

/*
    xil_printf("\nData Size: %llu.%02llu MB", MB_integer, MB_fraction);
    xil_printf("\nAXI Timer Ticks: %llu", (u64)TotalTicks);
    xil_printf("\nExecution Time: %llu.%06llu seconds", DurationSec_integer, DurationSec_fraction);
    xil_printf("\nMemory Bandwidth: %llu.%02llu MB/s", BandwidthMBs_integer, BandwidthMBs_fraction);
 */ 
    
    // Read and compare
    xil_printf("\nReading and comparing %d memory locations...", maxlocations);
    for(i = 0; i< maxlocations; i++)
    {
        data_written = data_pattern + i;
        
        data_read = Xil_In32((UINTPTR)(baseaddr + i));
        if (data_read != data_written) 
        {
            xil_printf("\nERROR at Addr 0x%08X: Written: 0x%08X, Read: 0x%08X\r\n", baseaddr + i, data_written, data_read);
            errors++;
        }
    }           
        
    // Report
    if (errors == 0) {
        xil_printf("\nMemory test PASSED");
    } else {
        xil_printf("\nMemory test FAILED at %d locations(s)", errors);
    }
    
    return;
}

void cmd_sram_test(int argc, char *argv[]) 
{
    unsigned int *data;
    u32 data_pattern = 0xFFFFF000;
    
    u32 data_read = 0;
    u32 i = 0;
    
    if (argc < 2) 
    {
        xil_printf("\nError: Missing arguments. Usage: sramtest count");
    }
    else
    {
        xil_printf("\nSDRAM test:");
        for (int i = 1; i < argc ;i++)
        {
            xil_printf("\nArgument %d: %s",i, argv[i]);
        }

        // Read and Write to the SDRAM
        data = (unsigned int *)XPAR_MIG_0_BASEADDRESS;

        // Flush cache before interacting with external memory to prevent data corruption
        Xil_DCacheFlushRange(XPAR_MIG_0_BASEADDRESS, sizeof(u32));

        // Write to SDRAM
        for(i = 0 ; i < 2047; i++)
        {
            Xil_Out32((UINTPTR)(data + i), data_pattern+i+1);
        }
        xil_printf("DATA WRITE SUCCESSFUL : XIL_IO METHOD\n");

        // Read from SDRAM
        for(i = 0; i< 31; i++)
        {
            data_read =  Xil_In32((UINTPTR)(data + i));
            xil_printf("Location: %08X: Value: : %08X\n", data+i, data_read);
        }
        xil_printf("DATA READ SUCCESSFUL : XIL_IO METHOD\n");
        
    }
    return;
}

#endif // __MICROBLAZE__