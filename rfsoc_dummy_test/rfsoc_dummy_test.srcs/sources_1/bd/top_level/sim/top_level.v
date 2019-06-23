//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Fri Jun 21 17:32:20 2019
//Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
//Command     : generate_target top_level.bd
//Design      : top_level
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "top_level,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=top_level,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,da_board_cnt=1,da_clkrst_cnt=1,da_rf_converter_usp_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "top_level.hwdef" *) 
module top_level
   (dac0_clk_clk_n,
    dac0_clk_clk_p,
    diff_clock_rtl_clk_n,
    diff_clock_rtl_clk_p,
    sysref_in_diff_n,
    sysref_in_diff_p,
    vout00_v_n,
    vout00_v_p);
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 dac0_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dac0_clk, CAN_DEBUG false, FREQ_HZ 200000000.0" *) input dac0_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 dac0_clk CLK_P" *) input dac0_clk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 diff_clock_rtl CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME diff_clock_rtl, CAN_DEBUG false, FREQ_HZ 300000000" *) input diff_clock_rtl_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 diff_clock_rtl CLK_P" *) input diff_clock_rtl_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:display_usp_rf_data_converter:diff_pins:1.0 sysref_in diff_n" *) input sysref_in_diff_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_usp_rf_data_converter:diff_pins:1.0 sysref_in diff_p" *) input sysref_in_diff_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout00 V_N" *) output vout00_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout00 V_P" *) output vout00_v_p;

  wire clk_wiz_clk_out1;
  wire dac0_clk_1_CLK_N;
  wire dac0_clk_1_CLK_P;
  wire diff_clock_rtl_1_CLK_N;
  wire diff_clock_rtl_1_CLK_P;
  wire dummy_controller_0_reset;
  wire dummy_controller_0_t_valid;
  wire sysref_in_1_diff_n;
  wire sysref_in_1_diff_p;
  wire usp_rf_data_converter_0_clk_dac0;
  wire usp_rf_data_converter_0_s00_axis_tready;
  wire usp_rf_data_converter_0_vout00_V_N;
  wire usp_rf_data_converter_0_vout00_V_P;

  assign dac0_clk_1_CLK_N = dac0_clk_clk_n;
  assign dac0_clk_1_CLK_P = dac0_clk_clk_p;
  assign diff_clock_rtl_1_CLK_N = diff_clock_rtl_clk_n;
  assign diff_clock_rtl_1_CLK_P = diff_clock_rtl_clk_p;
  assign sysref_in_1_diff_n = sysref_in_diff_n;
  assign sysref_in_1_diff_p = sysref_in_diff_p;
  assign vout00_v_n = usp_rf_data_converter_0_vout00_V_N;
  assign vout00_v_p = usp_rf_data_converter_0_vout00_V_P;
  top_level_clk_wiz_0 clk_wiz
       (.clk_in1_n(diff_clock_rtl_1_CLK_N),
        .clk_in1_p(diff_clock_rtl_1_CLK_P),
        .clk_out1(clk_wiz_clk_out1));
  top_level_dummy_controller_0_0 dummy_controller_0
       (.reset(dummy_controller_0_reset),
        .t_valid(dummy_controller_0_t_valid));
  top_level_ila_0_0 ila_0
       (.clk(clk_wiz_clk_out1),
        .probe0(usp_rf_data_converter_0_s00_axis_tready),
        .probe1(dummy_controller_0_reset),
        .probe2(dummy_controller_0_t_valid),
        .probe3(usp_rf_data_converter_0_clk_dac0));
  top_level_usp_rf_data_converter_0_0 usp_rf_data_converter_0
       (.clk_dac0(usp_rf_data_converter_0_clk_dac0),
        .dac0_clk_n(dac0_clk_1_CLK_N),
        .dac0_clk_p(dac0_clk_1_CLK_P),
        .s00_axis_tdata({dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid,dummy_controller_0_t_valid}),
        .s00_axis_tready(usp_rf_data_converter_0_s00_axis_tready),
        .s00_axis_tvalid(dummy_controller_0_t_valid),
        .s0_axis_aclk(usp_rf_data_converter_0_clk_dac0),
        .s0_axis_aresetn(dummy_controller_0_reset),
        .s_axi_aclk(usp_rf_data_converter_0_clk_dac0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_aresetn(dummy_controller_0_reset),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bready(1'b0),
        .s_axi_rready(1'b0),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wstrb({1'b1,1'b1,1'b1,1'b1}),
        .s_axi_wvalid(1'b0),
        .sysref_in_n(sysref_in_1_diff_n),
        .sysref_in_p(sysref_in_1_diff_p),
        .vout00_n(usp_rf_data_converter_0_vout00_V_N),
        .vout00_p(usp_rf_data_converter_0_vout00_V_P));
endmodule
