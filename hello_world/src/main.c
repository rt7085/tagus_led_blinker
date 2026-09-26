#include <xparameters.h>
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
#include "xuartlite.h"
#include "serial.h"
#include "timer.h"
#include "interrupt.h"

#define ALL_LEDS_OFF 0x7
#define RED_LED_ON 0x6
#define GREEN_LED_ON 0x5
#define BLUE_LED_ON 0x3

extern XIntc intc;
extern XIntc_Config *xintc_config;

extern XTmrCtr tmr;
extern XTmrCtr_Config *tmr_config;
extern volatile int timerFlag;

extern XUartLite uart; // Defined in serial.c
extern XUartLite_Config *uart_config;
extern uint8_t RxBuffer[1];

XGpio Gpio; 
XGpio_Config *Gpio_config;

XBram bram;
XBram_Config *bram_config;

// Control FSM states
typedef enum { STATE_INIT, STATE_RUNNING, STATE_DONE } StateType;
volatile StateType currentState = STATE_INIT;

// Local functions

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

    // Set GPIO Channel 1 as output (0 mask = output)
    XGpio_SetDataDirection(&Gpio, 1, 0x0);
    // Set GPIO channel 2 as input 
    XGpio_SetDataDirection(&Gpio, 2, 0x1);
}

int main()
{
    init_platform();
    intc_init();
    tmr_init();
    uart_init();
    
    gpio_init();
    bram_init();

    print("Led Blinker Applications Started...\n\r");

    
    u32 pci_user_lnk_up = 0;
    u32 led_state = 0;
    
    void RunFSM() {
        switch(currentState) {
            case STATE_INIT:
                // Do initial setup
                XGpio_DiscreteWrite(&Gpio, 1, ALL_LEDS_OFF); // each bit is an LED

                // PCIe link up established?
                pci_user_lnk_up = XGpio_DiscreteRead(&Gpio, 2);
                // xil_printf("PCIE Link Up Status = %08X\n", pci_user_lnk_up);
                
                currentState = STATE_RUNNING;
                break;
                
            case STATE_RUNNING:
                // Blink the LED
                if (led_state)
                {
                    if (pci_user_lnk_up == 0) 
                    {
                        XGpio_DiscreteWrite(&Gpio, 1, RED_LED_ON); // LED ON
                    }
                    else
                    {
                        XGpio_DiscreteWrite(&Gpio, 1, GREEN_LED_ON); // LED ON
                    }
                }
                else
                {
                    XGpio_DiscreteWrite(&Gpio, 1, ALL_LEDS_OFF); // LED OFF
                }
                led_state = ~led_state;
                
                break;
                
            case STATE_DONE:
                // Clean up
                break;
        }
    }
    

    // drop a cursor arrow to start interface
    xil_printf(">");
    char input_line[BUFFER_SIZE];
    
    // Main loop
    while (1) {

        // Handle the timer
        if(timerFlag) 
        {
            timerFlag = 0;  // Reset flag
            RunFSM();       // Run state machine on timer
        }

        // Wait for uart command input
        if (get_line(input_line, BUFFER_SIZE)) 
        {
            process_command(input_line);
        }
    }
       
    cleanup_platform();   
    return 0;
    

}

#endif // __MICROBLAZE__
