//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
//Date        : Sat May 16 06:17:40 2026
//Host        : capybara running 64-bit Ubuntu 24.04.3 LTS
//Command     : generate_target led_blinker_wrapper.bd
//Design      : led_blinker_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module led_blinker_wrapper
   (led_blue,
    led_green,
    led_red,
    reset,
    sys_clock);
  output [0:0]led_blue;
  output [0:0]led_green;
  output [0:0]led_red;
  input reset;
  input sys_clock;

  wire [0:0]led_blue;
  wire [0:0]led_green;
  wire [0:0]led_red;
  wire reset;
  wire sys_clock;

  led_blinker led_blinker_i
       (.led_blue(led_blue),
        .led_green(led_green),
        .led_red(led_red),
        .reset(reset),
        .sys_clock(sys_clock));
endmodule
