//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Tue Jun 18 12:05:56 2019
//Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
//Command     : generate_target top_level.bd
//Design      : top_level
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "top_level,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=top_level,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=23,da_mb_cnt=2,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "top_level.hwdef" *) 
module top_level
   (app_leds_tri_o,
    diff_clock_rtl_clk_n,
    diff_clock_rtl_clk_p,
    reset_rtl);
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 app_leds TRI_O" *) output [7:0]app_leds_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 diff_clock_rtl CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME diff_clock_rtl, CAN_DEBUG false, FREQ_HZ 300000000" *) input diff_clock_rtl_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 diff_clock_rtl CLK_P" *) input diff_clock_rtl_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_RTL RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_RTL, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset_rtl;

  wire clk_wiz_clk_out1;
  wire diff_clock_rtl_1_CLK_N;
  wire diff_clock_rtl_1_CLK_P;
  wire [7:0]microblaze_mcs_0_GPIO1_TRI_O;
  wire [0:0]not_0_Res;
  wire reset_rtl_1;

  assign app_leds_tri_o[7:0] = microblaze_mcs_0_GPIO1_TRI_O;
  assign diff_clock_rtl_1_CLK_N = diff_clock_rtl_clk_n;
  assign diff_clock_rtl_1_CLK_P = diff_clock_rtl_clk_p;
  assign reset_rtl_1 = reset_rtl;
  top_level_clk_wiz_2 clk_wiz
       (.clk_in1_n(diff_clock_rtl_1_CLK_N),
        .clk_in1_p(diff_clock_rtl_1_CLK_P),
        .clk_out1(clk_wiz_clk_out1),
        .reset(not_0_Res));
  top_level_microblaze_mcs_0_2 microblaze_mcs_0
       (.Clk(clk_wiz_clk_out1),
        .GPIO1_tri_o(microblaze_mcs_0_GPIO1_TRI_O),
        .Reset(reset_rtl_1));
  top_level_util_vector_logic_0_3 not_0
       (.Op1(reset_rtl_1),
        .Res(not_0_Res));
endmodule
