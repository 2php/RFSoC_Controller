//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Tue Jul 16 18:34:58 2019
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
    dac1_clk_clk_n,
    dac1_clk_clk_p,
    dac2_clk_clk_n,
    dac2_clk_clk_p,
    dac3_clk_clk_n,
    dac3_clk_clk_p,
    diff_clock_rtl_clk_n,
    diff_clock_rtl_clk_p,
    ext_trigger_0_0,
    resetn,
    rx_0,
    sysref_in_diff_n,
    sysref_in_diff_p,
    tx_0,
    vout00_v_n,
    vout00_v_p,
    vout01_v_n,
    vout01_v_p,
    vout02_v_n,
    vout02_v_p,
    vout03_v_n,
    vout03_v_p,
    vout10_v_n,
    vout10_v_p,
    vout11_v_n,
    vout11_v_p,
    vout12_v_n,
    vout12_v_p,
    vout13_v_n,
    vout13_v_p,
    vout20_v_n,
    vout20_v_p,
    vout21_v_n,
    vout21_v_p,
    vout22_v_n,
    vout22_v_p,
    vout23_v_n,
    vout23_v_p,
    vout30_v_n,
    vout30_v_p,
    vout31_v_n,
    vout31_v_p,
    vout32_v_n,
    vout32_v_p,
    vout33_v_n,
    vout33_v_p);
  output [7:0]app_leds_tri_o;
  input dac0_clk_clk_n;
  input dac0_clk_clk_p;
  input dac1_clk_clk_n;
  input dac1_clk_clk_p;
  input dac2_clk_clk_n;
  input dac2_clk_clk_p;
  input dac3_clk_clk_n;
  input dac3_clk_clk_p;
  input diff_clock_rtl_clk_n;
  input diff_clock_rtl_clk_p;
  input ext_trigger_0_0;
  input resetn;
  input rx_0;
  input sysref_in_diff_n;
  input sysref_in_diff_p;
  output tx_0;
  output vout00_v_n;
  output vout00_v_p;
  output vout01_v_n;
  output vout01_v_p;
  output vout02_v_n;
  output vout02_v_p;
  output vout03_v_n;
  output vout03_v_p;
  output vout10_v_n;
  output vout10_v_p;
  output vout11_v_n;
  output vout11_v_p;
  output vout12_v_n;
  output vout12_v_p;
  output vout13_v_n;
  output vout13_v_p;
  output vout20_v_n;
  output vout20_v_p;
  output vout21_v_n;
  output vout21_v_p;
  output vout22_v_n;
  output vout22_v_p;
  output vout23_v_n;
  output vout23_v_p;
  output vout30_v_n;
  output vout30_v_p;
  output vout31_v_n;
  output vout31_v_p;
  output vout32_v_n;
  output vout32_v_p;
  output vout33_v_n;
  output vout33_v_p;

  wire [7:0]app_leds_tri_o;
  wire dac0_clk_clk_n;
  wire dac0_clk_clk_p;
  wire dac1_clk_clk_n;
  wire dac1_clk_clk_p;
  wire dac2_clk_clk_n;
  wire dac2_clk_clk_p;
  wire dac3_clk_clk_n;
  wire dac3_clk_clk_p;
  wire diff_clock_rtl_clk_n;
  wire diff_clock_rtl_clk_p;
  wire ext_trigger_0_0;
  wire resetn;
  wire rx_0;
  wire sysref_in_diff_n;
  wire sysref_in_diff_p;
  wire tx_0;
  wire vout00_v_n;
  wire vout00_v_p;
  wire vout01_v_n;
  wire vout01_v_p;
  wire vout02_v_n;
  wire vout02_v_p;
  wire vout03_v_n;
  wire vout03_v_p;
  wire vout10_v_n;
  wire vout10_v_p;
  wire vout11_v_n;
  wire vout11_v_p;
  wire vout12_v_n;
  wire vout12_v_p;
  wire vout13_v_n;
  wire vout13_v_p;
  wire vout20_v_n;
  wire vout20_v_p;
  wire vout21_v_n;
  wire vout21_v_p;
  wire vout22_v_n;
  wire vout22_v_p;
  wire vout23_v_n;
  wire vout23_v_p;
  wire vout30_v_n;
  wire vout30_v_p;
  wire vout31_v_n;
  wire vout31_v_p;
  wire vout32_v_n;
  wire vout32_v_p;
  wire vout33_v_n;
  wire vout33_v_p;

  top_level top_level_i
       (.app_leds_tri_o(app_leds_tri_o),
        .dac0_clk_clk_n(dac0_clk_clk_n),
        .dac0_clk_clk_p(dac0_clk_clk_p),
        .dac1_clk_clk_n(dac1_clk_clk_n),
        .dac1_clk_clk_p(dac1_clk_clk_p),
        .dac2_clk_clk_n(dac2_clk_clk_n),
        .dac2_clk_clk_p(dac2_clk_clk_p),
        .dac3_clk_clk_n(dac3_clk_clk_n),
        .dac3_clk_clk_p(dac3_clk_clk_p),
        .diff_clock_rtl_clk_n(diff_clock_rtl_clk_n),
        .diff_clock_rtl_clk_p(diff_clock_rtl_clk_p),
        .ext_trigger_0_0(ext_trigger_0_0),
        .resetn(resetn),
        .rx_0(rx_0),
        .sysref_in_diff_n(sysref_in_diff_n),
        .sysref_in_diff_p(sysref_in_diff_p),
        .tx_0(tx_0),
        .vout00_v_n(vout00_v_n),
        .vout00_v_p(vout00_v_p),
        .vout01_v_n(vout01_v_n),
        .vout01_v_p(vout01_v_p),
        .vout02_v_n(vout02_v_n),
        .vout02_v_p(vout02_v_p),
        .vout03_v_n(vout03_v_n),
        .vout03_v_p(vout03_v_p),
        .vout10_v_n(vout10_v_n),
        .vout10_v_p(vout10_v_p),
        .vout11_v_n(vout11_v_n),
        .vout11_v_p(vout11_v_p),
        .vout12_v_n(vout12_v_n),
        .vout12_v_p(vout12_v_p),
        .vout13_v_n(vout13_v_n),
        .vout13_v_p(vout13_v_p),
        .vout20_v_n(vout20_v_n),
        .vout20_v_p(vout20_v_p),
        .vout21_v_n(vout21_v_n),
        .vout21_v_p(vout21_v_p),
        .vout22_v_n(vout22_v_n),
        .vout22_v_p(vout22_v_p),
        .vout23_v_n(vout23_v_n),
        .vout23_v_p(vout23_v_p),
        .vout30_v_n(vout30_v_n),
        .vout30_v_p(vout30_v_p),
        .vout31_v_n(vout31_v_n),
        .vout31_v_p(vout31_v_p),
        .vout32_v_n(vout32_v_n),
        .vout32_v_p(vout32_v_p),
        .vout33_v_n(vout33_v_n),
        .vout33_v_p(vout33_v_p));
endmodule
