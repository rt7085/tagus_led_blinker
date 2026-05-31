####################################################################################################################
#                                               CLOCK 100MHz                                                       #
####################################################################################################################
set_property PACKAGE_PIN W19 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

####################################################################################################################
#                                               RESET - SW2                                                        #
####################################################################################################################
set_property PACKAGE_PIN P17 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property PULLTYPE PULLDOWN [get_ports reset]

####################################################################################################################
#                                              RGB LED                                                             #
####################################################################################################################
set_property -dict {PACKAGE_PIN W21 IOSTANDARD LVCMOS33 SLEW SLOW} [get_ports {led_red[0]}]
set_property -dict {PACKAGE_PIN W22 IOSTANDARD LVCMOS33 SLEW SLOW} [get_ports {led_green[0]}]
set_property -dict {PACKAGE_PIN AA20 IOSTANDARD LVCMOS33 SLEW SLOW} [get_ports {led_blue[0]}]

####################################################################################################################
#                                              FT234 Signals                                                       #
####################################################################################################################
#set_property -dict { PACKAGE_PIN P14    IOSTANDARD LVCMOS33   SLEW FAST} [get_ports { FT234_TXD }]    ;                       # IO_L19P_T3_A10_D26_14         Sch = FT234_TXD
#set_property -dict { PACKAGE_PIN R18    IOSTANDARD LVCMOS33   SLEW FAST} [get_ports { FT234_RTS }]    ;                       # IO_L20P_T3_A08_D24_14         Sch = FT234_RTS
#set_property -dict { PACKAGE_PIN T18    IOSTANDARD LVCMOS33   SLEW FAST} [get_ports { FT234_CTS }]    ;                       # IO_L20N_T3_A07_D23_14         Sch = FT234_CTS
#set_property -dict { PACKAGE_PIN R14    IOSTANDARD LVCMOS33   SLEW FAST} [get_ports { FT234_RXD }]    ;                       # IO_L19N_T3_A09_D25_VREF_14    Sch = FT234_RXD
#set_property -dict { PACKAGE_PIN N17    IOSTANDARD LVCMOS33   SLEW FAST} [get_ports { FT234_CBUS0 }]  ;                       # IO_L21P_T3_DQS_14             Sch = FT234_CBUS0




#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]

#connect_debug_port dbg_hub/clk [get_nets clk]

#set_property OFFCHIP_TERM NONE [get_ports UART_0_txd]
#set_property IOSTANDARD LVCMOS33 [get_ports UART_0_rxd]
#set_property PACKAGE_PIN R14 [get_ports UART_0_rxd]
#set_property PACKAGE_PIN P14 [get_ports UART_0_txd]

set_property OFFCHIP_TERM NONE [get_ports usb_uart_txd]
set_property OFFCHIP_TERM NONE [get_ports led_blue[0]]
set_property OFFCHIP_TERM NONE [get_ports led_green[0]]
set_property OFFCHIP_TERM NONE [get_ports led_red[0]]
