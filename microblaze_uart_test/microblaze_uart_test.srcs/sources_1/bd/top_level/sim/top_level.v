//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Thu Jun 20 08:29:57 2019
//Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
//Command     : generate_target top_level.bd
//Design      : top_level
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "top_level,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=top_level,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=4,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "top_level.hwdef" *) 
module top_level
   (diff_clock_rtl_clk_n,
    diff_clock_rtl_clk_p,
    reset_rtl,
    uart2_pl_rxd,
    uart2_pl_txd);
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 diff_clock_rtl CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME diff_clock_rtl, CAN_DEBUG false, FREQ_HZ 300000000" *) input diff_clock_rtl_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 diff_clock_rtl CLK_P" *) input diff_clock_rtl_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_RTL RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_RTL, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input reset_rtl;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 uart2_pl RxD" *) input uart2_pl_rxd;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 uart2_pl TxD" *) output uart2_pl_txd;

  wire clk_wiz_clk_out1;
  wire diff_clock_rtl_1_CLK_N;
  wire diff_clock_rtl_1_CLK_P;
  wire microblaze_mcs_0_UART_RxD;
  wire microblaze_mcs_0_UART_TxD;
  wire reset_rtl_1;
  wire [0:0]util_vector_logic_0_Res;

  assign diff_clock_rtl_1_CLK_N = diff_clock_rtl_clk_n;
  assign diff_clock_rtl_1_CLK_P = diff_clock_rtl_clk_p;
  assign microblaze_mcs_0_UART_RxD = uart2_pl_rxd;
  assign reset_rtl_1 = reset_rtl;
  assign uart2_pl_txd = microblaze_mcs_0_UART_TxD;
  top_level_clk_wiz_0 clk_wiz
       (.clk_in1_n(diff_clock_rtl_1_CLK_N),
        .clk_in1_p(diff_clock_rtl_1_CLK_P),
        .clk_out1(clk_wiz_clk_out1),
        .reset(reset_rtl_1));
  top_level_microblaze_mcs_0_0 microblaze_mcs_0
       (.Clk(clk_wiz_clk_out1),
        .Reset(util_vector_logic_0_Res),
        .UART_rxd(microblaze_mcs_0_UART_RxD),
        .UART_txd(microblaze_mcs_0_UART_TxD));
  top_level_util_vector_logic_0_0 util_vector_logic_0
       (.Op1(reset_rtl_1),
        .Res(util_vector_logic_0_Res));
endmodule
