//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
//Date        : Sun May 31 07:18:39 2026
//Host        : capybara running 64-bit Ubuntu 24.04.3 LTS
//Command     : generate_target led_blinker_wrapper.bd
//Design      : led_blinker_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module led_blinker_wrapper
   (clk,
    reset,
    rgb_led_tri_o,
    usb_uart_rxd,
    usb_uart_txd);
  input clk;
  input reset;
  output [2:0]rgb_led_tri_o;
  input usb_uart_rxd;
  output usb_uart_txd;

  wire clk;
  wire reset;
  wire [2:0]rgb_led_tri_o;
  wire usb_uart_rxd;
  wire usb_uart_txd;

  led_blinker led_blinker_i
       (.clk(clk),
        .reset(reset),
        .rgb_led_tri_o(rgb_led_tri_o),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd));
endmodule
