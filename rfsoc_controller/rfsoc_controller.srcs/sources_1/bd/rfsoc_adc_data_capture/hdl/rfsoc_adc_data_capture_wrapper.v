//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Sun Sep  1 15:24:15 2019
//Host        : MB241LABVIEW running 64-bit major release  (build 9200)
//Command     : generate_target rfsoc_adc_data_capture_wrapper.bd
//Design      : rfsoc_adc_data_capture_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module rfsoc_adc_data_capture_wrapper
   (M_AXIS_0_tdata,
    M_AXIS_0_tready,
    M_AXIS_0_tvalid,
    M_AXIS_1_tdata,
    M_AXIS_1_tready,
    M_AXIS_1_tvalid,
    M_AXIS_2_tdata,
    M_AXIS_2_tready,
    M_AXIS_2_tvalid,
    M_AXIS_3_tdata,
    M_AXIS_3_tready,
    M_AXIS_3_tvalid,
    ext_trigger,
    gpio_in,
    microblaze_clk,
    microblaze_reset,
    rf_clk,
    rf_reset,
    s_axis_tdata,
    s_axis_tready,
    s_axis_tvalid);
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

  wire [31:0]M_AXIS_0_tdata;
  wire M_AXIS_0_tready;
  wire M_AXIS_0_tvalid;
  wire [31:0]M_AXIS_1_tdata;
  wire M_AXIS_1_tready;
  wire M_AXIS_1_tvalid;
  wire [31:0]M_AXIS_2_tdata;
  wire M_AXIS_2_tready;
  wire M_AXIS_2_tvalid;
  wire [31:0]M_AXIS_3_tdata;
  wire M_AXIS_3_tready;
  wire M_AXIS_3_tvalid;
  wire ext_trigger;
  wire [15:0]gpio_in;
  wire microblaze_clk;
  wire microblaze_reset;
  wire rf_clk;
  wire rf_reset;
  wire [127:0]s_axis_tdata;
  wire s_axis_tready;
  wire s_axis_tvalid;

  rfsoc_adc_data_capture rfsoc_adc_data_capture_i
       (.M_AXIS_0_tdata(M_AXIS_0_tdata),
        .M_AXIS_0_tready(M_AXIS_0_tready),
        .M_AXIS_0_tvalid(M_AXIS_0_tvalid),
        .M_AXIS_1_tdata(M_AXIS_1_tdata),
        .M_AXIS_1_tready(M_AXIS_1_tready),
        .M_AXIS_1_tvalid(M_AXIS_1_tvalid),
        .M_AXIS_2_tdata(M_AXIS_2_tdata),
        .M_AXIS_2_tready(M_AXIS_2_tready),
        .M_AXIS_2_tvalid(M_AXIS_2_tvalid),
        .M_AXIS_3_tdata(M_AXIS_3_tdata),
        .M_AXIS_3_tready(M_AXIS_3_tready),
        .M_AXIS_3_tvalid(M_AXIS_3_tvalid),
        .ext_trigger(ext_trigger),
        .gpio_in(gpio_in),
        .microblaze_clk(microblaze_clk),
        .microblaze_reset(microblaze_reset),
        .rf_clk(rf_clk),
        .rf_reset(rf_reset),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
endmodule
