/******************************************************************************
* Copyright (C) 2023 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/
/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

 #define __MICROBLAZE__

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"

//#include "xparameters.h"
#include "xgpio.h"
#include "sleep.h"

XGpio Gpio; // Instance of the GPIO Driver

int main()
{
    // Initialize GPIO using the base address from xparameters.h
    XGpio_Config *ConfigPtr = XGpio_LookupConfig(XPAR_AXI_GPIO_0_BASEADDR);
    XGpio_CfgInitialize(&Gpio, ConfigPtr, ConfigPtr->BaseAddress);

    init_platform();

    print("Hello World from updated app 1\n\r");
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
