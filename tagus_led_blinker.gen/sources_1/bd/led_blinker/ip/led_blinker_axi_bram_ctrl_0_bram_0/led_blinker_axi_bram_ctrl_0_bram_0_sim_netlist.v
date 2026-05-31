// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Sun May 31 06:30:08 2026
// Host        : capybara running 64-bit Ubuntu 24.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/rt7085/repos/tagus_led_blinker/tagus_led_blinker.gen/sources_1/bd/led_blinker/ip/led_blinker_axi_bram_ctrl_0_bram_0/led_blinker_axi_bram_ctrl_0_bram_0_sim_netlist.v
// Design      : led_blinker_axi_bram_ctrl_0_bram_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "led_blinker_axi_bram_ctrl_0_bram_0,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module led_blinker_axi_bram_ctrl_0_bram_0
   (clka,
    rsta,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [31:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_mode = "slave BRAM_PORTB" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [3:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [31:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [31:0]addra;
  wire [31:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire rsta;
  wire rstb;
  wire [3:0]wea;
  wire [3:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "32" *) 
  (* C_ADDRB_WIDTH = "32" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "1" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.7492 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "1" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "led_blinker_axi_bram_ctrl_0_bram_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "1" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  led_blinker_axi_bram_ctrl_0_bram_0_blk_mem_gen_v8_4_12 U0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra[12:2],1'b0,1'b0}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addrb[12:2],1'b0,1'b0}),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[31:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(rsta),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(rstb),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[31:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
YqH9kwIC39+qbZg4PSfFsXuB9k9wnuxNryS/CfnEri6Ci9fSC6fsrQ/T/hnt3u/yolbJ8DJa1Qu6
Qnm24A9jLbA+fu3Nsmm6/rM6a4vU6OfVl/gTFd/CiWDutv6Dhn6Lim4uUNPahoOR/A2Yc4Zo2tdI
kMLO9gn9WlH2l3O2oXs=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XJYO2VHd/cnMxQd3i7/2qRhl57dl+doEKuhAunQyv3vpGRG/jlNxj8PqrgLoF0HMdqE3qJUVE/oq
kBSapqjVjLDMOrNGQ+Tc6VGsKMZH8FE/TXHQJ/IM5Iuiu2eozEwwVUomF+7cfqn+9OsVsqCONQ1M
g0oRlangiqasJDhhMfnlGGqwAwmgWRGQA6dmhTuua1s8zdvIv540zY6p5au8cAKVhqyyKK7wbxEE
SGuFqX+NYoyRV+rfWCcWM+hJEmnWS8LNAKkd13YE2+17sPYzUdZ23DmTxXK6KlAxKFW27CBySUfg
qdNXp2DSs2KAQYih27pBNMuHfGbM/ATFPWFvxg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
lYoEi/e8HsDTz6N11EDe/B/iitERmeYndlCklmCluwgb0N4W80JUGVlkd7NlRZHRNhxaNBJPkcjC
n61nO0tb17NwsMwjbY5TF8JWRYTNw1JXCFacvQYrdKv4/7QNQEtwVGiCLxFhOA8aHlWMZIrc2fri
VRMVWaEBcPwCGorlVIM=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QEw9fEsWFbdX0OQLvYs/gl+zyEOW3ak9TdQVaq+0AXXOT3LIqF7wDxJ6ZBnlf9mNbdsUVH5tAz1o
H8u7ihJl1L3THEvugW+TS8hkvVbEA9rKO2vV15KAj4Lla7UdFT/xDfe79RFarlLI7yGrubjgdoRi
QWy//UKsffG7IWNwmoSuppWiWB4ZHJtkunNyIkm70JPGyZF62VxJg1MTT+5LUbZG5vZjjuHZud9w
xJaKv1tFP/x8RVqLU5gPOqGqTW7/nKO2S+450Vo4D9vAmBVVcXpaL1EbSmCvQ+qJmcQKtf9qYFRV
Zko08hbpHjPxstqvTDro01jRzB8592m4xU2TWA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TC7q853CWBPPJgbRfgDV1lmjUwSAtliljShAyNFg8sfRfwDzchthzoSPH1UCHV++E2JXacEKq1lB
UWsNP92U4Xh0/Gu+6esOI0pJb8I+TRTxyBN1I4cRQEfQHcwfhbSdeH3yX9OV3opLEqYmT37hWU+J
zCawYnxVESI0FtRzEXve9gdEWlrKKckrT/hp4mvxxOjvOkOSQBvy0elgUOqh6mEOZl+JnUbsR+Wm
CoZLE1eefMZy3FnVmyDNPv3JPXi88aLXMyimal0MYFkTiS4XJiGT3eAIMIbksehXY+eYi/KFpZWQ
GHpX+lG3UmiWWLwyPakFwKEHbrBc70AlJ2eV9g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
j9nmCKgjPWNChPbpSW6EWLrMA6oCG2JGPoum8px09v0PEAh0DRXZi0J8HPzXUsZgOEMcKpA7X54u
YFcDDCLAQ+urha/eSPbQYHQh4yGCursxAQ1C6LEyNQ2wJ0eLlO2bJeAl/gof06zqsYVM2lLJVNv5
wao1k2bmgPdfpfY3c9vPD0fSMuZPS41EoRS0cQhO5GTZnKdjxm6tEUL3GnTjB8ynSCIbCJUsMtAX
4FRHNa52gudx5B5fagR+lXgFhE7e++rWTJELr7SYB+r5Es8qZLTpCH8TrQxEkV0rY/+e4sAjNE2D
gHw8GD7VcUtc15B8y1BbVmh29qc8Nd3V2i/miA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UkCD6I/Vye4qNoNoa3hIexBXG3xyKUJPAHAjIo7UcNVCDXpMQiYEtPDqExZMfiPlJn2nswCYIfIJ
FYWqMCloKSQyyI/7yZ2EtbyWEklb/P5IyZyvGi6hhFUo/JFTb12b4bK0gZPr+bCDdlVQKTx5GVHz
wptdUJO2omSj8axVMPbLRRtVzlJIZ29dTJ2ATXVXAcBxPnFfHRAMnYYKLeeLExX61vQvpqrkLQHm
XG7hpVzJi56gYKAzxa2BLq072OCVpVS70bfWlhlSTVcSlCrUf+EcarEk4FD8+Ih2NCvrqremG6yn
TtcBn8Xr8M/6zhOYvLi6AD6eArDMKA8n+Ccv8A==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
A5y5QVZU8yjPexRVPioSiAGohCHD5DX5FVobuMyhcgQRExLUhPvnnS8HOtxTj/2IapEcz68gFMGG
Hpi+m725u85/om/Vze9pGIW9Mn328Kz2FIg3W5EvGstfGwY+48LiAGAmTR269JS4lJGVYWYOz7Xk
S8cEsFd2m7j8iyKtARJzD90+UdXq/cIIh725jC9i8nbgxB364zddvm1Z/DF3JRw1qFp6GGcuRai1
KNcJ1j8c9wtIgktpsteU3e5+bxHEw8NT3gWXUFYjm00NDq97Jals8Jjktmum2nQxoF7ivPacfEey
gnSF6jRMkTsZObzc30hAhs0CEtc33hZLhPLHSn8pQ0WyvKJLHdd5s2yckgTZtqxC1Sbwe7WEgNXe
ZMX3pIkz+aoXsAL7GBLyVBMVQcyMoF0w8QGAaTe8sqatABwPqXidYRqNROTf62IYcMpV89XYgaTv
EwIn/oni9KOFd2BFVxRZbFGGC4IjvigsTBUijI+Dk6kVnDh240clGcc4

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Omtp+lCaqUx7Z4qdFj2zrN8LpCkit2eX4hlMtig+ielGm/x4FSZkpjoFmiqdKFPi2eg0pg09MSai
XyGH68UzAR7Xrj8f1jlIoUmMKp4GcxfdqfTeuu7kWGOJEP6cvgTjSJFj2gawDv7f4yZcltnK2x0L
e4GW/rBTmGvZtKWb2ahjINLxPuh3dDaSaWdb+zVgbtyrI5FrjxBkq+aOxSjyNsqnCx1L0uWbxnkl
88NbXN3dTaECXHNm/fsleayM5hKis7kTv9BFajJMGy+BhQlmIYpE+F5zchnTTFUFJZCz1sX9Fc8e
HcY7irB8mR3ajdzjUZLBQEMktp096Nheq3U75A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hpeBLwN9x2ZFDwroYLlUe5GjjDepHik2l0c2s3/6S7JPCRkzQSyt2V1Ad/JewAs/QNp5SXSbYYB4
rQl0My1LDMF3xw43r0g2IbcyHVpPhGp0W5msuQdF67afnsRv90iJYWLMI3QkYGCTWAzl4HrLxFSg
3z8XZRK670IcxznOrlvgHmIKsvubZrBkuc1EynrVb9Nw16QnIx2rc4WgcEXeFf+4i1RoYLDd3gXK
NFCNMdtaRYUThunFP6Z4ViZ5UnDmKq+IMhd31jTaqIlWOBDxPI1+v5RJYxIyTbn4rxlKR2fNbl5/
z4OUjBTd+1GH3I2OXlqmAOvIhpe2Z2HH7nZu/A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Mt2RhTSUwEIEWeNARbyL+EdfS1UF6nPaL/fKl/7oO2gina93egwCWDLl1fbBtkfaPco0cu4MJ9K3
OraAsyHRlY+MNShmJ1LzAIA1LjZx4y55lu9dlQqSUXR7AW7wVbkg1864mK+hM/1XygU0jvebKNW9
B7xSER+asLO6pxi0mt7uC2PHxLPAYEszFhmnap82TtbDGdQ2qtyekY+ngs+N2fAdsblxVwJruiMl
e6XJ127M8N1mYwhWU2HtRpBOSnnKoHgD9fG51XK/rhk8DxT66QnX9uLPB+H25eDupBJGi1Y5o6x8
hOwZiSUVlBLh7brfzevh7+eRn+7es6wBas0+3w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 53920)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
