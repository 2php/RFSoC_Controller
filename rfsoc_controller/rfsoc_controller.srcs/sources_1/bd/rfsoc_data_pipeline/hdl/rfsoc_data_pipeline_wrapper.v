//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Wed Jul 10 18:14:55 2019
//Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
//Command     : generate_target rfsoc_data_pipeline_wrapper.bd
//Design      : rfsoc_data_pipeline_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module rfsoc_data_pipeline_wrapper
   (S_AXIS_0_tdata,
    S_AXIS_0_tready,
    S_AXIS_0_tvalid,
    count_val_in_0,
    ext_trigger_0,
    gpio_in,
    is_locking,
    m_axis_0_tdata,
    m_axis_0_tready,
    m_axis_0_tvalid,
    microblaze_clk,
    microblaze_resetn,
    pipeline_active,
    rf_clock,
    rf_resetn);
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

  wire [31:0]S_AXIS_0_tdata;
  wire S_AXIS_0_tready;
  wire S_AXIS_0_tvalid;
  wire [31:0]count_val_in_0;
  wire ext_trigger_0;
  wire [7:0]gpio_in;
  wire is_locking;
  wire [255:0]m_axis_0_tdata;
  wire m_axis_0_tready;
  wire m_axis_0_tvalid;
  wire microblaze_clk;
  wire microblaze_resetn;
  wire pipeline_active;
  wire rf_clock;
  wire rf_resetn;

  rfsoc_data_pipeline rfsoc_data_pipeline_i
       (.S_AXIS_0_tdata(S_AXIS_0_tdata),
        .S_AXIS_0_tready(S_AXIS_0_tready),
        .S_AXIS_0_tvalid(S_AXIS_0_tvalid),
        .count_val_in_0(count_val_in_0),
        .ext_trigger_0(ext_trigger_0),
        .gpio_in(gpio_in),
        .is_locking(is_locking),
        .m_axis_0_tdata(m_axis_0_tdata),
        .m_axis_0_tready(m_axis_0_tready),
        .m_axis_0_tvalid(m_axis_0_tvalid),
        .microblaze_clk(microblaze_clk),
        .microblaze_resetn(microblaze_resetn),
        .pipeline_active(pipeline_active),
        .rf_clock(rf_clock),
        .rf_resetn(rf_resetn));
endmodule
