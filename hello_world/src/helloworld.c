#ifdef __MICROBLAZE__

#include <xil_types.h>
#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xgpio.h"
#include "xbram.h"
#include "xil_cache.h"
#include "xil_io.h"
#include "sleep.h"
#include "xintc.h"
#include "xil_exception.h"
#include "xtmrctr.h"


#define ALL_LEDS_OFF 0x7
#define RED_LED_ON 0x6
#define GREEN_LED_ON 0x5
#define BLUE_LED_ON 0x3

XIntc intc;
XIntc_Config *xintc_config;

XTmrCtr tmr;
XTmrCtr_Config *tmr_config;

XGpio Gpio; 
XGpio_Config *Gpio_config;

XBram bram;
XBram_Config *bram_config;

void intcHandler()
{
	XIntc_Acknowledge(&intc, xintc_config->BaseAddress);
    while(!XTmrCtr_IsExpired(&tmr,0)) {
    };
	xil_printf("Interrupt Occurred\n");
	XTmrCtr_Reset(&tmr, 0);
}

void tmr_init()
{
    tmr_config = XTmrCtr_LookupConfig(XPAR_AXI_TIMER_0_BASEADDR);
	int status = XTmrCtr_Initialize(&tmr, tmr_config->BaseAddress);
 
	if(status == XST_SUCCESS)
		xil_printf("TMR INIT SUCCESSFUL\n");
	else
		xil_printf("TMR INIT FAILED\n");
}

void intc_init()
{ 
	xintc_config = XIntc_LookupConfig(XPAR_AXI_INTC_0_BASEADDR);
    int status = XIntc_Initialize(&intc, xintc_config->BaseAddress);
 
	if(status == XST_SUCCESS)
		xil_printf("INTC INIT SUCCESSFUL\n");
	else
		xil_printf("INTC INIT FAILED\n");
 
	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XIntc_InterruptHandler, &intc);
	Xil_ExceptionEnable();
 
	XIntc_Connect(&intc, XPAR_FABRIC_AXI_TIMER_0_INTR, (XInterruptHandler)intcHandler, &tmr);
	XIntc_Enable(&intc, XPAR_FABRIC_AXI_TIMER_0_INTR);
	XIntc_Start(&intc, XIN_REAL_MODE);
}

void bram_init()
{
   bram_config = XBram_LookupConfig(XPAR_AXI_BRAM_CTRL_0_BASEADDR);
   int status = XBram_CfgInitialize(&bram, bram_config, bram_config->CtrlBaseAddress);
 
   if(status == XST_SUCCESS)
       xil_printf("BRAM INIT SUCCESSFUL\n");
   else
       xil_printf("BRAM INIT FAILED\n");
 
   status = XBram_SelfTest(&bram, 0);
 
   if(status == XST_SUCCESS)
       xil_printf("BRAM SELF TEST SUCCESSFUL\n");
   else
       xil_printf("BRAM SELF TEST FAILED\n");
 
}

void gpio_init()
{
    // Initialize GPIO using the base address from xparameters.h
    Gpio_config = XGpio_LookupConfig(XPAR_AXI_GPIO_0_BASEADDR);
    XGpio_CfgInitialize(&Gpio, Gpio_config, Gpio_config->BaseAddress);
}

int main()
{
    init_platform();
    intc_init();
    tmr_init();
    
    gpio_init();
    bram_init();

    unsigned int *data;
    u32 data_read = 0;
    u32 i = 0;

    print("Led Blinker Applications Started...\n\r");

    // Write and Read to BRAM (depth is 2048 x 32 bits)
    data = (unsigned int *)XPAR_XBRAM_0_BASEADDR;

    u32 data_pattern = 0xFFFFF000;
 
    // Literature suggests to apply an offset of 4 to a data location, but it seems correct without using xsdb mrd checks
    // Upon checking Xil_Out32() it appears the compiler handles it with volatile u32 pointer arithmetic which automatically applies offsets of 4
    for(i = 0 ; i < 2047; i++)
    {
        Xil_Out32((UINTPTR)(data + i), data_pattern+i+1);
    }
    xil_printf("DATA WRITE SUCCESSFUL : XIL_IO METHOD\n");
 
    for(i = 0; i< 31; i++)
    {
        data_read =  Xil_In32((UINTPTR)(data + i));
        xil_printf("Location: %08X: Value: : %08X\n", data+i, data_read);
    }
    xil_printf("DATA READ SUCCESSFUL : XIL_IO METHOD\n");


    // Read and Write to the SDRAM
    data = (unsigned int *)XPAR_MIG_0_BASEADDRESS;

    // Flush cache before interacting with external memory to prevent data corruption
    Xil_DCacheFlushRange(XPAR_MIG_0_BASEADDRESS, sizeof(u32));

    // Write to SDRAM
    for(i = 0 ; i < 2047; i++)
    {
        Xil_Out32((UINTPTR)(data + i), data_pattern+i+1);
    }
    xil_printf("DATA WRITE SUCCESSFUL : XIL_IO METHOD\n");

    // Read from SDRAM
    for(i = 0; i< 31; i++)
    {
        data_read =  Xil_In32((UINTPTR)(data + i));
        xil_printf("Location: %08X: Value: : %08X\n", data+i, data_read);
    }
    xil_printf("DATA READ SUCCESSFUL : XIL_IO METHOD\n");
    
    // Set up timer interrupt
    XTmrCtr_Stop(&tmr, 0);

    u32 option = XTmrCtr_GetOptions(&tmr, 0);
    XTmrCtr_SetOptions(&tmr, 0, option | XTC_DOWN_COUNT_OPTION | XTC_INT_MODE_OPTION);

    XTmrCtr_SetResetValue(&tmr, 0, 100000000); // Time divided by 100 MHz, so 1 sec

    XTmrCtr_Reset(&tmr, 0);
    XTmrCtr_Start(&tmr, 0);

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

#endif // __MICROBLAZE__
