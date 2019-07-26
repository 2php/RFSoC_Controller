// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Fri Jul 26 13:46:44 2019
// Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/james/fpga_projects/rfsoc_controller/rfsoc_controller.srcs/sources_1/bd/top_level/ip/top_level_channel_select_0_0/top_level_channel_select_0_0_stub.v
// Design      : top_level_channel_select_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "channel_select,Vivado 2019.1" *)
module top_level_channel_select_0_0(mb_clk, mb_reset, gpio_in, ch0, ch1, ch2, ch3, ch4, ch5, 
  ch6, ch7, ch8, ch9, ch10, ch11, ch12, ch13, ch14, ch15)
/* synthesis syn_black_box black_box_pad_pin="mb_clk,mb_reset,gpio_in[15:0],ch0,ch1,ch2,ch3,ch4,ch5,ch6,ch7,ch8,ch9,ch10,ch11,ch12,ch13,ch14,ch15" */;
  input mb_clk;
  input mb_reset;
  input [15:0]gpio_in;
  output ch0;
  output ch1;
  output ch2;
  output ch3;
  output ch4;
  output ch5;
  output ch6;
  output ch7;
  output ch8;
  output ch9;
  output ch10;
  output ch11;
  output ch12;
  output ch13;
  output ch14;
  output ch15;
endmodule
