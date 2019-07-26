// (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:adc_controller:1.0
// IP Revision: 1

(* X_CORE_INFO = "adc_controller,Vivado 2019.1" *)
(* CHECK_LICENSE_TYPE = "rfsoc_adc_data_capture_adc_controller_0_0,adc_controller,{}" *)
(* CORE_GENERATION_INFO = "rfsoc_adc_data_capture_adc_controller_0_0,adc_controller,{x_ipProduct=Vivado 2019.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=adc_controller,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,trigger_override_bit=0,ready_bit=1,locking_sclk=3,sdata=4,buffer_flush_bit=5,zeros_sclk=7,cycles_sclk=8,pre_waveform_sclk=10,adc_capture_count_sclk=12}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module rfsoc_adc_data_capture_adc_controller_0_0 (
  rf_clk,
  rf_reset,
  ext_trigger,
  gpio_in,
  s_axis_tdata,
  s_axis_tvalid,
  s_axis_tready,
  m_axis_tdata_0,
  m_axis_tvalid_0,
  m_axis_tready_0,
  m_axis_tdata_1,
  m_axis_tvalid_1,
  m_axis_tready_1,
  m_axis_tdata_2,
  m_axis_tvalid_2,
  m_axis_tready_2,
  m_axis_tdata_3,
  m_axis_tvalid_3,
  m_axis_tready_3
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rf_clk, ASSOCIATED_RESET rf_reset, FREQ_HZ 250000000, PHASE 0.000, CLK_DOMAIN rfsoc_adc_data_capture_rf_clk_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 rf_clk CLK" *)
input wire rf_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rf_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rf_reset RST" *)
input wire rf_reset;
input wire ext_trigger;
input wire [15 : 0] gpio_in;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA" *)
input wire [127 : 0] s_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *)
input wire s_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 250000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TREADY" *)
output wire s_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TDATA" *)
output wire [31 : 0] m_axis_tdata_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TVALID" *)
output wire m_axis_tvalid_0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 250000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TREADY" *)
input wire m_axis_tready_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_1 TDATA" *)
output wire [31 : 0] m_axis_tdata_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_1 TVALID" *)
output wire m_axis_tvalid_1;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_1, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 250000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_1 TREADY" *)
input wire m_axis_tready_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_2 TDATA" *)
output wire [31 : 0] m_axis_tdata_2;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_2 TVALID" *)
output wire m_axis_tvalid_2;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_2, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 250000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_2 TREADY" *)
input wire m_axis_tready_2;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_3 TDATA" *)
output wire [31 : 0] m_axis_tdata_3;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_3 TVALID" *)
output wire m_axis_tvalid_3;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_3, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 250000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_3 TREADY" *)
input wire m_axis_tready_3;

  adc_controller #(
    .trigger_override_bit(0),
    .ready_bit(1),
    .locking_sclk(3),
    .sdata(4),
    .buffer_flush_bit(5),
    .zeros_sclk(7),
    .cycles_sclk(8),
    .pre_waveform_sclk(10),
    .adc_capture_count_sclk(12)
  ) inst (
    .rf_clk(rf_clk),
    .rf_reset(rf_reset),
    .ext_trigger(ext_trigger),
    .gpio_in(gpio_in),
    .s_axis_tdata(s_axis_tdata),
    .s_axis_tvalid(s_axis_tvalid),
    .s_axis_tready(s_axis_tready),
    .m_axis_tdata_0(m_axis_tdata_0),
    .m_axis_tvalid_0(m_axis_tvalid_0),
    .m_axis_tready_0(m_axis_tready_0),
    .m_axis_tdata_1(m_axis_tdata_1),
    .m_axis_tvalid_1(m_axis_tvalid_1),
    .m_axis_tready_1(m_axis_tready_1),
    .m_axis_tdata_2(m_axis_tdata_2),
    .m_axis_tvalid_2(m_axis_tvalid_2),
    .m_axis_tready_2(m_axis_tready_2),
    .m_axis_tdata_3(m_axis_tdata_3),
    .m_axis_tvalid_3(m_axis_tvalid_3),
    .m_axis_tready_3(m_axis_tready_3)
  );
endmodule
