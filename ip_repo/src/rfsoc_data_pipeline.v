//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Tue Jul  2 15:01:17 2019
//Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
//Command     : generate_target rfsoc_data_pipeline.bd
//Design      : rfsoc_data_pipeline
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "rfsoc_data_pipeline,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=rfsoc_data_pipeline,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=11,numReposBlks=11,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "rfsoc_data_pipeline.hwdef" *) 
module rfsoc_data_pipeline
   (S_AXIS_0_tdata,
    S_AXIS_0_tready,
    S_AXIS_0_tvalid,
    count_val_in_0,
    ext_trigger_0,
    gpio_in,
    m_axis_0_tdata,
    m_axis_0_tready,
    m_axis_0_tvalid,
    microblaze_clk,
    microblaze_resetn,
    rf_clock,
    rf_resetn);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_0, CLK_DOMAIN rfsoc_data_pipeline_microblaze_clk, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [31:0]S_AXIS_0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0 TREADY" *) output S_AXIS_0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0 TVALID" *) input S_AXIS_0_tvalid;
  input [31:0]count_val_in_0;
  input ext_trigger_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.GPIO_IN DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.GPIO_IN, LAYERED_METADATA undef" *) input [7:0]gpio_in;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_0, CLK_DOMAIN rfsoc_data_pipeline_rf_clock, FREQ_HZ 250000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [255:0]m_axis_0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TREADY" *) input m_axis_0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TVALID" *) output m_axis_0_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.MICROBLAZE_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.MICROBLAZE_CLK, ASSOCIATED_BUSIF S_AXIS_0, ASSOCIATED_RESET microblaze_resetn, CLK_DOMAIN rfsoc_data_pipeline_microblaze_clk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input microblaze_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.MICROBLAZE_RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.MICROBLAZE_RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input microblaze_resetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.RF_CLOCK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.RF_CLOCK, ASSOCIATED_BUSIF m_axis_0, ASSOCIATED_RESET rf_resetn, CLK_DOMAIN rfsoc_data_pipeline_rf_clock, FREQ_HZ 250000000, INSERT_VIP 0, PHASE 0.000" *) input rf_clock;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RF_RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RF_RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rf_resetn;

  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [7:0]Net;
  (* CONN_BUS_INFO = "S_AXIS_0_1 xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]S_AXIS_0_1_TDATA;
  (* CONN_BUS_INFO = "S_AXIS_0_1 xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire S_AXIS_0_1_TREADY;
  (* CONN_BUS_INFO = "S_AXIS_0_1 xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire S_AXIS_0_1_TVALID;
  (* CONN_BUS_INFO = "axis_data_fifo_0_M_AXIS xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]axis_data_fifo_0_M_AXIS_TDATA;
  (* CONN_BUS_INFO = "axis_data_fifo_0_M_AXIS xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_data_fifo_0_M_AXIS_TREADY;
  (* CONN_BUS_INFO = "axis_data_fifo_0_M_AXIS xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_data_fifo_0_M_AXIS_TVALID;
  wire [7:0]axis_data_fifo_1_M_AXIS1_TDATA;
  wire axis_data_fifo_1_M_AXIS1_TREADY;
  wire axis_data_fifo_1_M_AXIS1_TVALID;
  (* CONN_BUS_INFO = "axis_data_fifo_1_M_AXIS xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [255:0]axis_data_fifo_1_M_AXIS_TDATA;
  (* CONN_BUS_INFO = "axis_data_fifo_1_M_AXIS xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_data_fifo_1_M_AXIS_TREADY;
  (* CONN_BUS_INFO = "axis_data_fifo_1_M_AXIS xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_data_fifo_1_M_AXIS_TVALID;
  (* CONN_BUS_INFO = "axis_data_fifo_2_M_AXIS xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [255:0]axis_data_fifo_2_M_AXIS_TDATA;
  (* CONN_BUS_INFO = "axis_data_fifo_2_M_AXIS xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_data_fifo_2_M_AXIS_TREADY;
  (* CONN_BUS_INFO = "axis_data_fifo_2_M_AXIS xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_data_fifo_2_M_AXIS_TVALID;
  (* CONN_BUS_INFO = "axis_dwidth_converter_0_M_AXIS xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [255:0]axis_dwidth_converter_0_M_AXIS_TDATA;
  (* CONN_BUS_INFO = "axis_dwidth_converter_0_M_AXIS xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_dwidth_converter_0_M_AXIS_TREADY;
  (* CONN_BUS_INFO = "axis_dwidth_converter_0_M_AXIS xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_dwidth_converter_0_M_AXIS_TVALID;
  (* CONN_BUS_INFO = "axis_mux_0_m_axis xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [255:0]axis_mux_0_m_axis_TDATA;
  (* CONN_BUS_INFO = "axis_mux_0_m_axis xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_mux_0_m_axis_TREADY;
  (* CONN_BUS_INFO = "axis_mux_0_m_axis xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_mux_0_m_axis_TVALID;
  (* CONN_BUS_INFO = "axis_tready_slice_0_m_axis xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [255:0]axis_tready_slice_0_m_axis_TDATA;
  (* CONN_BUS_INFO = "axis_tready_slice_0_m_axis xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_tready_slice_0_m_axis_TREADY;
  (* CONN_BUS_INFO = "axis_tready_slice_0_m_axis xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_tready_slice_0_m_axis_TVALID;
  wire [255:0]axis_tready_slice_0_mloop_axis_TDATA;
  wire axis_tready_slice_0_mloop_axis_TREADY;
  wire axis_tready_slice_0_mloop_axis_TVALID;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]count_out;
  wire [31:0]count_val_in_0_1;
  wire ext_trigger_0_1;
  wire [7:0]gpio_buffer_0_m_axis_TDATA;
  wire gpio_buffer_0_m_axis_TREADY;
  wire gpio_buffer_0_m_axis_TVALID;
  wire [7:0]gpio_in_1;
  wire microblaze_clk_1;
  wire microblaze_reset_1;
  wire rf_clock_1;
  wire rf_reset_1;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]state_out;

  assign S_AXIS_0_1_TDATA = S_AXIS_0_tdata[31:0];
  assign S_AXIS_0_1_TVALID = S_AXIS_0_tvalid;
  assign S_AXIS_0_tready = S_AXIS_0_1_TREADY;
  assign axis_tready_slice_0_m_axis_TREADY = m_axis_0_tready;
  assign count_val_in_0_1 = count_val_in_0[31:0];
  assign ext_trigger_0_1 = ext_trigger_0;
  assign gpio_in_1 = gpio_in[7:0];
  assign m_axis_0_tdata[255:0] = axis_tready_slice_0_m_axis_TDATA;
  assign m_axis_0_tvalid = axis_tready_slice_0_m_axis_TVALID;
  assign microblaze_clk_1 = microblaze_clk;
  assign microblaze_reset_1 = microblaze_resetn;
  assign rf_clock_1 = rf_clock;
  assign rf_reset_1 = rf_resetn;
  rfsoc_data_pipeline_axis_data_fifo_0_2 axis_data_fifo_0
       (.m_axis_tdata(axis_data_fifo_0_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_0_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_0_M_AXIS_TVALID),
        .s_axis_aclk(microblaze_clk_1),
        .s_axis_aresetn(microblaze_reset_1),
        .s_axis_tdata(S_AXIS_0_1_TDATA),
        .s_axis_tready(S_AXIS_0_1_TREADY),
        .s_axis_tvalid(S_AXIS_0_1_TVALID));
  rfsoc_data_pipeline_axis_data_fifo_1_3 axis_data_fifo_1
       (.m_axis_aclk(rf_clock_1),
        .m_axis_tdata(axis_data_fifo_1_M_AXIS1_TDATA),
        .m_axis_tready(axis_data_fifo_1_M_AXIS1_TREADY),
        .m_axis_tvalid(axis_data_fifo_1_M_AXIS1_TVALID),
        .s_axis_aclk(microblaze_clk_1),
        .s_axis_aresetn(microblaze_reset_1),
        .s_axis_tdata(gpio_buffer_0_m_axis_TDATA),
        .s_axis_tready(gpio_buffer_0_m_axis_TREADY),
        .s_axis_tvalid(gpio_buffer_0_m_axis_TVALID));
  rfsoc_data_pipeline_axis_data_fifo_clock_crossing_1 axis_data_fifo_clock_crossing
       (.m_axis_aclk(rf_clock_1),
        .m_axis_tdata(axis_data_fifo_1_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_1_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_1_M_AXIS_TVALID),
        .s_axis_aclk(microblaze_clk_1),
        .s_axis_aresetn(microblaze_reset_1),
        .s_axis_tdata(axis_dwidth_converter_0_M_AXIS_TDATA),
        .s_axis_tready(axis_dwidth_converter_0_M_AXIS_TREADY),
        .s_axis_tvalid(axis_dwidth_converter_0_M_AXIS_TVALID));
  rfsoc_data_pipeline_axis_data_fifo_waveform_1 axis_data_fifo_waveform
       (.m_axis_tdata(axis_data_fifo_2_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_2_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_2_M_AXIS_TVALID),
        .s_axis_aclk(rf_clock_1),
        .s_axis_aresetn(rf_reset_1),
        .s_axis_tdata(axis_mux_0_m_axis_TDATA),
        .s_axis_tready(axis_mux_0_m_axis_TREADY),
        .s_axis_tvalid(axis_mux_0_m_axis_TVALID));
  rfsoc_data_pipeline_axis_dwidth_converter_0_2 axis_dwidth_converter_0
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
        .count_out(count_out),
        .count_val_in(count_val_in_0_1),
        .ext_trigger(ext_trigger_0_1),
        .gpio_in(Net),
        .m_axis_tdata(axis_tready_slice_0_m_axis_TDATA),
        .m_axis_tready(axis_tready_slice_0_m_axis_TREADY),
        .m_axis_tvalid(axis_tready_slice_0_m_axis_TVALID),
        .mloop_axis_tdata(axis_tready_slice_0_mloop_axis_TDATA),
        .mloop_axis_tready(axis_tready_slice_0_mloop_axis_TREADY),
        .mloop_axis_tvalid(axis_tready_slice_0_mloop_axis_TVALID),
        .reset(rf_reset_1),
        .s_axis_tdata(axis_data_fifo_2_M_AXIS_TDATA),
        .s_axis_tlast(1'b0),
        .s_axis_tready(axis_data_fifo_2_M_AXIS_TREADY),
        .s_axis_tvalid(axis_data_fifo_2_M_AXIS_TVALID),
        .state_out(state_out));
  rfsoc_data_pipeline_gpio_buffer_0_0 gpio_buffer_0
       (.gpio_in(gpio_in_1),
        .gpio_out(Net),
        .m_axis_tdata(gpio_buffer_0_m_axis_TDATA),
        .m_axis_tready(gpio_buffer_0_m_axis_TREADY),
        .m_axis_tvalid(gpio_buffer_0_m_axis_TVALID),
        .s_axis_tdata(axis_data_fifo_1_M_AXIS1_TDATA),
        .s_axis_tready(axis_data_fifo_1_M_AXIS1_TREADY),
        .s_axis_tvalid(axis_data_fifo_1_M_AXIS1_TVALID));
  rfsoc_data_pipeline_system_ila_0_0 system_ila_fast
       (.SLOT_0_AXIS_tdata(axis_data_fifo_2_M_AXIS_TDATA),
        .SLOT_0_AXIS_tlast(1'b0),
        .SLOT_0_AXIS_tready(axis_data_fifo_2_M_AXIS_TREADY),
        .SLOT_0_AXIS_tvalid(axis_data_fifo_2_M_AXIS_TVALID),
        .SLOT_1_AXIS_tdata(axis_data_fifo_1_M_AXIS_TDATA),
        .SLOT_1_AXIS_tlast(1'b0),
        .SLOT_1_AXIS_tready(axis_data_fifo_1_M_AXIS_TREADY),
        .SLOT_1_AXIS_tvalid(axis_data_fifo_1_M_AXIS_TVALID),
        .SLOT_2_AXIS_tdata(axis_mux_0_m_axis_TDATA),
        .SLOT_2_AXIS_tlast(1'b0),
        .SLOT_2_AXIS_tready(axis_mux_0_m_axis_TREADY),
        .SLOT_2_AXIS_tvalid(axis_mux_0_m_axis_TVALID),
        .SLOT_3_AXIS_tdata(axis_tready_slice_0_m_axis_TDATA),
        .SLOT_3_AXIS_tlast(1'b0),
        .SLOT_3_AXIS_tready(axis_tready_slice_0_m_axis_TREADY),
        .SLOT_3_AXIS_tvalid(axis_tready_slice_0_m_axis_TVALID),
        .clk(rf_clock_1),
        .probe0(count_val_in_0_1),
        .probe1(state_out),
        .probe2(count_out),
        .resetn(rf_reset_1));
  rfsoc_data_pipeline_system_ila_2_0 system_ila_gpio
       (.clk(rf_clock_1),
        .probe0(Net));
  rfsoc_data_pipeline_system_ila_1_0 system_ila_slow
       (.SLOT_0_AXIS_tdata(axis_dwidth_converter_0_M_AXIS_TDATA),
        .SLOT_0_AXIS_tlast(1'b0),
        .SLOT_0_AXIS_tready(axis_dwidth_converter_0_M_AXIS_TREADY),
        .SLOT_0_AXIS_tvalid(axis_dwidth_converter_0_M_AXIS_TVALID),
        .SLOT_1_AXIS_tdata(axis_data_fifo_0_M_AXIS_TDATA),
        .SLOT_1_AXIS_tlast(1'b0),
        .SLOT_1_AXIS_tready(axis_data_fifo_0_M_AXIS_TREADY),
        .SLOT_1_AXIS_tvalid(axis_data_fifo_0_M_AXIS_TVALID),
        .SLOT_2_AXIS_tdata(S_AXIS_0_1_TDATA),
        .SLOT_2_AXIS_tlast(1'b0),
        .SLOT_2_AXIS_tready(S_AXIS_0_1_TREADY),
        .SLOT_2_AXIS_tvalid(S_AXIS_0_1_TVALID),
        .clk(microblaze_clk_1),
        .resetn(microblaze_reset_1));
endmodule
