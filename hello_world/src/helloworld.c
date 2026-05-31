#define __MICROBLAZE__

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xgpio.h"
#include "sleep.h"

#define ALL_LEDS_OFF 0x7
#define RED_LED_ON 0x6
#define GREEN_LED_ON 0x5
#define BLUE_LED_ON 0x3

XGpio Gpio; // Instance of the GPIO Driver

int main()
{
    // Initialize GPIO using the base address from xparameters.h
    XGpio_Config *ConfigPtr = XGpio_LookupConfig(XPAR_AXI_GPIO_0_BASEADDR);
    XGpio_CfgInitialize(&Gpio, ConfigPtr, ConfigPtr->BaseAddress);

    init_platform();

    print("Led Blinker Applications Started...\n\r");

    // Set Channel 1 as output (0 mask = output)
    XGpio_SetDataDirection(&Gpio, 1, 0x0);
    XGpio_DiscreteWrite(&Gpio, 1, 0x7); // each bit is an LED


    while (1) {
        XGpio_DiscreteWrite(&Gpio, 1, BLUE_LED_ON); // LED ON
        usleep(1000000);                     // 500ms delay
        XGpio_DiscreteWrite(&Gpio, 1, ALL_LEDS_OFF); // LED OFF
        usleep(1000000);
    }


    cleanup_platform();
    
    return 0;

    
}
