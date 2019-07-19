//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Thu Jul 18 11:25:43 2019
//Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
//Command     : generate_target rfsoc_data_pipeline_wrapper.bd
//Design      : rfsoc_data_pipeline_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module rfsoc_data_pipeline_wrapper
   (S_AXIS_tdata,
    S_AXIS_tready,
    S_AXIS_tvalid,
    ext_trigger,
    gpio_in,
    is_selected,
    m_axis_tdata,
    m_axis_tready,
    m_axis_tvalid,
    microblaze_clk,
    microblaze_resetn,
    pipeline_active,
    rf_clock,
    rf_resetn);
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

  wire [31:0]S_AXIS_tdata;
  wire S_AXIS_tready;
  wire S_AXIS_tvalid;
  wire ext_trigger;
  wire [15:0]gpio_in;
  wire is_selected;
  wire [255:0]m_axis_tdata;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire microblaze_clk;
  wire microblaze_resetn;
  wire pipeline_active;
  wire rf_clock;
  wire rf_resetn;

  rfsoc_data_pipeline rfsoc_data_pipeline_i
       (.S_AXIS_tdata(S_AXIS_tdata),
        .S_AXIS_tready(S_AXIS_tready),
        .S_AXIS_tvalid(S_AXIS_tvalid),
        .ext_trigger(ext_trigger),
        .gpio_in(gpio_in),
        .is_selected(is_selected),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .microblaze_clk(microblaze_clk),
        .microblaze_resetn(microblaze_resetn),
        .pipeline_active(pipeline_active),
        .rf_clock(rf_clock),
        .rf_resetn(rf_resetn));
endmodule
