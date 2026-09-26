#ifdef __MICROBLAZE__

#include "timer.h"

// Timer perhiperal handle and structures
XTmrCtr tmr;
XTmrCtr_Config *tmr_config;
volatile int timerFlag = 0;

extern XIntc intc;
extern XIntc_Config *xintc_config;


void tmr_intcHandler()
{
	XIntc_Acknowledge(&intc, xintc_config->BaseAddress);
    while(!XTmrCtr_IsExpired(&tmr,0)) {
    };
	//xil_printf("Interrupt Occurred\n");
    timerFlag = 1; // Signal that the timer period has elapsed
	XTmrCtr_Reset(&tmr, 0);
}

void tmr_init()
{
    tmr_config = XTmrCtr_LookupConfig(XPAR_AXI_TIMER_0_BASEADDR);
	int status = XTmrCtr_Initialize(&tmr, tmr_config->BaseAddress);
    u32 option = 0;
 
	if(status == XST_SUCCESS)
		xil_printf("TMR INIT SUCCESSFUL\n");
	else
		xil_printf("TMR INIT FAILED\n");

    // Set up timers
    XTmrCtr_Stop(&tmr, TIMER_ID_0);
    XTmrCtr_Stop(&tmr, TIMER_ID_1);

    option = XTmrCtr_GetOptions(&tmr, TIMER_ID_0);
    XTmrCtr_SetOptions(&tmr, TIMER_ID_0, option | XTC_DOWN_COUNT_OPTION | XTC_INT_MODE_OPTION); // Responsible for interrupt
    option = XTmrCtr_GetOptions(&tmr, TIMER_ID_1);
    XTmrCtr_SetOptions(&tmr, TIMER_ID_1, option | XTC_AUTO_RELOAD_OPTION); // No interrupt trigger, counting up for time measuremeents

    XTmrCtr_SetResetValue(&tmr, TIMER_ID_0, 100000000); // Time divided by 100 MHz, so 1 sec interrupt interval
    XTmrCtr_SetResetValue(&tmr, TIMER_ID_1, 0); // Time divided by 100 MHz, counting up from 0 to 2^32-1 (~42 sec) and rolling over.

    XTmrCtr_Reset(&tmr, TIMER_ID_0);
    XTmrCtr_Reset(&tmr, TIMER_ID_1);
    
    XTmrCtr_Start(&tmr, TIMER_ID_0);
    XTmrCtr_Start(&tmr, TIMER_ID_1);   
}


#endif // __MICROBLAZE__