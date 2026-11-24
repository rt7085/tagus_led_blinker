//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
//Date        : Mon Nov 23 07:02:32 2026
//Host        : capybara running 64-bit Ubuntu 24.04.5 LTS
//Command     : generate_target led_blinker_wrapper.bd
//Design      : led_blinker_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module led_blinker_wrapper
   (CS2000_LOCK,
    EEPROM_IIC_0_scl_io,
    EEPROM_IIC_0_sda_io,
    FMC_IIC_scl_io,
    FMC_IIC_sda_io,
    SFP1_IIC_scl_io,
    SFP1_IIC_sda_io,
    SFP1_MOD_ABS,
    SFP1_RX_LOS,
    SFP1_TX_DSBL,
    SFP1_TX_FLT,
    SFP2_IIC_scl_io,
    SFP2_IIC_sda_io,
    SFP2_MOD_ABS,
    SFP2_RX_LOS,
    SFP2_TX_DSBL,
    SFP2_TX_FLT,
    clk,
    ddr3_sdram_addr,
    ddr3_sdram_ba,
    ddr3_sdram_cas_n,
    ddr3_sdram_ck_n,
    ddr3_sdram_ck_p,
    ddr3_sdram_cke,
    ddr3_sdram_cs_n,
    ddr3_sdram_dm,
    ddr3_sdram_dq,
    ddr3_sdram_dqs_n,
    ddr3_sdram_dqs_p,
    ddr3_sdram_odt,
    ddr3_sdram_ras_n,
    ddr3_sdram_reset_n,
    ddr3_sdram_we_n,
    pcie_perstn,
    pcie_refclk_clk_n,
    pcie_refclk_clk_p,
    pcie_rxn,
    pcie_rxp,
    pcie_txn,
    pcie_txp,
    reset,
    rgb_led_tri_o,
    usb_uart_rxd,
    usb_uart_txd);
  input [0:0]CS2000_LOCK;
  inout EEPROM_IIC_0_scl_io;
  inout EEPROM_IIC_0_sda_io;
  inout FMC_IIC_scl_io;
  inout FMC_IIC_sda_io;
  inout SFP1_IIC_scl_io;
  inout SFP1_IIC_sda_io;
  input [0:0]SFP1_MOD_ABS;
  input [0:0]SFP1_RX_LOS;
  output [0:0]SFP1_TX_DSBL;
  input [0:0]SFP1_TX_FLT;
  inout SFP2_IIC_scl_io;
  inout SFP2_IIC_sda_io;
  input [0:0]SFP2_MOD_ABS;
  input [0:0]SFP2_RX_LOS;
  output [0:0]SFP2_TX_DSBL;
  input [0:0]SFP2_TX_FLT;
  input clk;
  output [13:0]ddr3_sdram_addr;
  output [2:0]ddr3_sdram_ba;
  output ddr3_sdram_cas_n;
  output [0:0]ddr3_sdram_ck_n;
  output [0:0]ddr3_sdram_ck_p;
  output [0:0]ddr3_sdram_cke;
  output [0:0]ddr3_sdram_cs_n;
  output [1:0]ddr3_sdram_dm;
  inout [15:0]ddr3_sdram_dq;
  inout [1:0]ddr3_sdram_dqs_n;
  inout [1:0]ddr3_sdram_dqs_p;
  output [0:0]ddr3_sdram_odt;
  output ddr3_sdram_ras_n;
  output ddr3_sdram_reset_n;
  output ddr3_sdram_we_n;
  input pcie_perstn;
  input pcie_refclk_clk_n;
  input pcie_refclk_clk_p;
  input pcie_rxn;
  input pcie_rxp;
  output pcie_txn;
  output pcie_txp;
  input reset;
  output [2:0]rgb_led_tri_o;
  input usb_uart_rxd;
  output usb_uart_txd;

  wire [0:0]CS2000_LOCK;
  wire EEPROM_IIC_0_scl_i;
  wire EEPROM_IIC_0_scl_io;
  wire EEPROM_IIC_0_scl_o;
  wire EEPROM_IIC_0_scl_t;
  wire EEPROM_IIC_0_sda_i;
  wire EEPROM_IIC_0_sda_io;
  wire EEPROM_IIC_0_sda_o;
  wire EEPROM_IIC_0_sda_t;
  wire FMC_IIC_scl_i;
  wire FMC_IIC_scl_io;
  wire FMC_IIC_scl_o;
  wire FMC_IIC_scl_t;
  wire FMC_IIC_sda_i;
  wire FMC_IIC_sda_io;
  wire FMC_IIC_sda_o;
  wire FMC_IIC_sda_t;
  wire SFP1_IIC_scl_i;
  wire SFP1_IIC_scl_io;
  wire SFP1_IIC_scl_o;
  wire SFP1_IIC_scl_t;
  wire SFP1_IIC_sda_i;
  wire SFP1_IIC_sda_io;
  wire SFP1_IIC_sda_o;
  wire SFP1_IIC_sda_t;
  wire [0:0]SFP1_MOD_ABS;
  wire [0:0]SFP1_RX_LOS;
  wire [0:0]SFP1_TX_DSBL;
  wire [0:0]SFP1_TX_FLT;
  wire SFP2_IIC_scl_i;
  wire SFP2_IIC_scl_io;
  wire SFP2_IIC_scl_o;
  wire SFP2_IIC_scl_t;
  wire SFP2_IIC_sda_i;
  wire SFP2_IIC_sda_io;
  wire SFP2_IIC_sda_o;
  wire SFP2_IIC_sda_t;
  wire [0:0]SFP2_MOD_ABS;
  wire [0:0]SFP2_RX_LOS;
  wire [0:0]SFP2_TX_DSBL;
  wire [0:0]SFP2_TX_FLT;
  wire clk;
  wire [13:0]ddr3_sdram_addr;
  wire [2:0]ddr3_sdram_ba;
  wire ddr3_sdram_cas_n;
  wire [0:0]ddr3_sdram_ck_n;
  wire [0:0]ddr3_sdram_ck_p;
  wire [0:0]ddr3_sdram_cke;
  wire [0:0]ddr3_sdram_cs_n;
  wire [1:0]ddr3_sdram_dm;
  wire [15:0]ddr3_sdram_dq;
  wire [1:0]ddr3_sdram_dqs_n;
  wire [1:0]ddr3_sdram_dqs_p;
  wire [0:0]ddr3_sdram_odt;
  wire ddr3_sdram_ras_n;
  wire ddr3_sdram_reset_n;
  wire ddr3_sdram_we_n;
  wire pcie_perstn;
  wire pcie_refclk_clk_n;
  wire pcie_refclk_clk_p;
  wire pcie_rxn;
  wire pcie_rxp;
  wire pcie_txn;
  wire pcie_txp;
  wire reset;
  wire [2:0]rgb_led_tri_o;
  wire usb_uart_rxd;
  wire usb_uart_txd;

  IOBUF EEPROM_IIC_0_scl_iobuf
       (.I(EEPROM_IIC_0_scl_o),
        .IO(EEPROM_IIC_0_scl_io),
        .O(EEPROM_IIC_0_scl_i),
        .T(EEPROM_IIC_0_scl_t));
  IOBUF EEPROM_IIC_0_sda_iobuf
       (.I(EEPROM_IIC_0_sda_o),
        .IO(EEPROM_IIC_0_sda_io),
        .O(EEPROM_IIC_0_sda_i),
        .T(EEPROM_IIC_0_sda_t));
  IOBUF FMC_IIC_scl_iobuf
       (.I(FMC_IIC_scl_o),
        .IO(FMC_IIC_scl_io),
        .O(FMC_IIC_scl_i),
        .T(FMC_IIC_scl_t));
  IOBUF FMC_IIC_sda_iobuf
       (.I(FMC_IIC_sda_o),
        .IO(FMC_IIC_sda_io),
        .O(FMC_IIC_sda_i),
        .T(FMC_IIC_sda_t));
  IOBUF SFP1_IIC_scl_iobuf
       (.I(SFP1_IIC_scl_o),
        .IO(SFP1_IIC_scl_io),
        .O(SFP1_IIC_scl_i),
        .T(SFP1_IIC_scl_t));
  IOBUF SFP1_IIC_sda_iobuf
       (.I(SFP1_IIC_sda_o),
        .IO(SFP1_IIC_sda_io),
        .O(SFP1_IIC_sda_i),
        .T(SFP1_IIC_sda_t));
  IOBUF SFP2_IIC_scl_iobuf
       (.I(SFP2_IIC_scl_o),
        .IO(SFP2_IIC_scl_io),
        .O(SFP2_IIC_scl_i),
        .T(SFP2_IIC_scl_t));
  IOBUF SFP2_IIC_sda_iobuf
       (.I(SFP2_IIC_sda_o),
        .IO(SFP2_IIC_sda_io),
        .O(SFP2_IIC_sda_i),
        .T(SFP2_IIC_sda_t));
  led_blinker led_blinker_i
       (.CS2000_LOCK(CS2000_LOCK),
        .EEPROM_IIC_0_scl_i(EEPROM_IIC_0_scl_i),
        .EEPROM_IIC_0_scl_o(EEPROM_IIC_0_scl_o),
        .EEPROM_IIC_0_scl_t(EEPROM_IIC_0_scl_t),
        .EEPROM_IIC_0_sda_i(EEPROM_IIC_0_sda_i),
        .EEPROM_IIC_0_sda_o(EEPROM_IIC_0_sda_o),
        .EEPROM_IIC_0_sda_t(EEPROM_IIC_0_sda_t),
        .FMC_IIC_scl_i(FMC_IIC_scl_i),
        .FMC_IIC_scl_o(FMC_IIC_scl_o),
        .FMC_IIC_scl_t(FMC_IIC_scl_t),
        .FMC_IIC_sda_i(FMC_IIC_sda_i),
        .FMC_IIC_sda_o(FMC_IIC_sda_o),
        .FMC_IIC_sda_t(FMC_IIC_sda_t),
        .SFP1_IIC_scl_i(SFP1_IIC_scl_i),
        .SFP1_IIC_scl_o(SFP1_IIC_scl_o),
        .SFP1_IIC_scl_t(SFP1_IIC_scl_t),
        .SFP1_IIC_sda_i(SFP1_IIC_sda_i),
        .SFP1_IIC_sda_o(SFP1_IIC_sda_o),
        .SFP1_IIC_sda_t(SFP1_IIC_sda_t),
        .SFP1_MOD_ABS(SFP1_MOD_ABS),
        .SFP1_RX_LOS(SFP1_RX_LOS),
        .SFP1_TX_DSBL(SFP1_TX_DSBL),
        .SFP1_TX_FLT(SFP1_TX_FLT),
        .SFP2_IIC_scl_i(SFP2_IIC_scl_i),
        .SFP2_IIC_scl_o(SFP2_IIC_scl_o),
        .SFP2_IIC_scl_t(SFP2_IIC_scl_t),
        .SFP2_IIC_sda_i(SFP2_IIC_sda_i),
        .SFP2_IIC_sda_o(SFP2_IIC_sda_o),
        .SFP2_IIC_sda_t(SFP2_IIC_sda_t),
        .SFP2_MOD_ABS(SFP2_MOD_ABS),
        .SFP2_RX_LOS(SFP2_RX_LOS),
        .SFP2_TX_DSBL(SFP2_TX_DSBL),
        .SFP2_TX_FLT(SFP2_TX_FLT),
        .clk(clk),
        .ddr3_sdram_addr(ddr3_sdram_addr),
        .ddr3_sdram_ba(ddr3_sdram_ba),
        .ddr3_sdram_cas_n(ddr3_sdram_cas_n),
        .ddr3_sdram_ck_n(ddr3_sdram_ck_n),
        .ddr3_sdram_ck_p(ddr3_sdram_ck_p),
        .ddr3_sdram_cke(ddr3_sdram_cke),
        .ddr3_sdram_cs_n(ddr3_sdram_cs_n),
        .ddr3_sdram_dm(ddr3_sdram_dm),
        .ddr3_sdram_dq(ddr3_sdram_dq),
        .ddr3_sdram_dqs_n(ddr3_sdram_dqs_n),
        .ddr3_sdram_dqs_p(ddr3_sdram_dqs_p),
        .ddr3_sdram_odt(ddr3_sdram_odt),
        .ddr3_sdram_ras_n(ddr3_sdram_ras_n),
        .ddr3_sdram_reset_n(ddr3_sdram_reset_n),
        .ddr3_sdram_we_n(ddr3_sdram_we_n),
        .pcie_perstn(pcie_perstn),
        .pcie_refclk_clk_n(pcie_refclk_clk_n),
        .pcie_refclk_clk_p(pcie_refclk_clk_p),
        .pcie_rxn(pcie_rxn),
        .pcie_rxp(pcie_rxp),
        .pcie_txn(pcie_txn),
        .pcie_txp(pcie_txp),
        .reset(reset),
        .rgb_led_tri_o(rgb_led_tri_o),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd));
endmodule
