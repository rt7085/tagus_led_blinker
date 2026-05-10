####################################################################################################################
#                                               CLOCK 100MHz                                                       #
####################################################################################################################
set_property PACKAGE_PIN W19 [get_ports sys_clock]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clock]

####################################################################################################################
#                                               RESET - SW2                                                        #
####################################################################################################################
set_property PACKAGE_PIN P17 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property PULLTYPE PULLDOWN [get_ports reset]

####################################################################################################################
#                                              RGB LED                                                             #
####################################################################################################################
set_property -dict {PACKAGE_PIN W21 IOSTANDARD LVCMOS33 SLEW SLOW} [get_ports {led_red[0]}];                                    # IO_L7P_T1_D09_14              Sch = LED0, red
set_property -dict {PACKAGE_PIN W22 IOSTANDARD LVCMOS33 SLEW SLOW} [get_ports {led_green[0]}];                                  # IO_L7N_T1_D10_14              Sch = LED1, green
set_property -dict {PACKAGE_PIN AA20 IOSTANDARD LVCMOS33 SLEW SLOW} [get_ports {led_blue[0]}];                                  # IO_L8P_T1_D11_14              Sch = LED2, blue

set_property OFFCHIP_TERM NONE [get_ports led_blue[0]];
set_property OFFCHIP_TERM NONE [get_ports led_green[0]];
set_property OFFCHIP_TERM NONE [get_ports led_red[0]];

