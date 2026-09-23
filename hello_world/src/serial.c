#include "serial.h"  // Always include its own header first to verify it compiles standalone

// Variables
extern XUartLite uart;
extern XUartLite_Config *uart_config;

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
    
    // Simple echo: Send back what was just received
    // XUartLite_Send(&uart, RxBuffer, 1);
}

void uartTX_intcHandler() 
{
    TxPerfomed = 1;
    // xil_printf("Uart Interrupt Occurred, TX\n");
}

// Call this inside your UART RX Interrupt
void UART_Receive_ISR(char incoming_char) {

}

// Non-blocking check for a full line
int get_line(char *line_out, uint8_t max_len) {
    
    static uint8_t line_idx = 0;

    // Handle the uart
    if (RxPerfomed) {
        RxPerfomed = 0;

        uint8_t next_head = (rx_head + 1) % BUFFER_SIZE;
        if (next_head != rx_tail) {
            rx_buffer[rx_head] = RxBuffer;
            rx_head = next_head;
        }
        
        // Rearm UART Receiver for the next incoming character
        XUartLite_Recv(&uart, RxBuffer, 1);
    }
    
    while (rx_tail != rx_head) {
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

    XUartLite_Recv(&uart, RxBuffer, 1);
    
    return 0;
}