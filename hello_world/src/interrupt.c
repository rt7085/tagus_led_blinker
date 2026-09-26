#ifdef __MICROBLAZE__

#include "interrupt.h"

// Interrupt perhiperal handle and structures
XIntc intc;
XIntc_Config *xintc_config;

extern XUartLite uart;
extern XUartLite_Config *uart_config;

extern XTmrCtr tmr;
extern XTmrCtr_Config *tmr_config;

int intc_init()
{ 
	int status = XST_SUCCESS;
    
    xintc_config = XIntc_LookupConfig(XPAR_AXI_INTC_0_BASEADDR);
    status = XIntc_Initialize(&intc, xintc_config->BaseAddress);
 
	if(status == XST_SUCCESS)
		xil_printf("INTC INIT SUCCESSFUL\n");
	else
		xil_printf("INTC INIT FAILED\n");
 
    // Initialize MicroBlaze Exception Table & Register INTC
	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XIntc_InterruptHandler, &intc);
	Xil_ExceptionEnable();
 
    // Connect timer interrupt to interrupt handler
	status = XIntc_Connect(&intc, XPAR_FABRIC_AXI_TIMER_0_INTR, (XInterruptHandler)  tmr_intcHandler, &tmr);
    if (status != XST_SUCCESS) {return XST_FAILURE;}

    // Connect uart interrupt to interrupt handler 
    XIntc_Connect(&intc, XPAR_FABRIC_AXI_UARTLITE_0_INTR, (XInterruptHandler)XUartLite_InterruptHandler, &uart);
    if (status != XST_SUCCESS) {return XST_FAILURE;}
    
    // Enable the timer and uart interrupts
	XIntc_Enable(&intc, XPAR_FABRIC_AXI_TIMER_0_INTR);
    XIntc_Enable(&intc, XPAR_FABRIC_AXI_UARTLITE_0_INTR);

    // Start the interrupt handler
	status = XIntc_Start(&intc, XIN_REAL_MODE);
    if (status != XST_SUCCESS) {return XST_FAILURE;}

    return XST_SUCCESS;
}

#endif // __MICROBLAZE__