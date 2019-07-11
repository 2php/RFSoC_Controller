// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Wed Jul 10 18:30:42 2019
// Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/james/fpga_projects/rfsoc_controller/rfsoc_controller.srcs/sources_1/bd/top_level/ip/top_level_rfsoc_data_pipeline_2_0/top_level_rfsoc_data_pipeline_2_0_stub.v
// Design      : top_level_rfsoc_data_pipeline_2_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "rfsoc_data_pipeline,Vivado 2019.1" *)
module top_level_rfsoc_data_pipeline_2_0(S_AXIS_0_tdata, S_AXIS_0_tready, 
  S_AXIS_0_tvalid, count_val_in_0, ext_trigger_0, gpio_in, is_locking, m_axis_0_tdata, 
  m_axis_0_tready, m_axis_0_tvalid, microblaze_clk, microblaze_resetn, pipeline_active, 
  rf_clock, rf_resetn)
/* synthesis syn_black_box black_box_pad_pin="S_AXIS_0_tdata[31:0],S_AXIS_0_tready,S_AXIS_0_tvalid,count_val_in_0[31:0],ext_trigger_0,gpio_in[7:0],is_locking,m_axis_0_tdata[255:0],m_axis_0_tready,m_axis_0_tvalid,microblaze_clk,microblaze_resetn,pipeline_active,rf_clock,rf_resetn" */;
  input [31:0]S_AXIS_0_tdata;
  output S_AXIS_0_tready;
  input S_AXIS_0_tvalid;
  input [31:0]count_val_in_0;
  input ext_trigger_0;
  input [7:0]gpio_in;
  input is_locking;
  output [255:0]m_axis_0_tdata;
  input m_axis_0_tready;
  output m_axis_0_tvalid;
  input microblaze_clk;
  input microblaze_resetn;
  output pipeline_active;
  input rf_clock;
  input rf_resetn;
endmodule
