#ifndef SERIAL_H
#define SERIAL_H

#include <xil_types.h>
#include "xuartlite.h"
#include "xil_printf.h"
#include "xparameters.h"

// Constants / Macros
#define BUFFER_SIZE 64
#define MAX_ARGS 4

// Command function pointer type
typedef void (*cmd_fn_t)(int argc, char *argv[]);

// Forward declarations of command handlers
static void cmd_help(int argc, char *argv[]);
//static void cmd_set_led(int argc, char *argv[]);

// Command mapping structure
typedef struct {
    const char *name;
    cmd_fn_t function;
    const char *help;
} cmd_entry_t;

// Registry of available commands
static const cmd_entry_t cmd_table[] = {
    {"help",     cmd_help,     "Displays available commands"}//,
    //{"set_led",  cmd_set_led,  "Usage: set_led <on/off>"}
};
#define NUM_COMMANDS (sizeof(cmd_table) / sizeof(cmd_table[0]))

// Function Prototypes
void uartRX_intcHandler();
void uartTX_intcHandler();
int get_line(char *line_out, uint8_t max_len);
void process_command(char *line); 
//static void cmd_help(int argc, char *argv[]);

#endif // SERIAL_H
