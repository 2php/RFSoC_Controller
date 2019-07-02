//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Mon Jul  1 08:49:28 2019
//Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
//Command     : generate_target rf_data_pipeline.bd
//Design      : rf_data_pipeline
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "rf_data_pipeline,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=rf_data_pipeline,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=11,numReposBlks=11,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "rf_data_pipeline.hwdef" *) 
module rf_data_pipeline
   (S_AXIS_0_tdata,
    S_AXIS_0_tready,
    S_AXIS_0_tvalid,
    ext_trigger_0,
    gpio_in_0,
    m_axis_0_tdata,
    m_axis_0_tready,
    m_axis_0_tvalid,
    microblaze_clk,
    microblaze_resetn,
    rf_clk,
    rf_resetn);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_0, CLK_DOMAIN rf_data_pipeline_microblaze_clk, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [31:0]S_AXIS_0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0 TREADY" *) output S_AXIS_0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0 TVALID" *) input S_AXIS_0_tvalid;
  input ext_trigger_0;
  input [7:0]gpio_in_0;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_0, CLK_DOMAIN rf_data_pipeline_rf_clk, FREQ_HZ 250000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [255:0]m_axis_0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TREADY" *) input m_axis_0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TVALID" *) output m_axis_0_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.MICROBLAZE_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.MICROBLAZE_CLK, ASSOCIATED_BUSIF S_AXIS_0, ASSOCIATED_RESET microblaze_resetn, CLK_DOMAIN rf_data_pipeline_microblaze_clk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input microblaze_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.MICROBLAZE_RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.MICROBLAZE_RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input microblaze_resetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.RF_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.RF_CLK, ASSOCIATED_BUSIF m_axis_0, ASSOCIATED_RESET rf_resetn, CLK_DOMAIN rf_data_pipeline_rf_clk, FREQ_HZ 250000000, INSERT_VIP 0, PHASE 0.000" *) input rf_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RF_RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RF_RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rf_resetn;

  wire Net;
  wire Net1;
  wire Net3;
  wire Net4;
  wire [31:0]S_AXIS_0_1_TDATA;
  wire S_AXIS_0_1_TREADY;
  wire S_AXIS_0_1_TVALID;
  (* CONN_BUS_INFO = "axis_data_fifo_0_M_AXIS xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]axis_data_fifo_0_M_AXIS_TDATA;
  (* CONN_BUS_INFO = "axis_data_fifo_0_M_AXIS xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_data_fifo_0_M_AXIS_TREADY;
  (* CONN_BUS_INFO = "axis_data_fifo_0_M_AXIS xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_data_fifo_0_M_AXIS_TVALID;
  (* CONN_BUS_INFO = "axis_data_fifo_1_M_AXIS xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [255:0]axis_data_fifo_1_M_AXIS_TDATA;
  (* CONN_BUS_INFO = "axis_data_fifo_1_M_AXIS xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_data_fifo_1_M_AXIS_TREADY;
  (* CONN_BUS_INFO = "axis_data_fifo_1_M_AXIS xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_data_fifo_1_M_AXIS_TVALID;
  (* CONN_BUS_INFO = "axis_data_fifo_2_M_AXIS xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [255:0]axis_data_fifo_2_M_AXIS_TDATA;
  (* CONN_BUS_INFO = "axis_data_fifo_2_M_AXIS xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_data_fifo_2_M_AXIS_TREADY;
  (* CONN_BUS_INFO = "axis_data_fifo_2_M_AXIS xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_data_fifo_2_M_AXIS_TVALID;
  wire [7:0]axis_data_fifo_3_M_AXIS_TDATA;
  wire axis_data_fifo_3_M_AXIS_TREADY;
  wire axis_data_fifo_3_M_AXIS_TVALID;
  (* CONN_BUS_INFO = "axis_dwidth_converter_0_M_AXIS xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [255:0]axis_dwidth_converter_0_M_AXIS_TDATA;
  (* CONN_BUS_INFO = "axis_dwidth_converter_0_M_AXIS xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_dwidth_converter_0_M_AXIS_TREADY;
  (* CONN_BUS_INFO = "axis_dwidth_converter_0_M_AXIS xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_dwidth_converter_0_M_AXIS_TVALID;
  (* CONN_BUS_INFO = "axis_mux_0_m_axis xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [255:0]axis_mux_0_m_axis_TDATA;
  (* CONN_BUS_INFO = "axis_mux_0_m_axis xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_mux_0_m_axis_TREADY;
  (* CONN_BUS_INFO = "axis_mux_0_m_axis xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_mux_0_m_axis_TVALID;
  (* CONN_BUS_INFO = "axis_tready_slice_0_m_axis xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [255:0]axis_tready_slice_0_m_axis_TDATA;
  (* CONN_BUS_INFO = "axis_tready_slice_0_m_axis xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_tready_slice_0_m_axis_TREADY;
  (* CONN_BUS_INFO = "axis_tready_slice_0_m_axis xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_tready_slice_0_m_axis_TVALID;
  (* CONN_BUS_INFO = "axis_tready_slice_0_mloop_axis xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [255:0]axis_tready_slice_0_mloop_axis_TDATA;
  (* CONN_BUS_INFO = "axis_tready_slice_0_mloop_axis xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_tready_slice_0_mloop_axis_TREADY;
  (* CONN_BUS_INFO = "axis_tready_slice_0_mloop_axis xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_tready_slice_0_mloop_axis_TVALID;
  wire ext_trigger_0_1;
  wire [7:0]gpio_buffer_0_m_axis_TDATA;
  wire gpio_buffer_0_m_axis_TREADY;
  wire gpio_buffer_0_m_axis_TVALID;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [7:0]gpio_in_0_1;
  wire [7:0]gpio_in_0_2;

  assign Net = rf_clk;
  assign Net1 = rf_resetn;
  assign Net3 = microblaze_resetn;
  assign Net4 = microblaze_clk;
  assign S_AXIS_0_1_TDATA = S_AXIS_0_tdata[31:0];
  assign S_AXIS_0_1_TVALID = S_AXIS_0_tvalid;
  assign S_AXIS_0_tready = S_AXIS_0_1_TREADY;
  assign axis_tready_slice_0_m_axis_TREADY = m_axis_0_tready;
  assign ext_trigger_0_1 = ext_trigger_0;
  assign gpio_in_0_2 = gpio_in_0[7:0];
  assign m_axis_0_tdata[255:0] = axis_tready_slice_0_m_axis_TDATA;
  assign m_axis_0_tvalid = axis_tready_slice_0_m_axis_TVALID;
  rf_data_pipeline_axis_data_fifo_0_1 axis_data_fifo_0
       (.m_axis_tdata(axis_data_fifo_0_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_0_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_0_M_AXIS_TVALID),
        .s_axis_aclk(Net4),
        .s_axis_aresetn(Net3),
        .s_axis_tdata(S_AXIS_0_1_TDATA),
        .s_axis_tready(S_AXIS_0_1_TREADY),
        .s_axis_tvalid(S_AXIS_0_1_TVALID));
  rf_data_pipeline_axis_data_fifo_1_1 axis_data_fifo_1
       (.m_axis_aclk(Net),
        .m_axis_tdata(axis_data_fifo_1_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_1_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_1_M_AXIS_TVALID),
        .s_axis_aclk(Net4),
        .s_axis_aresetn(Net3),
        .s_axis_tdata(axis_dwidth_converter_0_M_AXIS_TDATA),
        .s_axis_tready(axis_dwidth_converter_0_M_AXIS_TREADY),
        .s_axis_tvalid(axis_dwidth_converter_0_M_AXIS_TVALID));
  rf_data_pipeline_axis_data_fifo_2_1 axis_data_fifo_2
       (.m_axis_tdata(axis_data_fifo_2_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_2_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_2_M_AXIS_TVALID),
        .s_axis_aclk(Net),
        .s_axis_aresetn(Net1),
        .s_axis_tdata(axis_mux_0_m_axis_TDATA),
        .s_axis_tready(axis_mux_0_m_axis_TREADY),
        .s_axis_tvalid(axis_mux_0_m_axis_TVALID));
  rf_data_pipeline_axis_data_fifo_3_1 axis_data_fifo_3
       (.m_axis_aclk(Net),
        .m_axis_tdata(axis_data_fifo_3_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_3_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_3_M_AXIS_TVALID),
        .s_axis_aclk(Net4),
        .s_axis_aresetn(Net3),
        .s_axis_tdata(gpio_buffer_0_m_axis_TDATA),
        .s_axis_tready(gpio_buffer_0_m_axis_TREADY),
        .s_axis_tvalid(gpio_buffer_0_m_axis_TVALID));
  rf_data_pipeline_axis_dwidth_converter_0_1 axis_dwidth_converter_0
       (.aclk(Net4),
        .aresetn(Net3),
        .m_axis_tdata(axis_dwidth_converter_0_M_AXIS_TDATA),
        .m_axis_tready(axis_dwidth_converter_0_M_AXIS_TREADY),
        .m_axis_tvalid(axis_dwidth_converter_0_M_AXIS_TVALID),
        .s_axis_tdata(axis_data_fifo_0_M_AXIS_TDATA),
        .s_axis_tready(axis_data_fifo_0_M_AXIS_TREADY),
        .s_axis_tvalid(axis_data_fifo_0_M_AXIS_TVALID));
  rf_data_pipeline_axis_mux_0_0 axis_mux_0
       (.clk(Net),
        .gpio_in(gpio_in_0_1),
        .m_axis_tdata(axis_mux_0_m_axis_TDATA),
        .m_axis_tready(axis_mux_0_m_axis_TREADY),
        .m_axis_tvalid(axis_mux_0_m_axis_TVALID),
        .reset(Net1),
        .s0_axis_tdata(axis_data_fifo_1_M_AXIS_TDATA),
        .s0_axis_tready(axis_data_fifo_1_M_AXIS_TREADY),
        .s0_axis_tvalid(axis_data_fifo_1_M_AXIS_TVALID),
        .s1_axis_tdata(axis_tready_slice_0_mloop_axis_TDATA),
        .s1_axis_tready(axis_tready_slice_0_mloop_axis_TREADY),
        .s1_axis_tvalid(axis_tready_slice_0_mloop_axis_TVALID));
  rf_data_pipeline_axis_tready_slice_0_0 axis_tready_slice_0
       (.clk(Net),
        .ext_trigger(ext_trigger_0_1),
        .gpio_in(gpio_in_0_1),
        .m_axis_tdata(axis_tready_slice_0_m_axis_TDATA),
        .m_axis_tready(axis_tready_slice_0_m_axis_TREADY),
        .m_axis_tvalid(axis_tready_slice_0_m_axis_TVALID),
        .mloop_axis_tdata(axis_tready_slice_0_mloop_axis_TDATA),
        .mloop_axis_tready(axis_tready_slice_0_mloop_axis_TREADY),
        .mloop_axis_tvalid(axis_tready_slice_0_mloop_axis_TVALID),
        .reset(Net1),
        .s_axis_tdata(axis_data_fifo_2_M_AXIS_TDATA),
        .s_axis_tlast(1'b0),
        .s_axis_tready(axis_data_fifo_2_M_AXIS_TREADY),
        .s_axis_tvalid(axis_data_fifo_2_M_AXIS_TVALID));
  rf_data_pipeline_gpio_buffer_0_0 gpio_buffer_0
       (.gpio_in(gpio_in_0_2),
        .gpio_out(gpio_in_0_1),
        .m_axis_tdata(gpio_buffer_0_m_axis_TDATA),
        .m_axis_tready(gpio_buffer_0_m_axis_TREADY),
        .m_axis_tvalid(gpio_buffer_0_m_axis_TVALID),
        .s_axis_tdata(axis_data_fifo_3_M_AXIS_TDATA),
        .s_axis_tready(axis_data_fifo_3_M_AXIS_TREADY),
        .s_axis_tvalid(axis_data_fifo_3_M_AXIS_TVALID));
  rf_data_pipeline_system_ila_0_0 rf_pipeline_fast_ila
       (.SLOT_0_AXIS_tdata(axis_data_fifo_2_M_AXIS_TDATA),
        .SLOT_0_AXIS_tlast(1'b0),
        .SLOT_0_AXIS_tready(axis_data_fifo_2_M_AXIS_TREADY),
        .SLOT_0_AXIS_tvalid(axis_data_fifo_2_M_AXIS_TVALID),
        .SLOT_1_AXIS_tdata(axis_mux_0_m_axis_TDATA),
        .SLOT_1_AXIS_tlast(1'b0),
        .SLOT_1_AXIS_tready(axis_mux_0_m_axis_TREADY),
        .SLOT_1_AXIS_tvalid(axis_mux_0_m_axis_TVALID),
        .SLOT_2_AXIS_tdata(axis_tready_slice_0_mloop_axis_TDATA),
        .SLOT_2_AXIS_tlast(1'b0),
        .SLOT_2_AXIS_tready(axis_tready_slice_0_mloop_axis_TREADY),
        .SLOT_2_AXIS_tvalid(axis_tready_slice_0_mloop_axis_TVALID),
        .SLOT_3_AXIS_tdata(axis_data_fifo_1_M_AXIS_TDATA),
        .SLOT_3_AXIS_tlast(1'b0),
        .SLOT_3_AXIS_tready(axis_data_fifo_1_M_AXIS_TREADY),
        .SLOT_3_AXIS_tvalid(axis_data_fifo_1_M_AXIS_TVALID),
        .SLOT_4_AXIS_tdata(axis_tready_slice_0_m_axis_TDATA),
        .SLOT_4_AXIS_tlast(1'b0),
        .SLOT_4_AXIS_tready(axis_tready_slice_0_m_axis_TREADY),
        .SLOT_4_AXIS_tvalid(axis_tready_slice_0_m_axis_TVALID),
        .clk(Net),
        .resetn(Net1));
  rf_data_pipeline_system_ila_1_0 rf_pipeline_slow_ila
       (.SLOT_0_AXIS_tdata(axis_dwidth_converter_0_M_AXIS_TDATA),
        .SLOT_0_AXIS_tlast(1'b0),
        .SLOT_0_AXIS_tready(axis_dwidth_converter_0_M_AXIS_TREADY),
        .SLOT_0_AXIS_tvalid(axis_dwidth_converter_0_M_AXIS_TVALID),
        .SLOT_1_AXIS_tdata(axis_data_fifo_0_M_AXIS_TDATA),
        .SLOT_1_AXIS_tlast(1'b0),
        .SLOT_1_AXIS_tready(axis_data_fifo_0_M_AXIS_TREADY),
        .SLOT_1_AXIS_tvalid(axis_data_fifo_0_M_AXIS_TVALID),
        .clk(Net4),
        .resetn(Net3));
  rf_data_pipeline_system_ila_2_0 system_ila_2
       (.clk(Net4),
        .probe0(gpio_in_0_1));
endmodule
