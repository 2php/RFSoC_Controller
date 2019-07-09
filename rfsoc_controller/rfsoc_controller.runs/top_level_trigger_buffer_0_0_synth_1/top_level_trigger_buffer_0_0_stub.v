// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Tue Jul  9 15:17:23 2019
// Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_trigger_buffer_0_0_stub.v
// Design      : top_level_trigger_buffer_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "trigger_buffer,Vivado 2019.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, reset, trigger_in, pipeline_active_in_0, 
  pipeline_active_in_1, pipeline_active_in_2, pipeline_active_in_3, trigger_out)
/* synthesis syn_black_box black_box_pad_pin="clk,reset,trigger_in,pipeline_active_in_0,pipeline_active_in_1,pipeline_active_in_2,pipeline_active_in_3,trigger_out" */;
  input clk;
  input reset;
  input trigger_in;
  input pipeline_active_in_0;
  input pipeline_active_in_1;
  input pipeline_active_in_2;
  input pipeline_active_in_3;
  output trigger_out;
endmodule
