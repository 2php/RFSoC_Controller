// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Fri Jun 21 11:56:36 2019
// Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_gpio_split_0_0_stub.v
// Design      : top_level_gpio_split_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "gpio_split,Vivado 2019.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(gpio_in, arm, fire, wave_reg_sclk, wave_reg_pclk, 
  wave_reg_data_in, wave_reg_cycle, delay_reg_sclk, delay_reg_data_in, idle_reg_sclk, 
  idle_reg_data_in, a_tv, dummy_reset, dummy_microblaze_reset)
/* synthesis syn_black_box black_box_pad_pin="gpio_in[15:0],arm,fire,wave_reg_sclk,wave_reg_pclk,wave_reg_data_in,wave_reg_cycle,delay_reg_sclk,delay_reg_data_in,idle_reg_sclk,idle_reg_data_in,a_tv,dummy_reset,dummy_microblaze_reset" */;
  input [15:0]gpio_in;
  output arm;
  output fire;
  output wave_reg_sclk;
  output wave_reg_pclk;
  output wave_reg_data_in;
  output wave_reg_cycle;
  output delay_reg_sclk;
  output delay_reg_data_in;
  output idle_reg_sclk;
  output idle_reg_data_in;
  output a_tv;
  output dummy_reset;
  output dummy_microblaze_reset;
endmodule
