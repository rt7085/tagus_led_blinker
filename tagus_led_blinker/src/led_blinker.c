#define __MICROBLAZE__

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
//#include "xparameters.h"
#include "xgpio.h"
#include "sleep.h"

XGpio Gpio; // Instance of the GPIO Driver

int main() {
    // Initialize GPIO using the base address from xparameters.h
    XGpio_Config *ConfigPtr = XGpio_LookupConfig(XPAR_AXI_GPIO_0_BASEADDR);
    XGpio_CfgInitialize(&Gpio, ConfigPtr, ConfigPtr->BaseAddress);

    init_platform();

    print("Hello World from Led blinker\n\r");
    print("Successfully ran Hello World application\n\r");

    // Set Channel 1 as output (0 mask = output)
    XGpio_SetDataDirection(&Gpio, 1, 0x0);

    while (1) {
        XGpio_DiscreteWrite(&Gpio, 1, 0x1); // LED ON
        usleep(1000000);                     // 500ms delay
        XGpio_DiscreteWrite(&Gpio, 1, 0x0); // LED OFF
        usleep(1000000);
    }

    cleanup_platform();
    
    return 0;
}