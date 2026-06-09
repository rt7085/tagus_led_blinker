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
#set_property -dict {PACKAGE_PIN W21 IOSTANDARD LVCMOS33 SLEW SLOW} [get_ports {rgb_led_0}]; #RED
#set_property -dict {PACKAGE_PIN W22 IOSTANDARD LVCMOS33 SLEW SLOW} [get_ports {rgb_led_1}]; # GREEN
#set_property -dict {PACKAGE_PIN AA20 IOSTANDARD LVCMOS33 SLEW SLOW} [get_ports {rgb_led_2}]; # BLUE

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


#set_property OFFCHIP_TERM NONE [get_ports rgb_led_0]
#set_property OFFCHIP_TERM NONE [get_ports rgb_led_1]
#set_property OFFCHIP_TERM NONE [get_ports rgb_led_2]


set_property OFFCHIP_TERM NONE [get_ports usb_uart_txd]
set_property OFFCHIP_TERM NONE [get_ports rgb_led_tri_o[2]]
set_property OFFCHIP_TERM NONE [get_ports rgb_led_tri_o[1]]
set_property OFFCHIP_TERM NONE [get_ports rgb_led_tri_o[0]]
set_property LOC GTPE2_CHANNEL_X0Y4 [get_cells {led_blinker_i/xdma_0/inst/led_blinker_xdma_0_0_pcie2_to_pcie3_wrapper_i/pcie2_ip_i/inst/inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/gtp_channel.gtpe2_channel_i}]

set_property PACKAGE_PIN W20 [get_ports pcie_perstn]
set_property IOSTANDARD LVCMOS33 [get_ports pcie_perstn]

set_property PACKAGE_PIN F6 [get_ports {pcie_refclk_clk_p}]
set_property PACKAGE_PIN E6 [get_ports {pcie_refclk_clk_n}]

set_property PACKAGE_PIN B8 [get_ports {pcie_rxp}]
set_property PACKAGE_PIN A8 [get_ports {pcie_rxn}]

set_property PACKAGE_PIN B4 [get_ports {pcie_txp}]
set_property PACKAGE_PIN A4 [get_ports {pcie_txn}]
