#ifndef INTERRUPT_H
#define INTERRUPT_H

#ifdef __MICROBLAZE__

// Includes
#include "xintc.h"
#include "xuartlite.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "timer.h"

// Constants and macros


// Function prototypes
int intc_init();


#endif // INTERRUPT_H

#endif // __MICROBLAZE__