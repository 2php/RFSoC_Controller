// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Fri Jun 28 19:05:11 2019
// Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_rf_data_pipeline_1_0_stub.v
// Design      : top_level_rf_data_pipeline_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "rf_data_pipeline,Vivado 2019.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(S_AXIS_0_tdata, S_AXIS_0_tready, 
  S_AXIS_0_tvalid, ext_trigger_0, gpio_in_0, m_axis_0_tdata, m_axis_0_tready, 
  m_axis_0_tvalid, microblaze_clk, microblaze_resetn, rf_clk, rf_resetn)
/* synthesis syn_black_box black_box_pad_pin="S_AXIS_0_tdata[31:0],S_AXIS_0_tready,S_AXIS_0_tvalid,ext_trigger_0,gpio_in_0[7:0],m_axis_0_tdata[255:0],m_axis_0_tready,m_axis_0_tvalid,microblaze_clk,microblaze_resetn,rf_clk,rf_resetn" */;
  input [31:0]S_AXIS_0_tdata;
  output S_AXIS_0_tready;
  input S_AXIS_0_tvalid;
  input ext_trigger_0;
  input [7:0]gpio_in_0;
  output [255:0]m_axis_0_tdata;
  input m_axis_0_tready;
  output m_axis_0_tvalid;
  input microblaze_clk;
  input microblaze_resetn;
  input rf_clk;
  input rf_resetn;
endmodule
