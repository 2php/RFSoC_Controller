// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Tue Jul 16 10:22:08 2019
// Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/james/fpga_projects/rfsoc_controller/rfsoc_controller.srcs/sources_1/bd/top_level/ip/top_level_channel_select_0_0/top_level_channel_select_0_0_sim_netlist.v
// Design      : top_level_channel_select_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "top_level_channel_select_0_0,channel_select,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "channel_select,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module top_level_channel_select_0_0
   (mb_clk,
    mb_reset,
    gpio_in,
    ch0,
    ch1,
    ch2,
    ch3,
    ch4,
    ch5,
    ch6,
    ch7,
    ch8,
    ch9,
    ch10,
    ch11,
    ch12,
    ch13,
    ch14,
    ch15);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 mb_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME mb_clk, ASSOCIATED_RESET mb_reset, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN top_level_clk_wiz_1_0_clk_out1, INSERT_VIP 0" *) input mb_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 mb_reset RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME mb_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input mb_reset;
  input [15:0]gpio_in;
  output ch0;
  output ch1;
  output ch2;
  output ch3;
  output ch4;
  output ch5;
  output ch6;
  output ch7;
  output ch8;
  output ch9;
  output ch10;
  output ch11;
  output ch12;
  output ch13;
  output ch14;
  output ch15;

  wire ch0;
  wire ch1;
  wire ch10;
  wire ch11;
  wire ch12;
  wire ch13;
  wire ch14;
  wire ch15;
  wire ch2;
  wire ch3;
  wire ch4;
  wire ch5;
  wire ch6;
  wire ch7;
  wire ch8;
  wire ch9;
  wire [15:0]gpio_in;
  wire mb_clk;
  wire mb_reset;

  top_level_channel_select_0_0_channel_select inst
       (.Q({ch15,ch14,ch13,ch12,ch11,ch10,ch9,ch8,ch7,ch6,ch5,ch4,ch3,ch2,ch1,ch0}),
        .gpio_in({gpio_in[9],gpio_in[4]}),
        .mb_clk(mb_clk),
        .mb_reset(mb_reset));
endmodule

(* ORIG_REF_NAME = "channel_select" *) 
module top_level_channel_select_0_0_channel_select
   (Q,
    gpio_in,
    mb_clk,
    mb_reset);
  output [15:0]Q;
  input [1:0]gpio_in;
  input mb_clk;
  input mb_reset;

  wire [15:0]Q;
  wire [1:0]gpio_in;
  wire mb_clk;
  wire mb_reset;

  top_level_channel_select_0_0_shift_register sr
       (.Q(Q),
        .gpio_in(gpio_in),
        .mb_clk(mb_clk),
        .mb_reset(mb_reset));
endmodule

(* ORIG_REF_NAME = "shift_register" *) 
module top_level_channel_select_0_0_shift_register
   (Q,
    gpio_in,
    mb_clk,
    mb_reset);
  output [15:0]Q;
  input [1:0]gpio_in;
  input mb_clk;
  input mb_reset;

  wire [15:0]Q;
  wire \data_out[0]_i_1_n_0 ;
  wire \data_out[0]_i_2_n_0 ;
  wire [1:0]gpio_in;
  wire mb_clk;
  wire mb_reset;
  wire state;

  LUT2 #(
    .INIT(4'h2)) 
    \data_out[0]_i_1 
       (.I0(gpio_in[1]),
        .I1(state),
        .O(\data_out[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data_out[0]_i_2 
       (.I0(mb_reset),
        .O(\data_out[0]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[0] 
       (.C(mb_clk),
        .CE(\data_out[0]_i_1_n_0 ),
        .CLR(\data_out[0]_i_2_n_0 ),
        .D(Q[1]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[10] 
       (.C(mb_clk),
        .CE(\data_out[0]_i_1_n_0 ),
        .CLR(\data_out[0]_i_2_n_0 ),
        .D(Q[11]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[11] 
       (.C(mb_clk),
        .CE(\data_out[0]_i_1_n_0 ),
        .CLR(\data_out[0]_i_2_n_0 ),
        .D(Q[12]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[12] 
       (.C(mb_clk),
        .CE(\data_out[0]_i_1_n_0 ),
        .CLR(\data_out[0]_i_2_n_0 ),
        .D(Q[13]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[13] 
       (.C(mb_clk),
        .CE(\data_out[0]_i_1_n_0 ),
        .CLR(\data_out[0]_i_2_n_0 ),
        .D(Q[14]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[14] 
       (.C(mb_clk),
        .CE(\data_out[0]_i_1_n_0 ),
        .CLR(\data_out[0]_i_2_n_0 ),
        .D(Q[15]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[15] 
       (.C(mb_clk),
        .CE(\data_out[0]_i_1_n_0 ),
        .CLR(\data_out[0]_i_2_n_0 ),
        .D(gpio_in[0]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[1] 
       (.C(mb_clk),
        .CE(\data_out[0]_i_1_n_0 ),
        .CLR(\data_out[0]_i_2_n_0 ),
        .D(Q[2]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[2] 
       (.C(mb_clk),
        .CE(\data_out[0]_i_1_n_0 ),
        .CLR(\data_out[0]_i_2_n_0 ),
        .D(Q[3]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[3] 
       (.C(mb_clk),
        .CE(\data_out[0]_i_1_n_0 ),
        .CLR(\data_out[0]_i_2_n_0 ),
        .D(Q[4]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[4] 
       (.C(mb_clk),
        .CE(\data_out[0]_i_1_n_0 ),
        .CLR(\data_out[0]_i_2_n_0 ),
        .D(Q[5]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[5] 
       (.C(mb_clk),
        .CE(\data_out[0]_i_1_n_0 ),
        .CLR(\data_out[0]_i_2_n_0 ),
        .D(Q[6]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[6] 
       (.C(mb_clk),
        .CE(\data_out[0]_i_1_n_0 ),
        .CLR(\data_out[0]_i_2_n_0 ),
        .D(Q[7]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[7] 
       (.C(mb_clk),
        .CE(\data_out[0]_i_1_n_0 ),
        .CLR(\data_out[0]_i_2_n_0 ),
        .D(Q[8]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[8] 
       (.C(mb_clk),
        .CE(\data_out[0]_i_1_n_0 ),
        .CLR(\data_out[0]_i_2_n_0 ),
        .D(Q[9]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \data_out_reg[9] 
       (.C(mb_clk),
        .CE(\data_out[0]_i_1_n_0 ),
        .CLR(\data_out[0]_i_2_n_0 ),
        .D(Q[10]),
        .Q(Q[9]));
  FDCE #(
    .INIT(1'b0)) 
    state_reg
       (.C(mb_clk),
        .CE(1'b1),
        .CLR(\data_out[0]_i_2_n_0 ),
        .D(gpio_in[1]),
        .Q(state));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
