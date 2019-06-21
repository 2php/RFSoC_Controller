//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Thu Jun 20 15:12:53 2019
//Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
//Command     : generate_target top_level.bd
//Design      : top_level
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "top_level,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=top_level,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=7,numReposBlks=7,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,da_board_cnt=3,da_rf_converter_usp_cnt=2,synth_mode=OOC_per_BD}" *) (* HW_HANDOFF = "top_level.hwdef" *) 
module top_level
   (app_leds_tri_o,
    dac0_clk_clk_n,
    dac0_clk_clk_p,
    reset_rtl,
    sysref_in_diff_n,
    sysref_in_diff_p,
    uart2_pl_rxd,
    uart2_pl_txd,
    vout00_v_n,
    vout00_v_p);
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 app_leds TRI_O" *) output [7:0]app_leds_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 dac0_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dac0_clk, CAN_DEBUG false, FREQ_HZ 300000000.0" *) input dac0_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 dac0_clk CLK_P" *) input dac0_clk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_RTL RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_RTL, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset_rtl;
  (* X_INTERFACE_INFO = "xilinx.com:display_usp_rf_data_converter:diff_pins:1.0 sysref_in diff_n" *) input sysref_in_diff_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_usp_rf_data_converter:diff_pins:1.0 sysref_in diff_p" *) input sysref_in_diff_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 uart2_pl RxD" *) input uart2_pl_rxd;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 uart2_pl TxD" *) output uart2_pl_txd;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout00 V_N" *) output vout00_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout00 V_P" *) output vout00_v_p;

  wire [255:0]RFSoC_Controller_0_ch_0_data;
  wire clk_wiz_clk_out1;
  wire dac0_clk_1_CLK_N;
  wire dac0_clk_1_CLK_P;
  wire gpio_split_0_a_tv;
  wire gpio_split_0_arm;
  wire gpio_split_0_delay_reg_data_in;
  wire gpio_split_0_delay_reg_sclk;
  wire gpio_split_0_fire;
  wire gpio_split_0_idle_reg_data_in;
  wire gpio_split_0_idle_reg_sclk;
  wire gpio_split_0_wave_reg_cycle;
  wire gpio_split_0_wave_reg_data_in;
  wire gpio_split_0_wave_reg_pclk;
  wire gpio_split_0_wave_reg_sclk;
  wire [15:0]microblaze_mcs_0_GPIO1_tri_o;
  wire [7:0]microblaze_mcs_0_GPIO2_TRI_O;
  wire microblaze_mcs_0_UART_RxD;
  wire microblaze_mcs_0_UART_TxD;
  wire reset_rtl_1;
  wire sysref_in_1_diff_n;
  wire sysref_in_1_diff_p;
  wire usp_rf_data_converter_0_clk_dac0;
  wire usp_rf_data_converter_0_vout00_V_N;
  wire usp_rf_data_converter_0_vout00_V_P;
  wire [0:0]util_vector_logic_0_Res;

  assign app_leds_tri_o[7:0] = microblaze_mcs_0_GPIO2_TRI_O;
  assign dac0_clk_1_CLK_N = dac0_clk_clk_n;
  assign dac0_clk_1_CLK_P = dac0_clk_clk_p;
  assign microblaze_mcs_0_UART_RxD = uart2_pl_rxd;
  assign reset_rtl_1 = reset_rtl;
  assign sysref_in_1_diff_n = sysref_in_diff_n;
  assign sysref_in_1_diff_p = sysref_in_diff_p;
  assign uart2_pl_txd = microblaze_mcs_0_UART_TxD;
  assign vout00_v_n = usp_rf_data_converter_0_vout00_V_N;
  assign vout00_v_p = usp_rf_data_converter_0_vout00_V_P;
  top_level_RFSoC_Controller_0_1 RFSoC_Controller_0
       (.arm(gpio_split_0_arm),
        .ch_0_data(RFSoC_Controller_0_ch_0_data),
        .clk_in(usp_rf_data_converter_0_clk_dac0),
        .delay_reg_data_in(gpio_split_0_delay_reg_data_in),
        .delay_reg_sclk(gpio_split_0_delay_reg_sclk),
        .fire(gpio_split_0_fire),
        .idle_reg_data_in(gpio_split_0_idle_reg_data_in),
        .idle_reg_sclk(gpio_split_0_idle_reg_sclk),
        .reset(util_vector_logic_0_Res),
        .wave_reg_cycle(gpio_split_0_wave_reg_cycle),
        .wave_reg_data_in(gpio_split_0_wave_reg_data_in),
        .wave_reg_pclk(gpio_split_0_wave_reg_pclk),
        .wave_reg_sclk(gpio_split_0_wave_reg_sclk));
  top_level_clk_wiz_0 clk_wiz
       (.clk_in1(usp_rf_data_converter_0_clk_dac0),
        .clk_out1(clk_wiz_clk_out1),
        .resetn(util_vector_logic_0_Res));
  top_level_gpio_split_0_0 gpio_split_0
       (.a_tv(gpio_split_0_a_tv),
        .arm(gpio_split_0_arm),
        .delay_reg_data_in(gpio_split_0_delay_reg_data_in),
        .delay_reg_sclk(gpio_split_0_delay_reg_sclk),
        .fire(gpio_split_0_fire),
        .gpio_in(microblaze_mcs_0_GPIO1_tri_o),
        .idle_reg_data_in(gpio_split_0_idle_reg_data_in),
        .idle_reg_sclk(gpio_split_0_idle_reg_sclk),
        .wave_reg_cycle(gpio_split_0_wave_reg_cycle),
        .wave_reg_data_in(gpio_split_0_wave_reg_data_in),
        .wave_reg_pclk(gpio_split_0_wave_reg_pclk),
        .wave_reg_sclk(gpio_split_0_wave_reg_sclk));
  top_level_ila_0_0 ila_0
       (.clk(clk_wiz_clk_out1),
        .probe0(gpio_split_0_arm),
        .probe1(gpio_split_0_fire),
        .probe10(RFSoC_Controller_0_ch_0_data),
        .probe2(gpio_split_0_wave_reg_sclk),
        .probe3(gpio_split_0_wave_reg_pclk),
        .probe4(gpio_split_0_wave_reg_data_in),
        .probe5(gpio_split_0_wave_reg_cycle),
        .probe6(gpio_split_0_delay_reg_sclk),
        .probe7(gpio_split_0_delay_reg_data_in),
        .probe8(gpio_split_0_idle_reg_sclk),
        .probe9(gpio_split_0_idle_reg_data_in));
  top_level_microblaze_mcs_0_0 microblaze_mcs_0
       (.Clk(clk_wiz_clk_out1),
        .GPIO1_tri_o(microblaze_mcs_0_GPIO1_tri_o),
        .GPIO2_tri_o(microblaze_mcs_0_GPIO2_TRI_O),
        .Reset(util_vector_logic_0_Res),
        .UART_rxd(microblaze_mcs_0_UART_RxD),
        .UART_txd(microblaze_mcs_0_UART_TxD));
  top_level_usp_rf_data_converter_0_0 usp_rf_data_converter_0
       (.clk_dac0(usp_rf_data_converter_0_clk_dac0),
        .dac0_clk_n(dac0_clk_1_CLK_N),
        .dac0_clk_p(dac0_clk_1_CLK_P),
        .s00_axis_tdata(RFSoC_Controller_0_ch_0_data),
        .s00_axis_tvalid(gpio_split_0_a_tv),
        .s0_axis_aclk(usp_rf_data_converter_0_clk_dac0),
        .s0_axis_aresetn(util_vector_logic_0_Res),
        .s_axi_aclk(usp_rf_data_converter_0_clk_dac0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_aresetn(util_vector_logic_0_Res),
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
  top_level_util_vector_logic_0_0 util_vector_logic_0
       (.Op1(reset_rtl_1),
        .Res(util_vector_logic_0_Res));
endmodule
