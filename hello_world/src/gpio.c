#ifdef __MICROBLAZE__

#include "gpio.h"


// Variables
XGpio Gpio0; 
XGpio_Config *Gpio0_config;

XGpio Gpio1; 
XGpio_Config *Gpio1_config;


// Funtions
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
    XGpio_SetDataDirection(&Gpio1, GPIO_CHANNEL1, ~(SFP1_TX_DISABLE_PIN | SFP2_TX_DISABLE_PIN));
    // Set GPIO channel 2 as input 
    XGpio_SetDataDirection(&Gpio0, GPIO_CHANNEL2, (SFP1_TX_FAULT_PIN | SFP1_RX_LOS_PIN  | SFP1_MOD_ABS_PIN | SFP2_TX_FAULT_PIN | SFP2_RX_LOS_PIN  | SFP2_MOD_ABS_PIN));

}

// Enable or disable SFP Transmitter Laser
void set_sfp_lasers(u8 enable) {
    u32 current_gpio = XGpio_DiscreteRead(&Gpio1, GPIO_CHANNEL1);
    
    if (enable) {
        // TX_DISABLE is active-high; clear pin to enable laser
        XGpio_DiscreteWrite(&Gpio1, GPIO_CHANNEL1, current_gpio & ~(SFP1_TX_DISABLE_PIN | SFP2_TX_DISABLE_PIN));
        xil_printf("\nSFP1 & SFP 2 Lasers Enabled.");
    } else {
        // Set pin high to disable laser
        XGpio_DiscreteWrite(&Gpio1, GPIO_CHANNEL1, current_gpio | (SFP1_TX_DISABLE_PIN | SFP2_TX_DISABLE_PIN));
        xil_printf("\nSFP1 Laser Disabled.");
    }
}

// Read SFP Status Pins
void check_sfp_status() {
    u32 inputs = XGpio_DiscreteRead(&Gpio1, GPIO_CHANNEL2);

    if (inputs & SFP1_MOD_ABS_PIN) {
        xil_printf("\nError: SFP1 module not present!");
    } else {
        xil_printf("\nSFP1 module present.");
    }

    if (inputs & SFP2_MOD_ABS_PIN) {
        xil_printf("\nError: SFP2 module not present!");
    } else {
        xil_printf("\nSFP2 module present.");
    }
   
    if (inputs & SFP1_RX_LOS_PIN) {
        xil_printf("\nError: SFP1 RX Loss of Signal (LOS) detected!");
    } else {
        xil_printf("\nSFP1 RX Signal OK.");
    }
    
    if (inputs & SFP2_RX_LOS_PIN) {
        xil_printf("\nError: SFP2 RX Loss of Signal (LOS) detected!");
    } else {
        xil_printf("\nSFP2 RX Signal OK.");
    }

    if (inputs & SFP1_TX_FAULT_PIN) {
        xil_printf("\nError: SFP1 TX Fault detected!");
    }

    if (inputs & SFP2_TX_FAULT_PIN) {
        xil_printf("\nError: SFP2 TX Fault detected!");
    }
}


#endif // __MICROBLAZE__