//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Fri Jul 26 12:09:20 2019
//Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
//Command     : generate_target trigger_controller.bd
//Design      : trigger_controller
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "trigger_controller,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=trigger_controller,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "trigger_controller.hwdef" *) 
module trigger_controller
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.GPIO_IN DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.GPIO_IN, LAYERED_METADATA undef" *) input [15:0]gpio_in;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.MICROBLAZE_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.MICROBLAZE_CLK, ASSOCIATED_RESET microblaze_reset, CLK_DOMAIN trigger_controller_microblaze_clk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input microblaze_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.MICROBLAZE_RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.MICROBLAZE_RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input microblaze_reset;
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.RF_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.RF_CLK, ASSOCIATED_RESET rf_reset, CLK_DOMAIN trigger_controller_rf_clk, FREQ_HZ 250000000, INSERT_VIP 0, PHASE 0.000" *) input rf_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RF_RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RF_RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rf_reset;
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

  wire [15:0]axis_data_fifo_0_M_AXIS_TDATA;
  wire axis_data_fifo_0_M_AXIS_TREADY;
  wire axis_data_fifo_0_M_AXIS_TVALID;
  wire [15:0]gpio_buffer_0_gpio_out;
  wire [15:0]gpio_buffer_0_m_axis_TDATA;
  wire gpio_buffer_0_m_axis_TREADY;
  wire gpio_buffer_0_m_axis_TVALID;
  wire [15:0]gpio_in_1;
  wire microblaze_clk_1;
  wire microblaze_reset_1;
  wire pipeline_active_in_0_0_1;
  wire pipeline_active_in_10_0_1;
  wire pipeline_active_in_11_0_1;
  wire pipeline_active_in_12_0_1;
  wire pipeline_active_in_13_0_1;
  wire pipeline_active_in_14_0_1;
  wire pipeline_active_in_15_0_1;
  wire pipeline_active_in_1_0_1;
  wire pipeline_active_in_2_0_1;
  wire pipeline_active_in_3_0_1;
  wire pipeline_active_in_4_0_1;
  wire pipeline_active_in_5_0_1;
  wire pipeline_active_in_6_0_1;
  wire pipeline_active_in_7_0_1;
  wire pipeline_active_in_8_0_1;
  wire pipeline_active_in_9_0_1;
  wire rf_clk_1;
  wire rf_reset_1;
  wire trigger_in_0_1;
  wire trigger_module_0_trigger_c0;
  wire trigger_module_0_trigger_c1;
  wire trigger_module_0_trigger_c10;
  wire trigger_module_0_trigger_c11;
  wire trigger_module_0_trigger_c12;
  wire trigger_module_0_trigger_c13;
  wire trigger_module_0_trigger_c14;
  wire trigger_module_0_trigger_c15;
  wire trigger_module_0_trigger_c2;
  wire trigger_module_0_trigger_c3;
  wire trigger_module_0_trigger_c4;
  wire trigger_module_0_trigger_c5;
  wire trigger_module_0_trigger_c6;
  wire trigger_module_0_trigger_c7;
  wire trigger_module_0_trigger_c8;
  wire trigger_module_0_trigger_c9;

  assign gpio_in_1 = gpio_in[15:0];
  assign microblaze_clk_1 = microblaze_clk;
  assign microblaze_reset_1 = microblaze_reset;
  assign pipeline_active_in_0_0_1 = pipeline_active_in_0;
  assign pipeline_active_in_10_0_1 = pipeline_active_in_10;
  assign pipeline_active_in_11_0_1 = pipeline_active_in_11;
  assign pipeline_active_in_12_0_1 = pipeline_active_in_12;
  assign pipeline_active_in_13_0_1 = pipeline_active_in_13;
  assign pipeline_active_in_14_0_1 = pipeline_active_in_14;
  assign pipeline_active_in_15_0_1 = pipeline_active_in_15;
  assign pipeline_active_in_1_0_1 = pipeline_active_in_1;
  assign pipeline_active_in_2_0_1 = pipeline_active_in_2;
  assign pipeline_active_in_3_0_1 = pipeline_active_in_3;
  assign pipeline_active_in_4_0_1 = pipeline_active_in_4;
  assign pipeline_active_in_5_0_1 = pipeline_active_in_5;
  assign pipeline_active_in_6_0_1 = pipeline_active_in_6;
  assign pipeline_active_in_7_0_1 = pipeline_active_in_7;
  assign pipeline_active_in_8_0_1 = pipeline_active_in_8;
  assign pipeline_active_in_9_0_1 = pipeline_active_in_9;
  assign rf_clk_1 = rf_clk;
  assign rf_reset_1 = rf_reset;
  assign trigger_c0 = trigger_module_0_trigger_c0;
  assign trigger_c1 = trigger_module_0_trigger_c1;
  assign trigger_c10 = trigger_module_0_trigger_c10;
  assign trigger_c11 = trigger_module_0_trigger_c11;
  assign trigger_c12 = trigger_module_0_trigger_c12;
  assign trigger_c13 = trigger_module_0_trigger_c13;
  assign trigger_c14 = trigger_module_0_trigger_c14;
  assign trigger_c15 = trigger_module_0_trigger_c15;
  assign trigger_c2 = trigger_module_0_trigger_c2;
  assign trigger_c3 = trigger_module_0_trigger_c3;
  assign trigger_c4 = trigger_module_0_trigger_c4;
  assign trigger_c5 = trigger_module_0_trigger_c5;
  assign trigger_c6 = trigger_module_0_trigger_c6;
  assign trigger_c7 = trigger_module_0_trigger_c7;
  assign trigger_c8 = trigger_module_0_trigger_c8;
  assign trigger_c9 = trigger_module_0_trigger_c9;
  assign trigger_in_0_1 = ext_trigger_in;
  trigger_controller_axis_data_fifo_0_2 axis_data_fifo_0
       (.m_axis_aclk(rf_clk_1),
        .m_axis_tdata(axis_data_fifo_0_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_0_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_0_M_AXIS_TVALID),
        .s_axis_aclk(microblaze_clk_1),
        .s_axis_aresetn(microblaze_reset_1),
        .s_axis_tdata(gpio_buffer_0_m_axis_TDATA),
        .s_axis_tready(gpio_buffer_0_m_axis_TREADY),
        .s_axis_tvalid(gpio_buffer_0_m_axis_TVALID));
  trigger_controller_gpio_buffer_0_0 gpio_buffer_0
       (.gpio_in(gpio_in_1),
        .gpio_out(gpio_buffer_0_gpio_out),
        .m_axis_tdata(gpio_buffer_0_m_axis_TDATA),
        .m_axis_tready(gpio_buffer_0_m_axis_TREADY),
        .m_axis_tvalid(gpio_buffer_0_m_axis_TVALID),
        .s_axis_tdata(axis_data_fifo_0_M_AXIS_TDATA),
        .s_axis_tready(axis_data_fifo_0_M_AXIS_TREADY),
        .s_axis_tvalid(axis_data_fifo_0_M_AXIS_TVALID));
  trigger_controller_trigger_module_0_0 trigger_module_0
       (.gpio_in(gpio_buffer_0_gpio_out),
        .pipeline_active_in_0(pipeline_active_in_0_0_1),
        .pipeline_active_in_1(pipeline_active_in_1_0_1),
        .pipeline_active_in_10(pipeline_active_in_10_0_1),
        .pipeline_active_in_11(pipeline_active_in_11_0_1),
        .pipeline_active_in_12(pipeline_active_in_12_0_1),
        .pipeline_active_in_13(pipeline_active_in_13_0_1),
        .pipeline_active_in_14(pipeline_active_in_14_0_1),
        .pipeline_active_in_15(pipeline_active_in_15_0_1),
        .pipeline_active_in_2(pipeline_active_in_2_0_1),
        .pipeline_active_in_3(pipeline_active_in_3_0_1),
        .pipeline_active_in_4(pipeline_active_in_4_0_1),
        .pipeline_active_in_5(pipeline_active_in_5_0_1),
        .pipeline_active_in_6(pipeline_active_in_6_0_1),
        .pipeline_active_in_7(pipeline_active_in_7_0_1),
        .pipeline_active_in_8(pipeline_active_in_8_0_1),
        .pipeline_active_in_9(pipeline_active_in_9_0_1),
        .rf_clk(rf_clk_1),
        .rf_reset(rf_reset_1),
        .trigger_c0(trigger_module_0_trigger_c0),
        .trigger_c1(trigger_module_0_trigger_c1),
        .trigger_c10(trigger_module_0_trigger_c10),
        .trigger_c11(trigger_module_0_trigger_c11),
        .trigger_c12(trigger_module_0_trigger_c12),
        .trigger_c13(trigger_module_0_trigger_c13),
        .trigger_c14(trigger_module_0_trigger_c14),
        .trigger_c15(trigger_module_0_trigger_c15),
        .trigger_c2(trigger_module_0_trigger_c2),
        .trigger_c3(trigger_module_0_trigger_c3),
        .trigger_c4(trigger_module_0_trigger_c4),
        .trigger_c5(trigger_module_0_trigger_c5),
        .trigger_c6(trigger_module_0_trigger_c6),
        .trigger_c7(trigger_module_0_trigger_c7),
        .trigger_c8(trigger_module_0_trigger_c8),
        .trigger_c9(trigger_module_0_trigger_c9),
        .trigger_in(trigger_in_0_1));
endmodule
