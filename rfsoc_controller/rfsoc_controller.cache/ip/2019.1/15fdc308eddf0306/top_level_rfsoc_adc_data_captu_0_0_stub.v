// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Wed Aug 14 13:26:37 2019
// Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_rfsoc_adc_data_captu_0_0_stub.v
// Design      : top_level_rfsoc_adc_data_captu_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "rfsoc_adc_data_capture,Vivado 2019.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(M_AXIS_0_tdata, M_AXIS_0_tready, 
  M_AXIS_0_tvalid, M_AXIS_1_tdata, M_AXIS_1_tready, M_AXIS_1_tvalid, M_AXIS_2_tdata, 
  M_AXIS_2_tready, M_AXIS_2_tvalid, M_AXIS_3_tdata, M_AXIS_3_tready, M_AXIS_3_tvalid, 
  ext_trigger, gpio_in, microblaze_clk, microblaze_reset, rf_clk, rf_reset, s_axis_tdata, 
  s_axis_tready, s_axis_tvalid)
/* synthesis syn_black_box black_box_pad_pin="M_AXIS_0_tdata[31:0],M_AXIS_0_tready,M_AXIS_0_tvalid,M_AXIS_1_tdata[31:0],M_AXIS_1_tready,M_AXIS_1_tvalid,M_AXIS_2_tdata[31:0],M_AXIS_2_tready,M_AXIS_2_tvalid,M_AXIS_3_tdata[31:0],M_AXIS_3_tready,M_AXIS_3_tvalid,ext_trigger,gpio_in[15:0],microblaze_clk,microblaze_reset,rf_clk,rf_reset,s_axis_tdata[127:0],s_axis_tready,s_axis_tvalid" */;
  output [31:0]M_AXIS_0_tdata;
  input M_AXIS_0_tready;
  output M_AXIS_0_tvalid;
  output [31:0]M_AXIS_1_tdata;
  input M_AXIS_1_tready;
  output M_AXIS_1_tvalid;
  output [31:0]M_AXIS_2_tdata;
  input M_AXIS_2_tready;
  output M_AXIS_2_tvalid;
  output [31:0]M_AXIS_3_tdata;
  input M_AXIS_3_tready;
  output M_AXIS_3_tvalid;
  input ext_trigger;
  input [15:0]gpio_in;
  input microblaze_clk;
  input microblaze_reset;
  input rf_clk;
  input rf_reset;
  input [127:0]s_axis_tdata;
  output s_axis_tready;
  input s_axis_tvalid;
endmodule
