#include "serial.h"  // Always include its own header first to verify it compiles standalone

// Variables
XUartLite uart;
XUartLite_Config *uart_config;

// UART flags
volatile int TxPerfomed = 0;
volatile int RxPerfomed = 0;
uint8_t RxBuffer[1];

// Ring buffer variables
volatile char rx_buffer[BUFFER_SIZE];
volatile uint8_t rx_head = 0;
volatile uint8_t rx_tail = 0;

// Private Helper Function (Cannot be accessed by main.c)


// Public Functions

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

// Command implementations
void cmd_bram_test(int argc, char *argv[]) 
{
        if (argc < 2) 
        {
            xil_printf("\nError: Missing arguments. Usage: bramtest count");
        }
        else
        {
            xil_printf("\nBRAM test:");
            for (int i = 1; i < argc ;i++)
            {
                xil_printf("\nArgument %d: %s",i, argv[i]);
            }
        }
        return;
}

void cmd_sram_test(int argc, char *argv[]) 
{
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
        }
        return;
}