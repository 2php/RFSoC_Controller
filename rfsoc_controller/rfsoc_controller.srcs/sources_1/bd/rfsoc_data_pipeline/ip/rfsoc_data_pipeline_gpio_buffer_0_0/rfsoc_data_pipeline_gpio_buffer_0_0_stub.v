// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Tue Jul  2 10:04:02 2019
// Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/james/fpga_projects/rfsoc_controller/rfsoc_controller.srcs/sources_1/bd/rfsoc_data_pipeline/ip/rfsoc_data_pipeline_gpio_buffer_0_0/rfsoc_data_pipeline_gpio_buffer_0_0_stub.v
// Design      : rfsoc_data_pipeline_gpio_buffer_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "gpio_buffer,Vivado 2019.1" *)
module rfsoc_data_pipeline_gpio_buffer_0_0(gpio_in, gpio_out, s_axis_tvalid, 
  s_axis_tready, s_axis_tdata, m_axis_tdata, m_axis_tvalid, m_axis_tready)
/* synthesis syn_black_box black_box_pad_pin="gpio_in[7:0],gpio_out[7:0],s_axis_tvalid,s_axis_tready,s_axis_tdata[7:0],m_axis_tdata[7:0],m_axis_tvalid,m_axis_tready" */;
  input [7:0]gpio_in;
  output [7:0]gpio_out;
  input s_axis_tvalid;
  output s_axis_tready;
  input [7:0]s_axis_tdata;
  output [7:0]m_axis_tdata;
  output m_axis_tvalid;
  input m_axis_tready;
endmodule
