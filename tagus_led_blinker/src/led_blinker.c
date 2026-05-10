#define __MICROBLAZE__

#include "xgpio.h"
#include "xparameters.h"
#include "sleep.h"

XGpio Gpio; // Instance of the GPIO Driver

int main() {
    // Initialize GPIO using the base address from xparameters.h
    XGpio_Config *ConfigPtr = XGpio_LookupConfig(XPAR_AXI_GPIO_0_BASEADDR);
    XGpio_CfgInitialize(&Gpio, ConfigPtr, ConfigPtr->BaseAddress);

    // Set Channel 1 as output (0 mask = output)
    XGpio_SetDataDirection(&Gpio, 1, 0x0);

    while (1) {
        XGpio_DiscreteWrite(&Gpio, 1, 0x1); // LED ON
        usleep(1000000);                     // 500ms delay
        XGpio_DiscreteWrite(&Gpio, 1, 0x0); // LED OFF
        usleep(1000000);
    }
    return 0;
}