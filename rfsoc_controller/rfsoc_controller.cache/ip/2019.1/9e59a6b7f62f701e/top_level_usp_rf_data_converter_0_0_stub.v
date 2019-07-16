// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Mon Jul 15 10:45:23 2019
// Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_usp_rf_data_converter_0_0_stub.v
// Design      : top_level_usp_rf_data_converter_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "usp_rf_data_converter_v2_1_2,Vivado 2019.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(s_axi_aclk, s_axi_aresetn, s_axi_awaddr, 
  s_axi_awvalid, s_axi_awready, s_axi_wdata, s_axi_wstrb, s_axi_wvalid, s_axi_wready, 
  s_axi_bresp, s_axi_bvalid, s_axi_bready, s_axi_araddr, s_axi_arvalid, s_axi_arready, 
  s_axi_rdata, s_axi_rresp, s_axi_rvalid, s_axi_rready, sysref_in_p, sysref_in_n, dac0_clk_p, 
  dac0_clk_n, clk_dac0, s0_axis_aclk, s0_axis_aresetn, dac1_clk_p, dac1_clk_n, clk_dac1, 
  s1_axis_aclk, s1_axis_aresetn, dac2_clk_p, dac2_clk_n, clk_dac2, s2_axis_aclk, 
  s2_axis_aresetn, dac3_clk_p, dac3_clk_n, clk_dac3, s3_axis_aclk, s3_axis_aresetn, vout00_p, 
  vout00_n, vout01_p, vout01_n, vout02_p, vout02_n, vout03_p, vout03_n, vout10_p, vout10_n, vout11_p, 
  vout11_n, vout12_p, vout12_n, vout13_p, vout13_n, vout20_p, vout20_n, vout21_p, vout21_n, vout22_p, 
  vout22_n, vout23_p, vout23_n, vout30_p, vout30_n, vout31_p, vout31_n, vout32_p, vout32_n, vout33_p, 
  vout33_n, s00_axis_tdata, s00_axis_tvalid, s00_axis_tready, s01_axis_tdata, 
  s01_axis_tvalid, s01_axis_tready, s02_axis_tdata, s02_axis_tvalid, s02_axis_tready, 
  s03_axis_tdata, s03_axis_tvalid, s03_axis_tready, s10_axis_tdata, s10_axis_tvalid, 
  s10_axis_tready, s11_axis_tdata, s11_axis_tvalid, s11_axis_tready, s12_axis_tdata, 
  s12_axis_tvalid, s12_axis_tready, s13_axis_tdata, s13_axis_tvalid, s13_axis_tready, 
  s20_axis_tdata, s20_axis_tvalid, s20_axis_tready, s21_axis_tdata, s21_axis_tvalid, 
  s21_axis_tready, s22_axis_tdata, s22_axis_tvalid, s22_axis_tready, s23_axis_tdata, 
  s23_axis_tvalid, s23_axis_tready, s30_axis_tdata, s30_axis_tvalid, s30_axis_tready, 
  s31_axis_tdata, s31_axis_tvalid, s31_axis_tready, s32_axis_tdata, s32_axis_tvalid, 
  s32_axis_tready, s33_axis_tdata, s33_axis_tvalid, s33_axis_tready, irq)
/* synthesis syn_black_box black_box_pad_pin="s_axi_aclk,s_axi_aresetn,s_axi_awaddr[17:0],s_axi_awvalid,s_axi_awready,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wvalid,s_axi_wready,s_axi_bresp[1:0],s_axi_bvalid,s_axi_bready,s_axi_araddr[17:0],s_axi_arvalid,s_axi_arready,s_axi_rdata[31:0],s_axi_rresp[1:0],s_axi_rvalid,s_axi_rready,sysref_in_p,sysref_in_n,dac0_clk_p,dac0_clk_n,clk_dac0,s0_axis_aclk,s0_axis_aresetn,dac1_clk_p,dac1_clk_n,clk_dac1,s1_axis_aclk,s1_axis_aresetn,dac2_clk_p,dac2_clk_n,clk_dac2,s2_axis_aclk,s2_axis_aresetn,dac3_clk_p,dac3_clk_n,clk_dac3,s3_axis_aclk,s3_axis_aresetn,vout00_p,vout00_n,vout01_p,vout01_n,vout02_p,vout02_n,vout03_p,vout03_n,vout10_p,vout10_n,vout11_p,vout11_n,vout12_p,vout12_n,vout13_p,vout13_n,vout20_p,vout20_n,vout21_p,vout21_n,vout22_p,vout22_n,vout23_p,vout23_n,vout30_p,vout30_n,vout31_p,vout31_n,vout32_p,vout32_n,vout33_p,vout33_n,s00_axis_tdata[255:0],s00_axis_tvalid,s00_axis_tready,s01_axis_tdata[255:0],s01_axis_tvalid,s01_axis_tready,s02_axis_tdata[255:0],s02_axis_tvalid,s02_axis_tready,s03_axis_tdata[255:0],s03_axis_tvalid,s03_axis_tready,s10_axis_tdata[255:0],s10_axis_tvalid,s10_axis_tready,s11_axis_tdata[255:0],s11_axis_tvalid,s11_axis_tready,s12_axis_tdata[255:0],s12_axis_tvalid,s12_axis_tready,s13_axis_tdata[255:0],s13_axis_tvalid,s13_axis_tready,s20_axis_tdata[255:0],s20_axis_tvalid,s20_axis_tready,s21_axis_tdata[255:0],s21_axis_tvalid,s21_axis_tready,s22_axis_tdata[255:0],s22_axis_tvalid,s22_axis_tready,s23_axis_tdata[255:0],s23_axis_tvalid,s23_axis_tready,s30_axis_tdata[255:0],s30_axis_tvalid,s30_axis_tready,s31_axis_tdata[255:0],s31_axis_tvalid,s31_axis_tready,s32_axis_tdata[255:0],s32_axis_tvalid,s32_axis_tready,s33_axis_tdata[255:0],s33_axis_tvalid,s33_axis_tready,irq" */;
  input s_axi_aclk;
  input s_axi_aresetn;
  input [17:0]s_axi_awaddr;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [17:0]s_axi_araddr;
  input s_axi_arvalid;
  output s_axi_arready;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rvalid;
  input s_axi_rready;
  input sysref_in_p;
  input sysref_in_n;
  input dac0_clk_p;
  input dac0_clk_n;
  output clk_dac0;
  input s0_axis_aclk;
  input s0_axis_aresetn;
  input dac1_clk_p;
  input dac1_clk_n;
  output clk_dac1;
  input s1_axis_aclk;
  input s1_axis_aresetn;
  input dac2_clk_p;
  input dac2_clk_n;
  output clk_dac2;
  input s2_axis_aclk;
  input s2_axis_aresetn;
  input dac3_clk_p;
  input dac3_clk_n;
  output clk_dac3;
  input s3_axis_aclk;
  input s3_axis_aresetn;
  output vout00_p;
  output vout00_n;
  output vout01_p;
  output vout01_n;
  output vout02_p;
  output vout02_n;
  output vout03_p;
  output vout03_n;
  output vout10_p;
  output vout10_n;
  output vout11_p;
  output vout11_n;
  output vout12_p;
  output vout12_n;
  output vout13_p;
  output vout13_n;
  output vout20_p;
  output vout20_n;
  output vout21_p;
  output vout21_n;
  output vout22_p;
  output vout22_n;
  output vout23_p;
  output vout23_n;
  output vout30_p;
  output vout30_n;
  output vout31_p;
  output vout31_n;
  output vout32_p;
  output vout32_n;
  output vout33_p;
  output vout33_n;
  input [255:0]s00_axis_tdata;
  input s00_axis_tvalid;
  output s00_axis_tready;
  input [255:0]s01_axis_tdata;
  input s01_axis_tvalid;
  output s01_axis_tready;
  input [255:0]s02_axis_tdata;
  input s02_axis_tvalid;
  output s02_axis_tready;
  input [255:0]s03_axis_tdata;
  input s03_axis_tvalid;
  output s03_axis_tready;
  input [255:0]s10_axis_tdata;
  input s10_axis_tvalid;
  output s10_axis_tready;
  input [255:0]s11_axis_tdata;
  input s11_axis_tvalid;
  output s11_axis_tready;
  input [255:0]s12_axis_tdata;
  input s12_axis_tvalid;
  output s12_axis_tready;
  input [255:0]s13_axis_tdata;
  input s13_axis_tvalid;
  output s13_axis_tready;
  input [255:0]s20_axis_tdata;
  input s20_axis_tvalid;
  output s20_axis_tready;
  input [255:0]s21_axis_tdata;
  input s21_axis_tvalid;
  output s21_axis_tready;
  input [255:0]s22_axis_tdata;
  input s22_axis_tvalid;
  output s22_axis_tready;
  input [255:0]s23_axis_tdata;
  input s23_axis_tvalid;
  output s23_axis_tready;
  input [255:0]s30_axis_tdata;
  input s30_axis_tvalid;
  output s30_axis_tready;
  input [255:0]s31_axis_tdata;
  input s31_axis_tvalid;
  output s31_axis_tready;
  input [255:0]s32_axis_tdata;
  input s32_axis_tvalid;
  output s32_axis_tready;
  input [255:0]s33_axis_tdata;
  input s33_axis_tvalid;
  output s33_axis_tready;
  output irq;
endmodule
