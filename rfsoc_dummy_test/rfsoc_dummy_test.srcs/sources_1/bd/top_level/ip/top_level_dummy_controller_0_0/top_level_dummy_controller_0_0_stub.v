// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Fri Jun 21 17:37:57 2019
// Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/james/fpga_projects/rfsoc_dummy_test/rfsoc_dummy_test.srcs/sources_1/bd/top_level/ip/top_level_dummy_controller_0_0/top_level_dummy_controller_0_0_stub.v
// Design      : top_level_dummy_controller_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "dummy_controller,Vivado 2019.1" *)
module top_level_dummy_controller_0_0(dummy_data, t_valid, reset)
/* synthesis syn_black_box black_box_pad_pin="dummy_data[255:0],t_valid,reset" */;
  output [255:0]dummy_data;
  output t_valid;
  output reset;
endmodule
