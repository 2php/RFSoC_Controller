// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Mon Jul 15 10:43:51 2019
// Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/james/fpga_projects/rfsoc_controller/rfsoc_controller.srcs/sources_1/bd/top_level/ip/top_level_trigger_buffer_0_0/top_level_trigger_buffer_0_0_stub.v
// Design      : top_level_trigger_buffer_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "trigger_buffer,Vivado 2019.1" *)
module top_level_trigger_buffer_0_0(clk, reset, trigger_in, pipeline_active_in_0, 
  pipeline_active_in_1, pipeline_active_in_2, pipeline_active_in_3, pipeline_active_in_4, 
  pipeline_active_in_5, pipeline_active_in_6, pipeline_active_in_7, pipeline_active_in_8, 
  pipeline_active_in_9, pipeline_active_in_10, pipeline_active_in_11, 
  pipeline_active_in_12, pipeline_active_in_13, pipeline_active_in_14, 
  pipeline_active_in_15, trigger_out)
/* synthesis syn_black_box black_box_pad_pin="clk,reset,trigger_in,pipeline_active_in_0,pipeline_active_in_1,pipeline_active_in_2,pipeline_active_in_3,pipeline_active_in_4,pipeline_active_in_5,pipeline_active_in_6,pipeline_active_in_7,pipeline_active_in_8,pipeline_active_in_9,pipeline_active_in_10,pipeline_active_in_11,pipeline_active_in_12,pipeline_active_in_13,pipeline_active_in_14,pipeline_active_in_15,trigger_out" */;
  input clk;
  input reset;
  input trigger_in;
  input pipeline_active_in_0;
  input pipeline_active_in_1;
  input pipeline_active_in_2;
  input pipeline_active_in_3;
  input pipeline_active_in_4;
  input pipeline_active_in_5;
  input pipeline_active_in_6;
  input pipeline_active_in_7;
  input pipeline_active_in_8;
  input pipeline_active_in_9;
  input pipeline_active_in_10;
  input pipeline_active_in_11;
  input pipeline_active_in_12;
  input pipeline_active_in_13;
  input pipeline_active_in_14;
  input pipeline_active_in_15;
  output trigger_out;
endmodule
