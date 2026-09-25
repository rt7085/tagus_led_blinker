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
void cmd_help();
void cmd_bram_test(int argc, char *argv[]);
void cmd_sram_test(int argc, char *argv[]);

// Command mapping structure
typedef struct {
    const char *name;
    cmd_fn_t function;
    const char *help;
} cmd_entry_t;

// Registry of available commands
static const cmd_entry_t cmd_table[] = 
{
    {"help",       cmd_help,        "Displays available commands"},
    {"bramtest",   cmd_bram_test,   "Usage: bramtest"},
    {"sramtest",   cmd_sram_test,   "Usage: sramtest"}
};
#define NUM_COMMANDS (sizeof(cmd_table) / sizeof(cmd_table[0]))

// Function Prototypes
void uartRX_intcHandler();
void uartTX_intcHandler();
int get_line(char *line_out, uint8_t max_len);
void process_command(char *line); 

#endif // SERIAL_H
