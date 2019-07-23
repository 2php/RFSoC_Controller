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


// IP VLNV: xilinx.com:module_ref:trigger_module:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module trigger_controller_trigger_module_0_0 (
  rf_clk,
  rf_reset,
  trigger_in,
  pipeline_active_in_0,
  pipeline_active_in_1,
  pipeline_active_in_2,
  pipeline_active_in_3,
  pipeline_active_in_4,
  pipeline_active_in_5,
  pipeline_active_in_6,
  pipeline_active_in_7,
  pipeline_active_in_8,
  pipeline_active_in_9,
  pipeline_active_in_10,
  pipeline_active_in_11,
  pipeline_active_in_12,
  pipeline_active_in_13,
  pipeline_active_in_14,
  pipeline_active_in_15,
  gpio_in,
  trigger_c0,
  trigger_c1,
  trigger_c2,
  trigger_c3,
  trigger_c4,
  trigger_c5,
  trigger_c6,
  trigger_c7,
  trigger_c8,
  trigger_c9,
  trigger_c10,
  trigger_c11,
  trigger_c12,
  trigger_c13,
  trigger_c14,
  trigger_c15
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rf_clk, ASSOCIATED_RESET rf_reset, FREQ_HZ 250000000, PHASE 0.000, CLK_DOMAIN trigger_controller_rf_clk, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 rf_clk CLK" *)
input wire rf_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rf_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rf_reset RST" *)
input wire rf_reset;
input wire trigger_in;
input wire pipeline_active_in_0;
input wire pipeline_active_in_1;
input wire pipeline_active_in_2;
input wire pipeline_active_in_3;
input wire pipeline_active_in_4;
input wire pipeline_active_in_5;
input wire pipeline_active_in_6;
input wire pipeline_active_in_7;
input wire pipeline_active_in_8;
input wire pipeline_active_in_9;
input wire pipeline_active_in_10;
input wire pipeline_active_in_11;
input wire pipeline_active_in_12;
input wire pipeline_active_in_13;
input wire pipeline_active_in_14;
input wire pipeline_active_in_15;
input wire [15 : 0] gpio_in;
output wire trigger_c0;
output wire trigger_c1;
output wire trigger_c2;
output wire trigger_c3;
output wire trigger_c4;
output wire trigger_c5;
output wire trigger_c6;
output wire trigger_c7;
output wire trigger_c8;
output wire trigger_c9;
output wire trigger_c10;
output wire trigger_c11;
output wire trigger_c12;
output wire trigger_c13;
output wire trigger_c14;
output wire trigger_c15;

  trigger_module #(
    .count_cycles(2),
    .gpio_trigger(11)
  ) inst (
    .rf_clk(rf_clk),
    .rf_reset(rf_reset),
    .trigger_in(trigger_in),
    .pipeline_active_in_0(pipeline_active_in_0),
    .pipeline_active_in_1(pipeline_active_in_1),
    .pipeline_active_in_2(pipeline_active_in_2),
    .pipeline_active_in_3(pipeline_active_in_3),
    .pipeline_active_in_4(pipeline_active_in_4),
    .pipeline_active_in_5(pipeline_active_in_5),
    .pipeline_active_in_6(pipeline_active_in_6),
    .pipeline_active_in_7(pipeline_active_in_7),
    .pipeline_active_in_8(pipeline_active_in_8),
    .pipeline_active_in_9(pipeline_active_in_9),
    .pipeline_active_in_10(pipeline_active_in_10),
    .pipeline_active_in_11(pipeline_active_in_11),
    .pipeline_active_in_12(pipeline_active_in_12),
    .pipeline_active_in_13(pipeline_active_in_13),
    .pipeline_active_in_14(pipeline_active_in_14),
    .pipeline_active_in_15(pipeline_active_in_15),
    .gpio_in(gpio_in),
    .trigger_c0(trigger_c0),
    .trigger_c1(trigger_c1),
    .trigger_c2(trigger_c2),
    .trigger_c3(trigger_c3),
    .trigger_c4(trigger_c4),
    .trigger_c5(trigger_c5),
    .trigger_c6(trigger_c6),
    .trigger_c7(trigger_c7),
    .trigger_c8(trigger_c8),
    .trigger_c9(trigger_c9),
    .trigger_c10(trigger_c10),
    .trigger_c11(trigger_c11),
    .trigger_c12(trigger_c12),
    .trigger_c13(trigger_c13),
    .trigger_c14(trigger_c14),
    .trigger_c15(trigger_c15)
  );
endmodule