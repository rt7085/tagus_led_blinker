#ifndef GPIO_H
#define GPIO_H

#ifdef __MICROBLAZE__

#include "xparameters.h"
#include "xgpio.h"


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
#define SFP1_TX_FAULT_PIN       0x01   // Channel 2 (Input)
#define SFP1_RX_LOS_PIN         0x02   // Channel 2 (Input)
#define SFP1_MOD_ABS_PIN        0x04   // Channel 2 (Input)

// GPIO_1 Bitmasks (SFP2)
#define SFP2_TX_DISABLE_PIN     0x02   // Channel 1 (Output)
#define SFP2_TX_FAULT_PIN       0x10   // Channel 2 (Input)
#define SFP2_RX_LOS_PIN         0x20   // Channel 2 (Input)
#define SFP2_MOD_ABS_PIN        0x40   // Channel 2 (Input)


// Function Prototypes
void gpio_init();
void set_sfp_lasers(u8 enable);
void check_sfp_status();


#endif // GPIO_H

#endif // __MICROBLAZE__