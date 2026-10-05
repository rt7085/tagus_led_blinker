// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Sun Oct  4 10:27:46 2026
// Host        : capybara running 64-bit Ubuntu 24.04.5 LTS
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
