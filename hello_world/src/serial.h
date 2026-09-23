#ifndef SERIAL_H
#define SERIAL_H

#include <xil_types.h>
#include "xuartlite.h"
#include "xil_printf.h"
#include "xparameters.h"

// Constants / Macros
#define BUFFER_SIZE 64
#define MAX_ARGS 4

// Function Prototypes
void uartRX_intcHandler();
void uartTX_intcHandler();

#endif // SERIAL_H
