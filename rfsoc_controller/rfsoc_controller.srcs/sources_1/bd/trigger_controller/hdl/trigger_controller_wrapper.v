//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Fri Jul 26 12:09:20 2019
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
    pipeline_active_in_10,
    pipeline_active_in_11,
    pipeline_active_in_12,
    pipeline_active_in_13,
    pipeline_active_in_14,
    pipeline_active_in_15,
    pipeline_active_in_2,
    pipeline_active_in_3,
    pipeline_active_in_4,
    pipeline_active_in_5,
    pipeline_active_in_6,
    pipeline_active_in_7,
    pipeline_active_in_8,
    pipeline_active_in_9,
    rf_clk,
    rf_reset,
    trigger_c0,
    trigger_c1,
    trigger_c10,
    trigger_c11,
    trigger_c12,
    trigger_c13,
    trigger_c14,
    trigger_c15,
    trigger_c2,
    trigger_c3,
    trigger_c4,
    trigger_c5,
    trigger_c6,
    trigger_c7,
    trigger_c8,
    trigger_c9);
  input ext_trigger_in;
  input [15:0]gpio_in;
  input microblaze_clk;
  input microblaze_reset;
  input pipeline_active_in_0;
  input pipeline_active_in_1;
  input pipeline_active_in_10;
  input pipeline_active_in_11;
  input pipeline_active_in_12;
  input pipeline_active_in_13;
  input pipeline_active_in_14;
  input pipeline_active_in_15;
  input pipeline_active_in_2;
  input pipeline_active_in_3;
  input pipeline_active_in_4;
  input pipeline_active_in_5;
  input pipeline_active_in_6;
  input pipeline_active_in_7;
  input pipeline_active_in_8;
  input pipeline_active_in_9;
  input rf_clk;
  input rf_reset;
  output trigger_c0;
  output trigger_c1;
  output trigger_c10;
  output trigger_c11;
  output trigger_c12;
  output trigger_c13;
  output trigger_c14;
  output trigger_c15;
  output trigger_c2;
  output trigger_c3;
  output trigger_c4;
  output trigger_c5;
  output trigger_c6;
  output trigger_c7;
  output trigger_c8;
  output trigger_c9;

  wire ext_trigger_in;
  wire [15:0]gpio_in;
  wire microblaze_clk;
  wire microblaze_reset;
  wire pipeline_active_in_0;
  wire pipeline_active_in_1;
  wire pipeline_active_in_10;
  wire pipeline_active_in_11;
  wire pipeline_active_in_12;
  wire pipeline_active_in_13;
  wire pipeline_active_in_14;
  wire pipeline_active_in_15;
  wire pipeline_active_in_2;
  wire pipeline_active_in_3;
  wire pipeline_active_in_4;
  wire pipeline_active_in_5;
  wire pipeline_active_in_6;
  wire pipeline_active_in_7;
  wire pipeline_active_in_8;
  wire pipeline_active_in_9;
  wire rf_clk;
  wire rf_reset;
  wire trigger_c0;
  wire trigger_c1;
  wire trigger_c10;
  wire trigger_c11;
  wire trigger_c12;
  wire trigger_c13;
  wire trigger_c14;
  wire trigger_c15;
  wire trigger_c2;
  wire trigger_c3;
  wire trigger_c4;
  wire trigger_c5;
  wire trigger_c6;
  wire trigger_c7;
  wire trigger_c8;
  wire trigger_c9;

  trigger_controller trigger_controller_i
       (.ext_trigger_in(ext_trigger_in),
        .gpio_in(gpio_in),
        .microblaze_clk(microblaze_clk),
        .microblaze_reset(microblaze_reset),
        .pipeline_active_in_0(pipeline_active_in_0),
        .pipeline_active_in_1(pipeline_active_in_1),
        .pipeline_active_in_10(pipeline_active_in_10),
        .pipeline_active_in_11(pipeline_active_in_11),
        .pipeline_active_in_12(pipeline_active_in_12),
        .pipeline_active_in_13(pipeline_active_in_13),
        .pipeline_active_in_14(pipeline_active_in_14),
        .pipeline_active_in_15(pipeline_active_in_15),
        .pipeline_active_in_2(pipeline_active_in_2),
        .pipeline_active_in_3(pipeline_active_in_3),
        .pipeline_active_in_4(pipeline_active_in_4),
        .pipeline_active_in_5(pipeline_active_in_5),
        .pipeline_active_in_6(pipeline_active_in_6),
        .pipeline_active_in_7(pipeline_active_in_7),
        .pipeline_active_in_8(pipeline_active_in_8),
        .pipeline_active_in_9(pipeline_active_in_9),
        .rf_clk(rf_clk),
        .rf_reset(rf_reset),
        .trigger_c0(trigger_c0),
        .trigger_c1(trigger_c1),
        .trigger_c10(trigger_c10),
        .trigger_c11(trigger_c11),
        .trigger_c12(trigger_c12),
        .trigger_c13(trigger_c13),
        .trigger_c14(trigger_c14),
        .trigger_c15(trigger_c15),
        .trigger_c2(trigger_c2),
        .trigger_c3(trigger_c3),
        .trigger_c4(trigger_c4),
        .trigger_c5(trigger_c5),
        .trigger_c6(trigger_c6),
        .trigger_c7(trigger_c7),
        .trigger_c8(trigger_c8),
        .trigger_c9(trigger_c9));
endmodule
