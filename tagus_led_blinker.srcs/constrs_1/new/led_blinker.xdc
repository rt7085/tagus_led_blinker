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

set_property PACKAGE_PIN W20 [get_ports pcie_perstn]
set_property IOSTANDARD LVCMOS33 [get_ports pcie_perstn]

set_property PACKAGE_PIN F6 [get_ports pcie_refclk_clk_p]
set_property PACKAGE_PIN E6 [get_ports pcie_refclk_clk_n]


set_property LOC GTPE2_CHANNEL_X0Y4 [get_cells {led_blinker_i/xdma_0/inst/led_blinker_xdma_0_0_pcie2_to_pcie3_wrapper_i/pcie2_ip_i/inst/inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/gtp_channel.gtpe2_channel_i}]
set_property PACKAGE_PIN A8 [get_ports pcie_rxn]
set_property PACKAGE_PIN B8 [get_ports pcie_rxp]
set_property PACKAGE_PIN A4 [get_ports pcie_txn]
set_property PACKAGE_PIN B4 [get_ports pcie_txp]

set_property BITSTREAM.CONFIG.CONFIGRATE 66 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]

set_property OFFCHIP_TERM NONE [get_ports usb_uart_txd]
set_property OFFCHIP_TERM NONE [get_ports rgb_led_tri_o[2]]
set_property OFFCHIP_TERM NONE [get_ports rgb_led_tri_o[1]]
set_property OFFCHIP_TERM NONE [get_ports rgb_led_tri_o[0]]


## Clock timing Constraints

# The clk_wiz_0 generates a clock in it clk_in1 pin automatically which causes a redefinition methodology critical warning
#create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk]

create_clock -period 10.000 -name pcie_refclk -waveform {0.000 5.000} [get_ports pcie_rxp]

#set_clock_groups -asynchronous -group [get_clocks clk_out2_led_blinker_clk_wiz_0] -group [get_clocks clk_pll_i]


# Asynchronous reset timing constraints

set_false_path -from [get_ports reset]
set_false_path -from [get_ports pcie_perstn]

set_false_path -from [get_clocks -filter {NAME =~ *clk_out1*}] -to [get_clocks userclk1]
set_false_path -from [get_clocks userclk1] -to [get_clocks -filter {NAME =~ *clk_out1*}]

set_false_path -from [get_clocks *clk_125mhz_mux_x0y0*] -to [get_clocks -filter {NAME =~ *clk_out1*}]
set_false_path -from [get_clocks -filter {NAME =~ *clk_out1*}] -to [get_clocks *clk_125mhz_mux_x0y0*]

set_false_path -from [get_clocks *clk_250mhz_mux_x0y0*] -to [get_clocks -filter {NAME =~ *clk_out1*}]
set_false_path -from [get_clocks -filter {NAME =~ *clk_out1*}] -to [get_clocks *clk_250mhz_mux_x0y0*]

#Main reset constraints

set_input_delay -clock [get_clocks clk] 0.000 [get_ports reset]
set_false_path -from [get_ports reset]


#UART asynchronous timing contraints

# 1. Define the input delay constraint (assuming a 10ns clock period as an example)
set_input_delay -clock [get_clocks clk] -max 2.000 [get_ports usb_uart_rxd]
set_input_delay -clock [get_clocks clk] -min 1.000 [get_ports usb_uart_rxd]

# 2. Tell Vivado to treat it as an asynchronous path (Prevents unnecessary timing optimizations)
set_false_path -from [get_ports usb_uart_rxd]

# 2. Apply the output delay constraint to the UART TXD port
set_output_delay -clock [get_clocks clk] -max 2.000 [get_ports usb_uart_txd]
set_output_delay -clock [get_clocks clk] -min -0.500 [get_ports usb_uart_txd]

set_false_path -to [get_ports usb_uart_txd]


#PCIE xdma asynchrous timing contraints

# Define a nominal input delay so Vivado stops complaining about the missing constraint
set_input_delay -clock [get_clocks pcie_refclk] 0.000 [get_ports pcie_perstn]

# Tell Vivado's timing engine to treat the path as a false path (asynchronous)
set_false_path -from [get_ports pcie_perstn]

# DDR3 aynchronous contraints


# 2. Set dummy output delays to satisfy the Vivado DRC requirement
set_output_delay -clock [get_clocks clk] -max 2.000 [get_ports ddr3_sdram_reset_n]
set_output_delay -clock [get_clocks clk] -min 0.000 [get_ports ddr3_sdram_reset_n]

# 3. Mark the path as a false path so Vivado skips timing optimization on this async reset
set_false_path -to [get_ports ddr3_sdram_reset_n]

#GPIO asynchronous contraints
set_output_delay -clock [get_clocks clk] -min 0.000 [get_ports {rgb_led_tri_o[*]}]
set_output_delay -clock [get_clocks clk] -max 2.000 [get_ports {rgb_led_tri_o[*]}]