//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Fri Aug 23 10:35:08 2019
//Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
//Command     : generate_target rfsoc_adc_data_capture.bd
//Design      : rfsoc_adc_data_capture
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "rfsoc_adc_data_capture,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=rfsoc_adc_data_capture,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=10,numReposBlks=10,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "rfsoc_adc_data_capture.hwdef" *) 
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
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis, CLK_DOMAIN rfsoc_adc_data_capture_rf_clk_0, FREQ_HZ 250000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [127:0]s_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TREADY" *) output s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *) input s_axis_tvalid;

  wire Net;
  wire [127:0]adc_controller_0_m_axis_0_TDATA;
  wire adc_controller_0_m_axis_0_TREADY;
  wire adc_controller_0_m_axis_0_TVALID;
  wire [31:0]adc_controller_0_m_axis_1_TDATA;
  wire adc_controller_0_m_axis_1_TREADY;
  wire adc_controller_0_m_axis_1_TVALID;
  wire [31:0]adc_controller_0_m_axis_5_TDATA;
  wire adc_controller_0_m_axis_5_TREADY;
  wire adc_controller_0_m_axis_5_TVALID;
  wire [31:0]adc_controller_0_m_axis_6_TDATA;
  wire adc_controller_0_m_axis_6_TREADY;
  wire adc_controller_0_m_axis_6_TVALID;
  wire [31:0]adc_controller_0_m_axis_7_TDATA;
  wire adc_controller_0_m_axis_7_TREADY;
  wire adc_controller_0_m_axis_7_TVALID;
  wire [127:0]axis_data_fifo_0_M_AXIS_TDATA;
  wire axis_data_fifo_0_M_AXIS_TREADY;
  wire axis_data_fifo_0_M_AXIS_TVALID;
  wire [31:0]axis_data_fifo_10_M_AXIS_TDATA;
  wire axis_data_fifo_10_M_AXIS_TREADY;
  wire axis_data_fifo_10_M_AXIS_TVALID;
  wire [31:0]axis_data_fifo_11_M_AXIS_TDATA;
  wire axis_data_fifo_11_M_AXIS_TREADY;
  wire axis_data_fifo_11_M_AXIS_TVALID;
  wire [31:0]axis_data_fifo_12_M_AXIS_TDATA;
  wire axis_data_fifo_12_M_AXIS_TREADY;
  wire axis_data_fifo_12_M_AXIS_TVALID;
  wire [127:0]axis_data_fifo_1_M_AXIS_TDATA;
  wire axis_data_fifo_1_M_AXIS_TREADY;
  wire axis_data_fifo_1_M_AXIS_TVALID;
  wire [15:0]axis_data_fifo_4_M_AXIS_TDATA;
  wire axis_data_fifo_4_M_AXIS_TREADY;
  wire axis_data_fifo_4_M_AXIS_TVALID;
  wire [31:0]axis_data_fifo_9_M_AXIS_TDATA;
  wire axis_data_fifo_9_M_AXIS_TREADY;
  wire axis_data_fifo_9_M_AXIS_TVALID;
  wire [127:0]axis_register_slice_0_M_AXIS_TDATA;
  wire axis_register_slice_0_M_AXIS_TREADY;
  wire axis_register_slice_0_M_AXIS_TVALID;
  wire ext_trigger_0_1;
  wire [15:0]gpio_buffer_0_gpio_out;
  wire [15:0]gpio_buffer_0_m_axis_TDATA;
  wire gpio_buffer_0_m_axis_TREADY;
  wire gpio_buffer_0_m_axis_TVALID;
  wire [15:0]gpio_in_0_1;
  wire rf_clk_0_1;
  wire rf_reset_0_1;
  wire [127:0]s_axis_1_TDATA;
  wire s_axis_1_TREADY;
  wire s_axis_1_TVALID;
  wire s_axis_aresetn_0_1;

  assign M_AXIS_0_tdata[31:0] = axis_data_fifo_12_M_AXIS_TDATA;
  assign M_AXIS_0_tvalid = axis_data_fifo_12_M_AXIS_TVALID;
  assign M_AXIS_1_tdata[31:0] = axis_data_fifo_11_M_AXIS_TDATA;
  assign M_AXIS_1_tvalid = axis_data_fifo_11_M_AXIS_TVALID;
  assign M_AXIS_2_tdata[31:0] = axis_data_fifo_10_M_AXIS_TDATA;
  assign M_AXIS_2_tvalid = axis_data_fifo_10_M_AXIS_TVALID;
  assign M_AXIS_3_tdata[31:0] = axis_data_fifo_9_M_AXIS_TDATA;
  assign M_AXIS_3_tvalid = axis_data_fifo_9_M_AXIS_TVALID;
  assign Net = microblaze_clk;
  assign axis_data_fifo_10_M_AXIS_TREADY = M_AXIS_2_tready;
  assign axis_data_fifo_11_M_AXIS_TREADY = M_AXIS_1_tready;
  assign axis_data_fifo_12_M_AXIS_TREADY = M_AXIS_0_tready;
  assign axis_data_fifo_9_M_AXIS_TREADY = M_AXIS_3_tready;
  assign ext_trigger_0_1 = ext_trigger;
  assign gpio_in_0_1 = gpio_in[15:0];
  assign rf_clk_0_1 = rf_clk;
  assign rf_reset_0_1 = rf_reset;
  assign s_axis_1_TDATA = s_axis_tdata[127:0];
  assign s_axis_1_TVALID = s_axis_tvalid;
  assign s_axis_aresetn_0_1 = microblaze_reset;
  assign s_axis_tready = s_axis_1_TREADY;
  rfsoc_adc_data_capture_adc_controller_0_0 adc_controller_0
       (.ext_trigger(ext_trigger_0_1),
        .gpio_in(gpio_buffer_0_gpio_out),
        .m_axis_tdata_0(adc_controller_0_m_axis_0_TDATA),
        .m_axis_tdata_1(adc_controller_0_m_axis_1_TDATA),
        .m_axis_tdata_2(adc_controller_0_m_axis_5_TDATA),
        .m_axis_tdata_3(adc_controller_0_m_axis_7_TDATA),
        .m_axis_tdata_4(adc_controller_0_m_axis_6_TDATA),
        .m_axis_tready_0(adc_controller_0_m_axis_0_TREADY),
        .m_axis_tready_1(adc_controller_0_m_axis_1_TREADY),
        .m_axis_tready_2(adc_controller_0_m_axis_5_TREADY),
        .m_axis_tready_3(adc_controller_0_m_axis_7_TREADY),
        .m_axis_tready_4(adc_controller_0_m_axis_6_TREADY),
        .m_axis_tvalid_0(adc_controller_0_m_axis_0_TVALID),
        .m_axis_tvalid_1(adc_controller_0_m_axis_1_TVALID),
        .m_axis_tvalid_2(adc_controller_0_m_axis_5_TVALID),
        .m_axis_tvalid_3(adc_controller_0_m_axis_7_TVALID),
        .m_axis_tvalid_4(adc_controller_0_m_axis_6_TVALID),
        .rf_clk(rf_clk_0_1),
        .rf_reset(rf_reset_0_1),
        .s_axis_tdata_0(axis_register_slice_0_M_AXIS_TDATA),
        .s_axis_tdata_1(axis_data_fifo_1_M_AXIS_TDATA),
        .s_axis_tready_0(axis_register_slice_0_M_AXIS_TREADY),
        .s_axis_tready_1(axis_data_fifo_1_M_AXIS_TREADY),
        .s_axis_tvalid_0(axis_register_slice_0_M_AXIS_TVALID),
        .s_axis_tvalid_1(axis_data_fifo_1_M_AXIS_TVALID));
  rfsoc_adc_data_capture_axis_data_fifo_0_16 axis_data_fifo_0
       (.m_axis_tdata(axis_data_fifo_0_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_0_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_0_M_AXIS_TVALID),
        .s_axis_aclk(rf_clk_0_1),
        .s_axis_aresetn(rf_reset_0_1),
        .s_axis_tdata(adc_controller_0_m_axis_0_TDATA),
        .s_axis_tready(adc_controller_0_m_axis_0_TREADY),
        .s_axis_tvalid(adc_controller_0_m_axis_0_TVALID));
  rfsoc_adc_data_capture_axis_data_fifo_1_9 axis_data_fifo_1
       (.m_axis_tdata(axis_data_fifo_1_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_1_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_1_M_AXIS_TVALID),
        .s_axis_aclk(rf_clk_0_1),
        .s_axis_aresetn(rf_reset_0_1),
        .s_axis_tdata(axis_data_fifo_0_M_AXIS_TDATA),
        .s_axis_tready(axis_data_fifo_0_M_AXIS_TREADY),
        .s_axis_tvalid(axis_data_fifo_0_M_AXIS_TVALID));
  rfsoc_adc_data_capture_axis_data_fifo_10_4 axis_data_fifo_10
       (.m_axis_aclk(Net),
        .m_axis_tdata(axis_data_fifo_10_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_10_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_10_M_AXIS_TVALID),
        .s_axis_aclk(rf_clk_0_1),
        .s_axis_aresetn(rf_reset_0_1),
        .s_axis_tdata(adc_controller_0_m_axis_7_TDATA),
        .s_axis_tready(adc_controller_0_m_axis_7_TREADY),
        .s_axis_tvalid(adc_controller_0_m_axis_7_TVALID));
  rfsoc_adc_data_capture_axis_data_fifo_11_4 axis_data_fifo_11
       (.m_axis_aclk(Net),
        .m_axis_tdata(axis_data_fifo_11_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_11_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_11_M_AXIS_TVALID),
        .s_axis_aclk(rf_clk_0_1),
        .s_axis_aresetn(rf_reset_0_1),
        .s_axis_tdata(adc_controller_0_m_axis_5_TDATA),
        .s_axis_tready(adc_controller_0_m_axis_5_TREADY),
        .s_axis_tvalid(adc_controller_0_m_axis_5_TVALID));
  rfsoc_adc_data_capture_axis_data_fifo_12_4 axis_data_fifo_12
       (.m_axis_aclk(Net),
        .m_axis_tdata(axis_data_fifo_12_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_12_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_12_M_AXIS_TVALID),
        .s_axis_aclk(rf_clk_0_1),
        .s_axis_aresetn(rf_reset_0_1),
        .s_axis_tdata(adc_controller_0_m_axis_1_TDATA),
        .s_axis_tready(adc_controller_0_m_axis_1_TREADY),
        .s_axis_tvalid(adc_controller_0_m_axis_1_TVALID));
  rfsoc_adc_data_capture_axis_data_fifo_4_8 axis_data_fifo_4
       (.m_axis_aclk(rf_clk_0_1),
        .m_axis_tdata(axis_data_fifo_4_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_4_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_4_M_AXIS_TVALID),
        .s_axis_aclk(Net),
        .s_axis_aresetn(s_axis_aresetn_0_1),
        .s_axis_tdata(gpio_buffer_0_m_axis_TDATA),
        .s_axis_tready(gpio_buffer_0_m_axis_TREADY),
        .s_axis_tvalid(gpio_buffer_0_m_axis_TVALID));
  rfsoc_adc_data_capture_axis_data_fifo_9_8 axis_data_fifo_9
       (.m_axis_aclk(Net),
        .m_axis_tdata(axis_data_fifo_9_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_9_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_9_M_AXIS_TVALID),
        .s_axis_aclk(rf_clk_0_1),
        .s_axis_aresetn(rf_reset_0_1),
        .s_axis_tdata(adc_controller_0_m_axis_6_TDATA),
        .s_axis_tready(adc_controller_0_m_axis_6_TREADY),
        .s_axis_tvalid(adc_controller_0_m_axis_6_TVALID));
  rfsoc_adc_data_capture_axis_register_slice_0_6 axis_register_slice_0
       (.aclk(rf_clk_0_1),
        .aresetn(rf_reset_0_1),
        .m_axis_tdata(axis_register_slice_0_M_AXIS_TDATA),
        .m_axis_tready(axis_register_slice_0_M_AXIS_TREADY),
        .m_axis_tvalid(axis_register_slice_0_M_AXIS_TVALID),
        .s_axis_tdata(s_axis_1_TDATA),
        .s_axis_tready(s_axis_1_TREADY),
        .s_axis_tvalid(s_axis_1_TVALID));
  rfsoc_adc_data_capture_gpio_buffer_0_0 gpio_buffer_0
       (.gpio_in(gpio_in_0_1),
        .gpio_out(gpio_buffer_0_gpio_out),
        .m_axis_tdata(gpio_buffer_0_m_axis_TDATA),
        .m_axis_tready(gpio_buffer_0_m_axis_TREADY),
        .m_axis_tvalid(gpio_buffer_0_m_axis_TVALID),
        .s_axis_tdata(axis_data_fifo_4_M_AXIS_TDATA),
        .s_axis_tready(axis_data_fifo_4_M_AXIS_TREADY),
        .s_axis_tvalid(axis_data_fifo_4_M_AXIS_TVALID));
endmodule
