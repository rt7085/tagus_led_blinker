set_property SRC_FILE_INFO {cfile:/home/rt7085/repos/tagus_led_blinker/tagus_led_blinker.srcs/constrs_1/new/led_blinker.xdc rfile:../../../tagus_led_blinker.srcs/constrs_1/new/led_blinker.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:4 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W19 [get_ports sys_clock]
set_property src_info {type:XDC file:1 line:10 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN P17 [get_ports reset]
set_property src_info {type:XDC file:1 line:17 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN W21 IOSTANDARD LVCMOS33 SLEW SLOW} [get_ports {led_red[0]}];                                    # IO_L7P_T1_D09_14              Sch = LED0, red
set_property src_info {type:XDC file:1 line:18 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN W22 IOSTANDARD LVCMOS33 SLEW SLOW} [get_ports {led_green[0]}];                                  # IO_L7N_T1_D10_14              Sch = LED1, green
set_property src_info {type:XDC file:1 line:19 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN AA20 IOSTANDARD LVCMOS33 SLEW SLOW} [get_ports {led_blue[0]}];                                  # IO_L8P_T1_D11_14              Sch = LED2, blue
