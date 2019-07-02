//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Mon Jul  1 08:57:58 2019
//Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
//Command     : generate_target top_level_wrapper.bd
//Design      : top_level_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module top_level_wrapper
   (app_leds_tri_o,
    dac0_clk_clk_n,
    dac0_clk_clk_p,
    diff_clock_rtl_clk_n,
    diff_clock_rtl_clk_p,
    ext_trigger,
    reset_in,
    sysref_in_diff_n,
    sysref_in_diff_p,
    uart_rx,
    uart_tx,
    vout00_v_n,
    vout00_v_p,
    vout01_v_n,
    vout01_v_p);
  output [7:0]app_leds_tri_o;
  input dac0_clk_clk_n;
  input dac0_clk_clk_p;
  input diff_clock_rtl_clk_n;
  input diff_clock_rtl_clk_p;
  input ext_trigger;
  input reset_in;
  input sysref_in_diff_n;
  input sysref_in_diff_p;
  input uart_rx;
  output uart_tx;
  output vout00_v_n;
  output vout00_v_p;
  output vout01_v_n;
  output vout01_v_p;

  wire [7:0]app_leds_tri_o;
  wire dac0_clk_clk_n;
  wire dac0_clk_clk_p;
  wire diff_clock_rtl_clk_n;
  wire diff_clock_rtl_clk_p;
  wire ext_trigger;
  wire reset_in;
  wire sysref_in_diff_n;
  wire sysref_in_diff_p;
  wire uart_rx;
  wire uart_tx;
  wire vout00_v_n;
  wire vout00_v_p;
  wire vout01_v_n;
  wire vout01_v_p;

  top_level top_level_i
       (.app_leds_tri_o(app_leds_tri_o),
        .dac0_clk_clk_n(dac0_clk_clk_n),
        .dac0_clk_clk_p(dac0_clk_clk_p),
        .diff_clock_rtl_clk_n(diff_clock_rtl_clk_n),
        .diff_clock_rtl_clk_p(diff_clock_rtl_clk_p),
        .ext_trigger(ext_trigger),
        .reset_in(reset_in),
        .sysref_in_diff_n(sysref_in_diff_n),
        .sysref_in_diff_p(sysref_in_diff_p),
        .uart_rx(uart_rx),
        .uart_tx(uart_tx),
        .vout00_v_n(vout00_v_n),
        .vout00_v_p(vout00_v_p),
        .vout01_v_n(vout01_v_n),
        .vout01_v_p(vout01_v_p));
endmodule
