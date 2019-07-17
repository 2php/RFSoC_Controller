//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Tue Jul 16 18:10:52 2019
//Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
//Command     : generate_target trigger_controller_wrapper.bd
//Design      : trigger_controller_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module trigger_controller_wrapper
   (ext_trigger_in,
    gpio_in,
    microblaze_clk,
    microblaze_reset,
    pipeline_active_in_0,
    pipeline_active_in_1,
    pipeline_active_in_2,
    pipeline_active_in_3,
    rf_clk,
    rf_reset,
    trigger_c0,
    trigger_c1,
    trigger_c2,
    trigger_c3);
  input ext_trigger_in;
  input [15:0]gpio_in;
  input microblaze_clk;
  input microblaze_reset;
  input pipeline_active_in_0;
  input pipeline_active_in_1;
  input pipeline_active_in_2;
  input pipeline_active_in_3;
  input rf_clk;
  input rf_reset;
  output trigger_c0;
  output trigger_c1;
  output trigger_c2;
  output trigger_c3;

  wire ext_trigger_in;
  wire [15:0]gpio_in;
  wire microblaze_clk;
  wire microblaze_reset;
  wire pipeline_active_in_0;
  wire pipeline_active_in_1;
  wire pipeline_active_in_2;
  wire pipeline_active_in_3;
  wire rf_clk;
  wire rf_reset;
  wire trigger_c0;
  wire trigger_c1;
  wire trigger_c2;
  wire trigger_c3;

  trigger_controller trigger_controller_i
       (.ext_trigger_in(ext_trigger_in),
        .gpio_in(gpio_in),
        .microblaze_clk(microblaze_clk),
        .microblaze_reset(microblaze_reset),
        .pipeline_active_in_0(pipeline_active_in_0),
        .pipeline_active_in_1(pipeline_active_in_1),
        .pipeline_active_in_2(pipeline_active_in_2),
        .pipeline_active_in_3(pipeline_active_in_3),
        .rf_clk(rf_clk),
        .rf_reset(rf_reset),
        .trigger_c0(trigger_c0),
        .trigger_c1(trigger_c1),
        .trigger_c2(trigger_c2),
        .trigger_c3(trigger_c3));
endmodule
