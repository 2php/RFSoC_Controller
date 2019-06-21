// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Wed Jun 19 11:05:44 2019
// Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/fpga_projects/board_microblaze_test/board_microblaze_test.srcs/sources_1/bd/top_level/ip/top_level_microblaze_mcs_0_2/top_level_microblaze_mcs_0_2_stub.v
// Design      : top_level_microblaze_mcs_0_2
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bd_c570,Vivado 2019.1" *)
module top_level_microblaze_mcs_0_2(Clk, Reset, UART_rxd, UART_txd, GPIO1_tri_o)
/* synthesis syn_black_box black_box_pad_pin="Clk,Reset,UART_rxd,UART_txd,GPIO1_tri_o[7:0]" */;
  input Clk;
  input Reset;
  input UART_rxd;
  output UART_txd;
  output [7:0]GPIO1_tri_o;
endmodule
