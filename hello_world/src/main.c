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
#include "i2c.h"
#include "timer.h"
#include "interrupt.h"

// GPIO
#define GPIO_CHANNEL1           1   // GPIO channel 1
#define GPIO_CHANNEL2           2   // GPIO channel 2

// GPIO_0 bitmasks (LEDs, PCIE)
#define RED_LED_PIN             0x01   // Channel 1 (Output)
#define GREEN_LED_PIN           0x02   // Channel 2 (Output)
#define BLUE_LED_PIN            0x04   // Channel 3 (Output)
#define PCIE_USER_LINK_UP_PIN   0x01   // Channel 1 (input)

// GPIO_0 LED bitmasks
#define ALL_LEDS_OFF    0x7
#define RED_LED_ON      0x6
#define GREEN_LED_ON    0x5
#define BLUE_LED_ON     0x3

// GPIO_1 Bitmasks (SFP1)
#define SFP1_TX_DISABLE_PIN     0x01   // Channel 1 (Output)
#define SFP1_TX_FAULT_PIN       0x01   // Channel 1 (Input)
#define SFP1_RX_LOS_PIN         0x02   // Channel 2 (Input)
#define SFP1_MOD_ABS            0x04   // Channel 3 (Input)

extern XIntc intc;
extern XIntc_Config *xintc_config;

extern XTmrCtr tmr;
extern XTmrCtr_Config *tmr_config;
extern volatile int timerFlag;

extern XUartLite uart; // Defined in serial.c
extern XUartLite_Config *uart_config;
extern uint8_t RxBuffer[1];

XGpio Gpio0; 
XGpio_Config *Gpio0_config;

XGpio Gpio1; 
XGpio_Config *Gpio1_config;

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
       xil_printf("\nBRAM INIT SUCCESSFUL");
   else
       xil_printf("\nBRAM INIT FAILED");
 
   status = XBram_SelfTest(&bram, 0);
 
   if(status == XST_SUCCESS)
       xil_printf("\nBRAM SELF TEST SUCCESSFUL");
   else
       xil_printf("\nBRAM SELF TEST FAILED");
}

void gpio_init()
{
    int status;
    
    // Initialize GPIO_0 
    Gpio0_config = XGpio_LookupConfig(XPAR_AXI_GPIO_0_BASEADDR);
    status = XGpio_CfgInitialize(&Gpio0, Gpio0_config, Gpio0_config->BaseAddress);
    if(status == XST_SUCCESS)
        xil_printf("\nGPIO_0 INIT SUCCESSFUL");
    else
        xil_printf("\nGPIO_0 INIT FAILED");

    Gpio1_config = XGpio_LookupConfig(XPAR_AXI_GPIO_1_BASEADDR);
    status = XGpio_CfgInitialize(&Gpio1, Gpio1_config, Gpio1_config->BaseAddress);
    if(status == XST_SUCCESS)
        xil_printf("\nGPIO_1 INIT SUCCESSFUL");
    else
        xil_printf("\nGPIO_1 INIT FAILED");

    // Set GPIO_0 Channel 1 as output (0 mask = output)
    XGpio_SetDataDirection(&Gpio0, GPIO_CHANNEL1, ~(RED_LED_PIN | GREEN_LED_PIN | BLUE_LED_PIN));
    // Set GPIO_0 channel 2 as input 
    XGpio_SetDataDirection(&Gpio0, GPIO_CHANNEL2, PCIE_USER_LINK_UP_PIN);

    // Set GPIO_1 Channel 1 as output (0 mask = output)
    XGpio_SetDataDirection(&Gpio1, GPIO_CHANNEL1, ~SFP1_TX_DISABLE_PIN);
    // Set GPIO channel 2 as input 
    XGpio_SetDataDirection(&Gpio0, GPIO_CHANNEL2, (SFP1_TX_FAULT_PIN | SFP1_RX_LOS_PIN  | SFP1_MOD_ABS));

}

// Enable or disable SFP Transmitter Laser
void set_sfp1_laser(u8 enable) {
    u32 current_gpio = XGpio_DiscreteRead(&Gpio1, GPIO_CHANNEL1);
    if (enable) {
        // TX_DISABLE is active-high; clear pin to enable laser
        XGpio_DiscreteWrite(&Gpio1, GPIO_CHANNEL1, current_gpio & ~SFP1_TX_DISABLE_PIN);
        print("\nSFP1 Laser Enabled.");
    } else {
        // Set pin high to disable laser
        XGpio_DiscreteWrite(&Gpio1, GPIO_CHANNEL1, current_gpio | SFP1_TX_DISABLE_PIN);
        print("\nSFP1 Laser Disabled.");
    }
}

// Read SFP Status Pins
void check_sfp_status() {
    u32 inputs = XGpio_DiscreteRead(&Gpio1, GPIO_CHANNEL2);
    
    if (inputs & SFP1_RX_LOS_PIN) {
        print("\nWarning: SFP1 RX Loss of Signal (LOS) detected!");
    } else {
        print("\nSFP1 RX Signal OK.");
    }

    if (inputs & SFP1_TX_FAULT_PIN) {
        print("\nError: SFP1 TX Fault detected!");
    }
}

int main()
{
    init_platform();
    intc_init();
    tmr_init();
    uart_init();
    // i2c_init();  // Not needed for low level polled i2c
    
    gpio_init();
    bram_init();

    xil_printf("\nLed Blinker Applications Started...");

    
    u32 pci_user_lnk_up = 0;
    u32 led_state = 0;
    
    void RunFSM() {
        switch(currentState) {
            case STATE_INIT:
                // Do initial setup
                XGpio_DiscreteWrite(&Gpio0, GPIO_CHANNEL1, ALL_LEDS_OFF); // each bit is an LED

                // PCIe link up established?
                pci_user_lnk_up = XGpio_DiscreteRead(&Gpio0, GPIO_CHANNEL2);
                // xil_printf("PCIE Link Up Status = %08X\n", pci_user_lnk_up);
                
                currentState = STATE_RUNNING;
                break;
                
            case STATE_RUNNING:
                // Blink the LED
                if (led_state)
                {
                    if (pci_user_lnk_up == 0) 
                    {
                        XGpio_DiscreteWrite(&Gpio0, GPIO_CHANNEL1, RED_LED_ON); // LED ON
                    }
                    else
                    {
                        XGpio_DiscreteWrite(&Gpio0, GPIO_CHANNEL1, GREEN_LED_ON); // LED ON
                    }
                }
                else
                {
                    XGpio_DiscreteWrite(&Gpio0, GPIO_CHANNEL1, ALL_LEDS_OFF); // LED OFF
                }
                led_state = ~led_state;
                
                break;
                
            case STATE_DONE:
                // Clean up
                break;
        }
    }
    
    // StartUp Functions
    ReadMACAddress();

    set_sfp1_laser(1);
    check_sfp_status();

    // Read SFP1 Vendor Name (Bytes 20 to 35 in SFP1 EEPROM)
    u8 eeprom_buffer[20];
    if (SFP1ReadPolled(SPF1_VENDOR_ADDR, eeprom_buffer, SPF1_VENDOR_LENGTH) == XST_SUCCESS) {
        eeprom_buffer[16] = '\0'; // Null-terminate string
        xil_printf("\nSFP1 Vendor Name: %s", eeprom_buffer);
    } else {
        print("\nFailed to read SFP1 EEPROM");
    }
    

    // drop a cursor arrow to start interface
    xil_printf("\n>");
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
