// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Tue Aug  6 10:24:18 2019
// Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top top_level_rfsoc_data_pipeline_0_0 -prefix
//               top_level_rfsoc_data_pipeline_0_0_ top_level_rfsoc_data_pipeline_1_0_stub.v
// Design      : top_level_rfsoc_data_pipeline_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "rfsoc_data_pipeline,Vivado 2019.1" *)
module top_level_rfsoc_data_pipeline_0_0(S_AXIS_tdata, S_AXIS_tready, S_AXIS_tvalid, 
  ext_trigger, gpio_in, is_selected, m_axis_tdata, m_axis_tready, m_axis_tvalid, 
  microblaze_clk, microblaze_resetn, pipeline_active, rf_clock, rf_resetn)
/* synthesis syn_black_box black_box_pad_pin="S_AXIS_tdata[31:0],S_AXIS_tready,S_AXIS_tvalid,ext_trigger,gpio_in[15:0],is_selected,m_axis_tdata[255:0],m_axis_tready,m_axis_tvalid,microblaze_clk,microblaze_resetn,pipeline_active,rf_clock,rf_resetn" */;
  input [31:0]S_AXIS_tdata;
  output S_AXIS_tready;
  input S_AXIS_tvalid;
  input ext_trigger;
  input [15:0]gpio_in;
  input is_selected;
  output [255:0]m_axis_tdata;
  input m_axis_tready;
  output m_axis_tvalid;
  input microblaze_clk;
  input microblaze_resetn;
  output pipeline_active;
  input rf_clock;
  input rf_resetn;
endmodule
