//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Mon Jul 22 15:30:57 2019
//Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
//Command     : generate_target rfsoc_adc_data_capture.bd
//Design      : rfsoc_adc_data_capture
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "rfsoc_adc_data_capture,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=rfsoc_adc_data_capture,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=9,numReposBlks=9,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "rfsoc_adc_data_capture.hwdef" *) 
module rfsoc_adc_data_capture
   (M_AXIS_0_tdata,
    M_AXIS_0_tready,
    M_AXIS_0_tvalid,
    M_AXIS_1_tdata,
    M_AXIS_1_tready,
    M_AXIS_1_tvalid,
    M_AXIS_2_tdata,
    M_AXIS_2_tready,
    M_AXIS_2_tvalid,
    M_AXIS_3_tdata,
    M_AXIS_3_tready,
    M_AXIS_3_tvalid,
    ext_trigger,
    gpio_in,
    microblaze_clk,
    microblaze_reset,
    rf_clk,
    rf_reset,
    s_axis_tdata,
    s_axis_tready,
    s_axis_tvalid);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_0, CLK_DOMAIN rfsoc_adc_data_capture_m_axis_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [31:0]M_AXIS_0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0 TREADY" *) input M_AXIS_0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0 TVALID" *) output M_AXIS_0_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_1 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_1, CLK_DOMAIN rfsoc_adc_data_capture_m_axis_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [31:0]M_AXIS_1_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_1 TREADY" *) input M_AXIS_1_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_1 TVALID" *) output M_AXIS_1_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_2 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_2, CLK_DOMAIN rfsoc_adc_data_capture_m_axis_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [31:0]M_AXIS_2_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_2 TREADY" *) input M_AXIS_2_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_2 TVALID" *) output M_AXIS_2_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_3 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_3, CLK_DOMAIN rfsoc_adc_data_capture_m_axis_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [31:0]M_AXIS_3_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_3 TREADY" *) input M_AXIS_3_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_3 TVALID" *) output M_AXIS_3_tvalid;
  input ext_trigger;
  input [15:0]gpio_in;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.MICROBLAZE_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.MICROBLAZE_CLK, ASSOCIATED_BUSIF M_AXIS_0:M_AXIS_1:M_AXIS_2:M_AXIS_3, ASSOCIATED_RESET microblaze_reset, CLK_DOMAIN rfsoc_adc_data_capture_m_axis_aclk_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input microblaze_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.MICROBLAZE_RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.MICROBLAZE_RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input microblaze_reset;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.RF_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.RF_CLK, ASSOCIATED_BUSIF s_axis, ASSOCIATED_RESET rf_reset, CLK_DOMAIN rfsoc_adc_data_capture_rf_clk_0, FREQ_HZ 250000000, INSERT_VIP 0, PHASE 0.000" *) input rf_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RF_RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RF_RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rf_reset;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis " *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis, CLK_DOMAIN rfsoc_adc_data_capture_rf_clk_0, FREQ_HZ 250000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [127:0]s_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis " *) output s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis " *) input s_axis_tvalid;

  wire Net;
  wire [31:0]adc_controller_0_count_val_out;
  (* CONN_BUS_INFO = "adc_controller_0_m_axis_0 xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]adc_controller_0_m_axis_0_TDATA;
  (* CONN_BUS_INFO = "adc_controller_0_m_axis_0 xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire adc_controller_0_m_axis_0_TREADY;
  (* CONN_BUS_INFO = "adc_controller_0_m_axis_0 xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire adc_controller_0_m_axis_0_TVALID;
  wire [31:0]adc_controller_0_m_axis_1_TDATA;
  wire adc_controller_0_m_axis_1_TREADY;
  wire adc_controller_0_m_axis_1_TVALID;
  wire [31:0]adc_controller_0_m_axis_2_TDATA;
  wire adc_controller_0_m_axis_2_TREADY;
  wire adc_controller_0_m_axis_2_TVALID;
  wire [31:0]adc_controller_0_m_axis_3_TDATA;
  wire adc_controller_0_m_axis_3_TREADY;
  wire adc_controller_0_m_axis_3_TVALID;
  (* CONN_BUS_INFO = "axis_data_fifo_0_M_AXIS xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]axis_data_fifo_0_M_AXIS_TDATA;
  (* CONN_BUS_INFO = "axis_data_fifo_0_M_AXIS xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_data_fifo_0_M_AXIS_TREADY;
  (* CONN_BUS_INFO = "axis_data_fifo_0_M_AXIS xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_data_fifo_0_M_AXIS_TVALID;
  wire [31:0]axis_data_fifo_0_axis_rd_data_count;
  wire [31:0]axis_data_fifo_0_axis_wr_data_count;
  wire [31:0]axis_data_fifo_1_M_AXIS_TDATA;
  wire axis_data_fifo_1_M_AXIS_TREADY;
  wire axis_data_fifo_1_M_AXIS_TVALID;
  wire [31:0]axis_data_fifo_2_M_AXIS_TDATA;
  wire axis_data_fifo_2_M_AXIS_TREADY;
  wire axis_data_fifo_2_M_AXIS_TVALID;
  wire [31:0]axis_data_fifo_3_M_AXIS_TDATA;
  wire axis_data_fifo_3_M_AXIS_TREADY;
  wire axis_data_fifo_3_M_AXIS_TVALID;
  wire [15:0]axis_data_fifo_4_M_AXIS_TDATA;
  wire axis_data_fifo_4_M_AXIS_TREADY;
  wire axis_data_fifo_4_M_AXIS_TVALID;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]count_out;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire ext_trigger_0_1;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [15:0]gpio_buffer_0_gpio_out;
  wire [15:0]gpio_buffer_0_m_axis_TDATA;
  wire gpio_buffer_0_m_axis_TREADY;
  wire gpio_buffer_0_m_axis_TVALID;
  wire [15:0]gpio_in_0_1;
  wire rf_clk_0_1;
  wire rf_reset_0_1;
  (* CONN_BUS_INFO = "s_axis_0_1 xilinx.com:interface:axis:1.0 None None" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [127:0]s_axis_0_1_TDATA;
  (* CONN_BUS_INFO = "s_axis_0_1 xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire s_axis_0_1_TREADY;
  (* CONN_BUS_INFO = "s_axis_0_1 xilinx.com:interface:axis:1.0 None None" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire s_axis_0_1_TVALID;
  wire s_axis_aresetn_0_1;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]state_out;

  assign M_AXIS_0_tdata[31:0] = axis_data_fifo_0_M_AXIS_TDATA;
  assign M_AXIS_0_tvalid = axis_data_fifo_0_M_AXIS_TVALID;
  assign M_AXIS_1_tdata[31:0] = axis_data_fifo_1_M_AXIS_TDATA;
  assign M_AXIS_1_tvalid = axis_data_fifo_1_M_AXIS_TVALID;
  assign M_AXIS_2_tdata[31:0] = axis_data_fifo_2_M_AXIS_TDATA;
  assign M_AXIS_2_tvalid = axis_data_fifo_2_M_AXIS_TVALID;
  assign M_AXIS_3_tdata[31:0] = axis_data_fifo_3_M_AXIS_TDATA;
  assign M_AXIS_3_tvalid = axis_data_fifo_3_M_AXIS_TVALID;
  assign Net = microblaze_clk;
  assign axis_data_fifo_0_M_AXIS_TREADY = M_AXIS_0_tready;
  assign axis_data_fifo_1_M_AXIS_TREADY = M_AXIS_1_tready;
  assign axis_data_fifo_2_M_AXIS_TREADY = M_AXIS_2_tready;
  assign axis_data_fifo_3_M_AXIS_TREADY = M_AXIS_3_tready;
  assign ext_trigger_0_1 = ext_trigger;
  assign gpio_in_0_1 = gpio_in[15:0];
  assign rf_clk_0_1 = rf_clk;
  assign rf_reset_0_1 = rf_reset;
  assign s_axis_0_1_TDATA = s_axis_tdata[127:0];
  assign s_axis_0_1_TVALID = s_axis_tvalid;
  assign s_axis_aresetn_0_1 = microblaze_reset;
  assign s_axis_tready = s_axis_0_1_TREADY;
  rfsoc_adc_data_capture_adc_controller_0_0 adc_controller_0
       (.count_out(count_out),
        .count_val_out(adc_controller_0_count_val_out),
        .ext_trigger(ext_trigger_0_1),
        .gpio_in(gpio_buffer_0_gpio_out),
        .m_axis_tdata_0(adc_controller_0_m_axis_0_TDATA),
        .m_axis_tdata_1(adc_controller_0_m_axis_1_TDATA),
        .m_axis_tdata_2(adc_controller_0_m_axis_2_TDATA),
        .m_axis_tdata_3(adc_controller_0_m_axis_3_TDATA),
        .m_axis_tready_0(adc_controller_0_m_axis_0_TREADY),
        .m_axis_tready_1(adc_controller_0_m_axis_1_TREADY),
        .m_axis_tready_2(adc_controller_0_m_axis_2_TREADY),
        .m_axis_tready_3(adc_controller_0_m_axis_3_TREADY),
        .m_axis_tvalid_0(adc_controller_0_m_axis_0_TVALID),
        .m_axis_tvalid_1(adc_controller_0_m_axis_1_TVALID),
        .m_axis_tvalid_2(adc_controller_0_m_axis_2_TVALID),
        .m_axis_tvalid_3(adc_controller_0_m_axis_3_TVALID),
        .rf_clk(rf_clk_0_1),
        .rf_reset(rf_reset_0_1),
        .s_axis_tdata(s_axis_0_1_TDATA),
        .s_axis_tready(s_axis_0_1_TREADY),
        .s_axis_tvalid(s_axis_0_1_TVALID),
        .state_out(state_out));
  rfsoc_adc_data_capture_axis_data_fifo_0_0 axis_data_fifo_0
       (.axis_rd_data_count(axis_data_fifo_0_axis_rd_data_count),
        .axis_wr_data_count(axis_data_fifo_0_axis_wr_data_count),
        .m_axis_aclk(Net),
        .m_axis_tdata(axis_data_fifo_0_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_0_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_0_M_AXIS_TVALID),
        .s_axis_aclk(rf_clk_0_1),
        .s_axis_aresetn(rf_reset_0_1),
        .s_axis_tdata(adc_controller_0_m_axis_0_TDATA),
        .s_axis_tready(adc_controller_0_m_axis_0_TREADY),
        .s_axis_tvalid(adc_controller_0_m_axis_0_TVALID));
  rfsoc_adc_data_capture_axis_data_fifo_0_1 axis_data_fifo_1
       (.m_axis_aclk(Net),
        .m_axis_tdata(axis_data_fifo_1_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_1_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_1_M_AXIS_TVALID),
        .s_axis_aclk(rf_clk_0_1),
        .s_axis_aresetn(rf_reset_0_1),
        .s_axis_tdata(adc_controller_0_m_axis_1_TDATA),
        .s_axis_tready(adc_controller_0_m_axis_1_TREADY),
        .s_axis_tvalid(adc_controller_0_m_axis_1_TVALID));
  rfsoc_adc_data_capture_axis_data_fifo_0_2 axis_data_fifo_2
       (.m_axis_aclk(Net),
        .m_axis_tdata(axis_data_fifo_2_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_2_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_2_M_AXIS_TVALID),
        .s_axis_aclk(rf_clk_0_1),
        .s_axis_aresetn(rf_reset_0_1),
        .s_axis_tdata(adc_controller_0_m_axis_2_TDATA),
        .s_axis_tready(adc_controller_0_m_axis_2_TREADY),
        .s_axis_tvalid(adc_controller_0_m_axis_2_TVALID));
  rfsoc_adc_data_capture_axis_data_fifo_0_3 axis_data_fifo_3
       (.m_axis_aclk(Net),
        .m_axis_tdata(axis_data_fifo_3_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_3_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_3_M_AXIS_TVALID),
        .s_axis_aclk(rf_clk_0_1),
        .s_axis_aresetn(rf_reset_0_1),
        .s_axis_tdata(adc_controller_0_m_axis_3_TDATA),
        .s_axis_tready(adc_controller_0_m_axis_3_TREADY),
        .s_axis_tvalid(adc_controller_0_m_axis_3_TVALID));
  rfsoc_adc_data_capture_axis_data_fifo_4_0 axis_data_fifo_4
       (.m_axis_aclk(rf_clk_0_1),
        .m_axis_tdata(axis_data_fifo_4_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_4_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_4_M_AXIS_TVALID),
        .s_axis_aclk(Net),
        .s_axis_aresetn(s_axis_aresetn_0_1),
        .s_axis_tdata(gpio_buffer_0_m_axis_TDATA),
        .s_axis_tready(gpio_buffer_0_m_axis_TREADY),
        .s_axis_tvalid(gpio_buffer_0_m_axis_TVALID));
  rfsoc_adc_data_capture_gpio_buffer_0_0 gpio_buffer_0
       (.gpio_in(gpio_in_0_1),
        .gpio_out(gpio_buffer_0_gpio_out),
        .m_axis_tdata(gpio_buffer_0_m_axis_TDATA),
        .m_axis_tready(gpio_buffer_0_m_axis_TREADY),
        .m_axis_tvalid(gpio_buffer_0_m_axis_TVALID),
        .s_axis_tdata(axis_data_fifo_4_M_AXIS_TDATA),
        .s_axis_tready(axis_data_fifo_4_M_AXIS_TREADY),
        .s_axis_tvalid(axis_data_fifo_4_M_AXIS_TVALID));
  rfsoc_adc_data_capture_system_ila_0_0 system_ila_0
       (.SLOT_0_AXIS_tdata(s_axis_0_1_TDATA),
        .SLOT_0_AXIS_tlast(1'b0),
        .SLOT_0_AXIS_tready(s_axis_0_1_TREADY),
        .SLOT_0_AXIS_tvalid(s_axis_0_1_TVALID),
        .SLOT_1_AXIS_tdata(adc_controller_0_m_axis_0_TDATA),
        .SLOT_1_AXIS_tlast(1'b0),
        .SLOT_1_AXIS_tready(adc_controller_0_m_axis_0_TREADY),
        .SLOT_1_AXIS_tvalid(adc_controller_0_m_axis_0_TVALID),
        .clk(rf_clk_0_1),
        .probe0(count_out),
        .probe1(ext_trigger_0_1),
        .probe2(state_out),
        .probe3(adc_controller_0_count_val_out),
        .probe4(gpio_buffer_0_gpio_out),
        .resetn(rf_reset_0_1));
  rfsoc_adc_data_capture_system_ila_1_0 system_ila_1
       (.SLOT_0_AXIS_tdata(axis_data_fifo_0_M_AXIS_TDATA),
        .SLOT_0_AXIS_tlast(1'b0),
        .SLOT_0_AXIS_tready(axis_data_fifo_0_M_AXIS_TREADY),
        .SLOT_0_AXIS_tvalid(axis_data_fifo_0_M_AXIS_TVALID),
        .clk(Net),
        .probe0(axis_data_fifo_0_axis_wr_data_count),
        .probe1(axis_data_fifo_0_axis_rd_data_count),
        .resetn(s_axis_aresetn_0_1));
endmodule
