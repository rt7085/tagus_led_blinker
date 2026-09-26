#ifndef TIMER_H
#define TIMER_H

#ifdef __MICROBLAZE__

// Includes
#include <xil_types.h>
#include "xintc.h"
#include "xtmrctr.h"
#include "xil_printf.h"
#include "xparameters.h"

// Constants and macros
#define TIMER_ID_0 0 // Used for timer interrupt or FSM on a 100 MHz clock
#define TIMER_ID_1 1 // Used for cycle count based time measurements on a 100 MHz clock
#define AXI_TIMER_FREQ   XPAR_XTMRCTR_0_CLOCK_FREQUENCY


// Function prototypes
void tmr_intcHandler();
void tmr_init();


#endif // TIMER_H

#endif // __MICROBLAZE__