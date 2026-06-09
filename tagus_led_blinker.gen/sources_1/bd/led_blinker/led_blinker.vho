-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
-- -------------------------------------------------------------------------------
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- DO NOT MODIFY THIS FILE.

-- MODULE VLNV: amd.com:blockdesign:led_blinker:1.0

-- The following code must appear in the VHDL architecture header.

-- COMP_TAG     ------ Begin cut for COMPONENT Declaration ------
COMPONENT led_blinker
  PORT (
    usb_uart_rxd : IN STD_LOGIC;
    usb_uart_txd : OUT STD_LOGIC;
    rgb_led_tri_o : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    ddr3_sdram_dq : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    ddr3_sdram_dqs_p : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ddr3_sdram_dqs_n : INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ddr3_sdram_addr : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
    ddr3_sdram_ba : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    ddr3_sdram_ras_n : OUT STD_LOGIC;
    ddr3_sdram_cas_n : OUT STD_LOGIC;
    ddr3_sdram_we_n : OUT STD_LOGIC;
    ddr3_sdram_reset_n : OUT STD_LOGIC;
    ddr3_sdram_ck_p : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    ddr3_sdram_ck_n : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    ddr3_sdram_cke : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    ddr3_sdram_cs_n : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    ddr3_sdram_dm : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ddr3_sdram_odt : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    pcie_rxn : IN STD_LOGIC;
    pcie_rxp : IN STD_LOGIC;
    pcie_txn : OUT STD_LOGIC;
    pcie_txp : OUT STD_LOGIC;
    pcie_refclk_clk_n : IN STD_LOGIC;
    pcie_refclk_clk_p : IN STD_LOGIC;
    clk : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    pcie_perstn : IN STD_LOGIC
  );
END COMPONENT;
-- COMP_TAG_END ------  End cut for COMPONENT Declaration  ------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

-- INST_TAG     ------ Begin cut for INSTANTIATION Template ------
your_instance_name : led_blinker
  PORT MAP (
    usb_uart_rxd => usb_uart_rxd,
    usb_uart_txd => usb_uart_txd,
    rgb_led_tri_o => rgb_led_tri_o,
    ddr3_sdram_dq => ddr3_sdram_dq,
    ddr3_sdram_dqs_p => ddr3_sdram_dqs_p,
    ddr3_sdram_dqs_n => ddr3_sdram_dqs_n,
    ddr3_sdram_addr => ddr3_sdram_addr,
    ddr3_sdram_ba => ddr3_sdram_ba,
    ddr3_sdram_ras_n => ddr3_sdram_ras_n,
    ddr3_sdram_cas_n => ddr3_sdram_cas_n,
    ddr3_sdram_we_n => ddr3_sdram_we_n,
    ddr3_sdram_reset_n => ddr3_sdram_reset_n,
    ddr3_sdram_ck_p => ddr3_sdram_ck_p,
    ddr3_sdram_ck_n => ddr3_sdram_ck_n,
    ddr3_sdram_cke => ddr3_sdram_cke,
    ddr3_sdram_cs_n => ddr3_sdram_cs_n,
    ddr3_sdram_dm => ddr3_sdram_dm,
    ddr3_sdram_odt => ddr3_sdram_odt,
    pcie_rxn => pcie_rxn,
    pcie_rxp => pcie_rxp,
    pcie_txn => pcie_txn,
    pcie_txp => pcie_txp,
    pcie_refclk_clk_n => pcie_refclk_clk_n,
    pcie_refclk_clk_p => pcie_refclk_clk_p,
    clk => clk,
    reset => reset,
    pcie_perstn => pcie_perstn
  );
-- INST_TAG_END ------  End cut for INSTANTIATION Template  ------

-- You must compile the wrapper file led_blinker.vhd when simulating
-- the module, led_blinker. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.
