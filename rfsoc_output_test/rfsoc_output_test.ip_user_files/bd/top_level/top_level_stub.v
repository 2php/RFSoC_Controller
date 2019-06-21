// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Thu Jun 20 21:36:34 2019
// Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/fpga_projects/rfsoc_output_test/rfsoc_output_test.srcs/sources_1/bd/top_level/top_level_stub.v
// Design      : top_level
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module top_level(app_leds_tri_o, dac0_clk_clk_n, 
  dac0_clk_clk_p, diff_clock_rtl_clk_n, diff_clock_rtl_clk_p, sysref_in_diff_n, 
  sysref_in_diff_p, uart2_pl_rxd, uart2_pl_txd, vout00_v_n, vout00_v_p)
/* synthesis syn_black_box black_box_pad_pin="app_leds_tri_o[7:0],dac0_clk_clk_n,dac0_clk_clk_p,diff_clock_rtl_clk_n,diff_clock_rtl_clk_p,sysref_in_diff_n,sysref_in_diff_p,uart2_pl_rxd,uart2_pl_txd,vout00_v_n,vout00_v_p" */;
  output [7:0]app_leds_tri_o;
  input dac0_clk_clk_n;
  input dac0_clk_clk_p;
  input diff_clock_rtl_clk_n;
  input diff_clock_rtl_clk_p;
  input sysref_in_diff_n;
  input sysref_in_diff_p;
  input uart2_pl_rxd;
  output uart2_pl_txd;
  output vout00_v_n;
  output vout00_v_p;
endmodule
