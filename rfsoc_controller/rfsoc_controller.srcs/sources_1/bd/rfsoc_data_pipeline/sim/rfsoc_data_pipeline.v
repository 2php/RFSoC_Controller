//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Mon Jul 15 17:25:30 2019
//Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
//Command     : generate_target rfsoc_data_pipeline.bd
//Design      : rfsoc_data_pipeline
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "rfsoc_data_pipeline,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=rfsoc_data_pipeline,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=10,numReposBlks=10,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=4,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "rfsoc_data_pipeline.hwdef" *) 
module rfsoc_data_pipeline
   (S_AXIS_tdata,
    S_AXIS_tready,
    S_AXIS_tvalid,
    ext_trigger,
    gpio_in,
    is_selected,
    m_axis_tdata,
    m_axis_tready,
    m_axis_tvalid,
    microblaze_clk,
    microblaze_resetn,
    pipeline_active,
    rf_clock,
    rf_resetn);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, CLK_DOMAIN rfsoc_data_pipeline_microblaze_clk, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [31:0]S_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output S_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) input S_AXIS_tvalid;
  input ext_trigger;
  input [15:0]gpio_in;
  input is_selected;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis, CLK_DOMAIN rfsoc_data_pipeline_rf_clock, FREQ_HZ 250000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [255:0]m_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TREADY" *) input m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TVALID" *) output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.MICROBLAZE_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.MICROBLAZE_CLK, ASSOCIATED_BUSIF S_AXIS, ASSOCIATED_RESET microblaze_resetn, CLK_DOMAIN rfsoc_data_pipeline_microblaze_clk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input microblaze_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.MICROBLAZE_RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.MICROBLAZE_RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input microblaze_resetn;
  output pipeline_active;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.RF_CLOCK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.RF_CLOCK, ASSOCIATED_BUSIF m_axis, ASSOCIATED_RESET rf_resetn, CLK_DOMAIN rfsoc_data_pipeline_rf_clock, FREQ_HZ 250000000, INSERT_VIP 0, PHASE 0.000" *) input rf_clock;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RF_RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RF_RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rf_resetn;

  wire [15:0]Net;
  wire [31:0]S_AXIS_0_1_TDATA;
  wire S_AXIS_0_1_TREADY;
  wire S_AXIS_0_1_TVALID;
  wire [31:0]axis_data_fifo_0_M_AXIS_TDATA;
  wire axis_data_fifo_0_M_AXIS_TREADY;
  wire axis_data_fifo_0_M_AXIS_TVALID;
  wire [7:0]axis_data_fifo_1_M_AXIS1_TDATA;
  wire axis_data_fifo_1_M_AXIS1_TREADY;
  wire axis_data_fifo_1_M_AXIS1_TVALID;
  wire [255:0]axis_data_fifo_1_M_AXIS_TDATA;
  wire axis_data_fifo_1_M_AXIS_TREADY;
  wire axis_data_fifo_1_M_AXIS_TVALID;
  wire [255:0]axis_data_fifo_2_M_AXIS_TDATA;
  wire axis_data_fifo_2_M_AXIS_TREADY;
  wire axis_data_fifo_2_M_AXIS_TVALID;
  wire [31:0]axis_data_fifo_gpio_M_AXIS_TDATA;
  wire axis_data_fifo_gpio_M_AXIS_TREADY;
  wire axis_data_fifo_gpio_M_AXIS_TVALID;
  wire [255:0]axis_dwidth_converter_0_M_AXIS_TDATA;
  wire axis_dwidth_converter_0_M_AXIS_TREADY;
  wire axis_dwidth_converter_0_M_AXIS_TVALID;
  wire [255:0]axis_mux_0_m_axis_TDATA;
  wire axis_mux_0_m_axis_TREADY;
  wire axis_mux_0_m_axis_TVALID;
  wire [255:0]axis_tready_slice_0_m_axis_TDATA;
  wire axis_tready_slice_0_m_axis_TREADY;
  wire axis_tready_slice_0_m_axis_TVALID;
  wire [255:0]axis_tready_slice_0_mloop_axis_TDATA;
  wire axis_tready_slice_0_mloop_axis_TREADY;
  wire axis_tready_slice_0_mloop_axis_TVALID;
  wire axis_tready_slice_0_pipeline_active;
  wire ext_trigger_1;
  wire gpio_and_select_buff_0_ext_trigger_out;
  wire [31:0]gpio_and_select_buff_0_m_axis_TDATA;
  wire gpio_and_select_buff_0_m_axis_TREADY;
  wire gpio_and_select_buff_0_m_axis_TVALID;
  wire gpio_and_select_buff_0_select_out;
  wire [15:0]gpio_in_1;
  wire is_selected_1;
  wire microblaze_clk_1;
  wire microblaze_reset_1;
  wire pipeline_active_buff_0_active_out;
  wire [7:0]pipeline_active_buff_0_m_axis_TDATA;
  wire pipeline_active_buff_0_m_axis_TREADY;
  wire pipeline_active_buff_0_m_axis_TVALID;
  wire rf_clock_1;
  wire rf_reset_1;

  assign S_AXIS_0_1_TDATA = S_AXIS_tdata[31:0];
  assign S_AXIS_0_1_TVALID = S_AXIS_tvalid;
  assign S_AXIS_tready = S_AXIS_0_1_TREADY;
  assign axis_tready_slice_0_m_axis_TREADY = m_axis_tready;
  assign ext_trigger_1 = ext_trigger;
  assign gpio_in_1 = gpio_in[15:0];
  assign is_selected_1 = is_selected;
  assign m_axis_tdata[255:0] = axis_tready_slice_0_m_axis_TDATA;
  assign m_axis_tvalid = axis_tready_slice_0_m_axis_TVALID;
  assign microblaze_clk_1 = microblaze_clk;
  assign microblaze_reset_1 = microblaze_resetn;
  assign pipeline_active = pipeline_active_buff_0_active_out;
  assign rf_clock_1 = rf_clock;
  assign rf_reset_1 = rf_resetn;
  rfsoc_data_pipeline_axis_data_fifo_0_5 axis_data_fifo_0
       (.m_axis_tdata(axis_data_fifo_0_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_0_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_0_M_AXIS_TVALID),
        .s_axis_aclk(microblaze_clk_1),
        .s_axis_aresetn(microblaze_reset_1),
        .s_axis_tdata(S_AXIS_0_1_TDATA),
        .s_axis_tready(S_AXIS_0_1_TREADY),
        .s_axis_tvalid(S_AXIS_0_1_TVALID));
  rfsoc_data_pipeline_axis_data_fifo_1_7 axis_data_fifo_1
       (.m_axis_aclk(microblaze_clk_1),
        .m_axis_tdata(axis_data_fifo_1_M_AXIS1_TDATA),
        .m_axis_tready(axis_data_fifo_1_M_AXIS1_TREADY),
        .m_axis_tvalid(axis_data_fifo_1_M_AXIS1_TVALID),
        .s_axis_aclk(rf_clock_1),
        .s_axis_aresetn(rf_reset_1),
        .s_axis_tdata(pipeline_active_buff_0_m_axis_TDATA),
        .s_axis_tready(pipeline_active_buff_0_m_axis_TREADY),
        .s_axis_tvalid(pipeline_active_buff_0_m_axis_TVALID));
  rfsoc_data_pipeline_axis_data_fifo_clock_crossing_4 axis_data_fifo_clock_crossing
       (.m_axis_aclk(rf_clock_1),
        .m_axis_tdata(axis_data_fifo_1_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_1_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_1_M_AXIS_TVALID),
        .s_axis_aclk(microblaze_clk_1),
        .s_axis_aresetn(microblaze_reset_1),
        .s_axis_tdata(axis_dwidth_converter_0_M_AXIS_TDATA),
        .s_axis_tready(axis_dwidth_converter_0_M_AXIS_TREADY),
        .s_axis_tvalid(axis_dwidth_converter_0_M_AXIS_TVALID));
  rfsoc_data_pipeline_axis_data_fifo_gpio_0 axis_data_fifo_gpio
       (.m_axis_aclk(rf_clock_1),
        .m_axis_tdata(axis_data_fifo_gpio_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_gpio_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_gpio_M_AXIS_TVALID),
        .s_axis_aclk(microblaze_clk_1),
        .s_axis_aresetn(microblaze_reset_1),
        .s_axis_tdata(gpio_and_select_buff_0_m_axis_TDATA),
        .s_axis_tready(gpio_and_select_buff_0_m_axis_TREADY),
        .s_axis_tvalid(gpio_and_select_buff_0_m_axis_TVALID));
  rfsoc_data_pipeline_axis_data_fifo_waveform_4 axis_data_fifo_waveform
       (.m_axis_tdata(axis_data_fifo_2_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_2_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_2_M_AXIS_TVALID),
        .s_axis_aclk(rf_clock_1),
        .s_axis_aresetn(rf_reset_1),
        .s_axis_tdata(axis_mux_0_m_axis_TDATA),
        .s_axis_tready(axis_mux_0_m_axis_TREADY),
        .s_axis_tvalid(axis_mux_0_m_axis_TVALID));
  rfsoc_data_pipeline_axis_dwidth_converter_0_5 axis_dwidth_converter_0
       (.aclk(microblaze_clk_1),
        .aresetn(microblaze_reset_1),
        .m_axis_tdata(axis_dwidth_converter_0_M_AXIS_TDATA),
        .m_axis_tready(axis_dwidth_converter_0_M_AXIS_TREADY),
        .m_axis_tvalid(axis_dwidth_converter_0_M_AXIS_TVALID),
        .s_axis_tdata(axis_data_fifo_0_M_AXIS_TDATA),
        .s_axis_tready(axis_data_fifo_0_M_AXIS_TREADY),
        .s_axis_tvalid(axis_data_fifo_0_M_AXIS_TVALID));
  rfsoc_data_pipeline_axis_mux_0_0 axis_mux_0
       (.clk(rf_clock_1),
        .gpio_in(Net),
        .m_axis_tdata(axis_mux_0_m_axis_TDATA),
        .m_axis_tready(axis_mux_0_m_axis_TREADY),
        .m_axis_tvalid(axis_mux_0_m_axis_TVALID),
        .reset(rf_reset_1),
        .s0_axis_tdata(axis_data_fifo_1_M_AXIS_TDATA),
        .s0_axis_tready(axis_data_fifo_1_M_AXIS_TREADY),
        .s0_axis_tvalid(axis_data_fifo_1_M_AXIS_TVALID),
        .s1_axis_tdata(axis_tready_slice_0_mloop_axis_TDATA),
        .s1_axis_tready(axis_tready_slice_0_mloop_axis_TREADY),
        .s1_axis_tvalid(axis_tready_slice_0_mloop_axis_TVALID));
  rfsoc_data_pipeline_axis_tready_slice_0_0 axis_tready_slice_0
       (.clk(rf_clock_1),
        .ext_trigger(gpio_and_select_buff_0_ext_trigger_out),
        .gpio_in(Net),
        .is_selected(gpio_and_select_buff_0_select_out),
        .m_axis_tdata(axis_tready_slice_0_m_axis_TDATA),
        .m_axis_tready(axis_tready_slice_0_m_axis_TREADY),
        .m_axis_tvalid(axis_tready_slice_0_m_axis_TVALID),
        .mloop_axis_tdata(axis_tready_slice_0_mloop_axis_TDATA),
        .mloop_axis_tready(axis_tready_slice_0_mloop_axis_TREADY),
        .mloop_axis_tvalid(axis_tready_slice_0_mloop_axis_TVALID),
        .pipeline_active(axis_tready_slice_0_pipeline_active),
        .reset(rf_reset_1),
        .s_axis_tdata(axis_data_fifo_2_M_AXIS_TDATA),
        .s_axis_tlast(1'b0),
        .s_axis_tready(axis_data_fifo_2_M_AXIS_TREADY),
        .s_axis_tvalid(axis_data_fifo_2_M_AXIS_TVALID));
  rfsoc_data_pipeline_gpio_and_select_buff_0_0 gpio_and_select_buff_0
       (.ext_trigger_in(ext_trigger_1),
        .ext_trigger_out(gpio_and_select_buff_0_ext_trigger_out),
        .gpio_in(gpio_in_1),
        .gpio_out(Net),
        .m_axis_tdata(gpio_and_select_buff_0_m_axis_TDATA),
        .m_axis_tready(gpio_and_select_buff_0_m_axis_TREADY),
        .m_axis_tvalid(gpio_and_select_buff_0_m_axis_TVALID),
        .s_axis_tdata(axis_data_fifo_gpio_M_AXIS_TDATA),
        .s_axis_tready(axis_data_fifo_gpio_M_AXIS_TREADY),
        .s_axis_tvalid(axis_data_fifo_gpio_M_AXIS_TVALID),
        .select_in(is_selected_1),
        .select_out(gpio_and_select_buff_0_select_out));
  rfsoc_data_pipeline_pipeline_active_buff_0_0 pipeline_active_buff_0
       (.active_in(axis_tready_slice_0_pipeline_active),
        .active_out(pipeline_active_buff_0_active_out),
        .m_axis_tdata(pipeline_active_buff_0_m_axis_TDATA),
        .m_axis_tready(pipeline_active_buff_0_m_axis_TREADY),
        .m_axis_tvalid(pipeline_active_buff_0_m_axis_TVALID),
        .s_axis_tdata(axis_data_fifo_1_M_AXIS1_TDATA),
        .s_axis_tready(axis_data_fifo_1_M_AXIS1_TREADY),
        .s_axis_tvalid(axis_data_fifo_1_M_AXIS1_TVALID));
endmodule
