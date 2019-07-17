// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Tue Jul 16 18:36:25 2019
// Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top top_level_trigger_controller_0_0 -prefix
//               top_level_trigger_controller_0_0_ top_level_trigger_controller_2_0_stub.v
// Design      : top_level_trigger_controller_2_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "trigger_controller,Vivado 2019.1" *)
module top_level_trigger_controller_0_0(ext_trigger_in, gpio_in, microblaze_clk, 
  microblaze_reset, pipeline_active_in_0, pipeline_active_in_1, pipeline_active_in_2, 
  pipeline_active_in_3, rf_clk, rf_reset, trigger_c0, trigger_c1, trigger_c2, trigger_c3)
/* synthesis syn_black_box black_box_pad_pin="ext_trigger_in,gpio_in[15:0],microblaze_clk,microblaze_reset,pipeline_active_in_0,pipeline_active_in_1,pipeline_active_in_2,pipeline_active_in_3,rf_clk,rf_reset,trigger_c0,trigger_c1,trigger_c2,trigger_c3" */;
  input ext_trigger_in;
  input [15:0]gpio_in;
  input microblaze_clk;
  input microblaze_reset;
  input pipeline_active_in_0;
  input pipeline_active_in_1;
  input pipeline_active_in_2;
  input pipeline_active_in_3;
  input rf_clk;
  input rf_reset;
  output trigger_c0;
  output trigger_c1;
  output trigger_c2;
  output trigger_c3;
endmodule
