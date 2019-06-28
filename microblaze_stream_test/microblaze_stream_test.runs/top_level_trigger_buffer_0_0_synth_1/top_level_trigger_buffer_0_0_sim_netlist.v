// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Thu Jun 27 17:04:22 2019
// Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_trigger_buffer_0_0_sim_netlist.v
// Design      : top_level_trigger_buffer_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "top_level_trigger_buffer_0_0,trigger_buffer,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "trigger_buffer,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    reset,
    trigger_in,
    trigger_out);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 250000000, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_1_clk_dac0, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input reset;
  input trigger_in;
  output trigger_out;

  wire clk;
  wire reset;
  wire trigger_in;
  wire trigger_out;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_trigger_buffer inst
       (.clk(clk),
        .reset(reset),
        .trigger_in(trigger_in),
        .trigger_out(trigger_out));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_trigger_buffer
   (trigger_out,
    trigger_in,
    clk,
    reset);
  output trigger_out;
  input trigger_in;
  input clk;
  input reset;

  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_2_n_0 ;
  wire clk;
  wire count;
  wire \count[0]_i_10_n_0 ;
  wire \count[0]_i_11_n_0 ;
  wire \count[0]_i_3_n_0 ;
  wire \count[0]_i_4_n_0 ;
  wire \count[0]_i_5_n_0 ;
  wire \count[0]_i_6_n_0 ;
  wire \count[0]_i_7_n_0 ;
  wire \count[0]_i_8_n_0 ;
  wire \count[0]_i_9_n_0 ;
  wire \count[8]_i_2_n_0 ;
  wire \count[8]_i_3_n_0 ;
  wire \count[8]_i_4_n_0 ;
  wire [11:0]count_reg;
  wire \count_reg[0]_i_2_n_0 ;
  wire \count_reg[0]_i_2_n_1 ;
  wire \count_reg[0]_i_2_n_10 ;
  wire \count_reg[0]_i_2_n_11 ;
  wire \count_reg[0]_i_2_n_12 ;
  wire \count_reg[0]_i_2_n_13 ;
  wire \count_reg[0]_i_2_n_14 ;
  wire \count_reg[0]_i_2_n_15 ;
  wire \count_reg[0]_i_2_n_2 ;
  wire \count_reg[0]_i_2_n_3 ;
  wire \count_reg[0]_i_2_n_4 ;
  wire \count_reg[0]_i_2_n_5 ;
  wire \count_reg[0]_i_2_n_6 ;
  wire \count_reg[0]_i_2_n_7 ;
  wire \count_reg[0]_i_2_n_8 ;
  wire \count_reg[0]_i_2_n_9 ;
  wire \count_reg[8]_i_1_n_13 ;
  wire \count_reg[8]_i_1_n_14 ;
  wire \count_reg[8]_i_1_n_15 ;
  wire \count_reg[8]_i_1_n_4 ;
  wire \count_reg[8]_i_1_n_6 ;
  wire \count_reg[8]_i_1_n_7 ;
  wire reset;
  wire [1:0]state;
  wire trigger_in;
  wire trigger_out;
  wire trigger_out_i_1_n_0;
  wire trigger_out_i_2_n_0;
  wire trigger_out_i_3_n_0;
  wire trigger_out_i_4_n_0;
  wire trigger_out_i_5_n_0;
  wire [7:2]\NLW_count_reg[8]_i_1_CO_UNCONNECTED ;
  wire [7:3]\NLW_count_reg[8]_i_1_O_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h45)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(state[0]),
        .I1(trigger_in),
        .I2(state[1]),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0734)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(trigger_out_i_3_n_0),
        .I1(state[0]),
        .I2(state[1]),
        .I3(trigger_in),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h38)) 
    \FSM_sequential_state[1]_i_2 
       (.I0(trigger_in),
        .I1(state[1]),
        .I2(state[0]),
        .O(\FSM_sequential_state[1]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "state_trigger:01,state_cleanup:10,state_wait_trigger:00,iSTATE:11" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(clk),
        .CE(\FSM_sequential_state[1]_i_1_n_0 ),
        .CLR(trigger_out_i_2_n_0),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state[0]));
  (* FSM_ENCODED_STATES = "state_trigger:01,state_cleanup:10,state_wait_trigger:00,iSTATE:11" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clk),
        .CE(\FSM_sequential_state[1]_i_1_n_0 ),
        .CLR(trigger_out_i_2_n_0),
        .D(\FSM_sequential_state[1]_i_2_n_0 ),
        .Q(state[1]));
  LUT2 #(
    .INIT(4'h2)) 
    \count[0]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .O(count));
  LUT2 #(
    .INIT(4'h8)) 
    \count[0]_i_10 
       (.I0(count_reg[1]),
        .I1(trigger_out_i_3_n_0),
        .O(\count[0]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h4)) 
    \count[0]_i_11 
       (.I0(count_reg[0]),
        .I1(trigger_out_i_3_n_0),
        .O(\count[0]_i_11_n_0 ));
  LUT3 #(
    .INIT(8'h0D)) 
    \count[0]_i_3 
       (.I0(trigger_out_i_4_n_0),
        .I1(trigger_out_i_5_n_0),
        .I2(count_reg[11]),
        .O(\count[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \count[0]_i_4 
       (.I0(count_reg[7]),
        .I1(trigger_out_i_3_n_0),
        .O(\count[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \count[0]_i_5 
       (.I0(count_reg[6]),
        .I1(trigger_out_i_3_n_0),
        .O(\count[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \count[0]_i_6 
       (.I0(count_reg[5]),
        .I1(trigger_out_i_3_n_0),
        .O(\count[0]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \count[0]_i_7 
       (.I0(count_reg[4]),
        .I1(trigger_out_i_3_n_0),
        .O(\count[0]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \count[0]_i_8 
       (.I0(count_reg[3]),
        .I1(trigger_out_i_3_n_0),
        .O(\count[0]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \count[0]_i_9 
       (.I0(count_reg[2]),
        .I1(trigger_out_i_3_n_0),
        .O(\count[0]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \count[8]_i_2 
       (.I0(count_reg[10]),
        .I1(trigger_out_i_3_n_0),
        .O(\count[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \count[8]_i_3 
       (.I0(count_reg[9]),
        .I1(trigger_out_i_3_n_0),
        .O(\count[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \count[8]_i_4 
       (.I0(count_reg[8]),
        .I1(trigger_out_i_3_n_0),
        .O(\count[8]_i_4_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(clk),
        .CE(count),
        .CLR(trigger_out_i_2_n_0),
        .D(\count_reg[0]_i_2_n_15 ),
        .Q(count_reg[0]));
  CARRY8 \count_reg[0]_i_2 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\count_reg[0]_i_2_n_0 ,\count_reg[0]_i_2_n_1 ,\count_reg[0]_i_2_n_2 ,\count_reg[0]_i_2_n_3 ,\count_reg[0]_i_2_n_4 ,\count_reg[0]_i_2_n_5 ,\count_reg[0]_i_2_n_6 ,\count_reg[0]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\count[0]_i_3_n_0 }),
        .O({\count_reg[0]_i_2_n_8 ,\count_reg[0]_i_2_n_9 ,\count_reg[0]_i_2_n_10 ,\count_reg[0]_i_2_n_11 ,\count_reg[0]_i_2_n_12 ,\count_reg[0]_i_2_n_13 ,\count_reg[0]_i_2_n_14 ,\count_reg[0]_i_2_n_15 }),
        .S({\count[0]_i_4_n_0 ,\count[0]_i_5_n_0 ,\count[0]_i_6_n_0 ,\count[0]_i_7_n_0 ,\count[0]_i_8_n_0 ,\count[0]_i_9_n_0 ,\count[0]_i_10_n_0 ,\count[0]_i_11_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[10] 
       (.C(clk),
        .CE(count),
        .CLR(trigger_out_i_2_n_0),
        .D(\count_reg[8]_i_1_n_13 ),
        .Q(count_reg[10]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[11] 
       (.C(clk),
        .CE(count),
        .CLR(trigger_out_i_2_n_0),
        .D(\count_reg[8]_i_1_n_4 ),
        .Q(count_reg[11]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(clk),
        .CE(count),
        .CLR(trigger_out_i_2_n_0),
        .D(\count_reg[0]_i_2_n_14 ),
        .Q(count_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(clk),
        .CE(count),
        .CLR(trigger_out_i_2_n_0),
        .D(\count_reg[0]_i_2_n_13 ),
        .Q(count_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(clk),
        .CE(count),
        .CLR(trigger_out_i_2_n_0),
        .D(\count_reg[0]_i_2_n_12 ),
        .Q(count_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[4] 
       (.C(clk),
        .CE(count),
        .CLR(trigger_out_i_2_n_0),
        .D(\count_reg[0]_i_2_n_11 ),
        .Q(count_reg[4]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[5] 
       (.C(clk),
        .CE(count),
        .CLR(trigger_out_i_2_n_0),
        .D(\count_reg[0]_i_2_n_10 ),
        .Q(count_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[6] 
       (.C(clk),
        .CE(count),
        .CLR(trigger_out_i_2_n_0),
        .D(\count_reg[0]_i_2_n_9 ),
        .Q(count_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[7] 
       (.C(clk),
        .CE(count),
        .CLR(trigger_out_i_2_n_0),
        .D(\count_reg[0]_i_2_n_8 ),
        .Q(count_reg[7]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[8] 
       (.C(clk),
        .CE(count),
        .CLR(trigger_out_i_2_n_0),
        .D(\count_reg[8]_i_1_n_15 ),
        .Q(count_reg[8]));
  CARRY8 \count_reg[8]_i_1 
       (.CI(\count_reg[0]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_count_reg[8]_i_1_CO_UNCONNECTED [7:4],\count_reg[8]_i_1_n_4 ,\NLW_count_reg[8]_i_1_CO_UNCONNECTED [2],\count_reg[8]_i_1_n_6 ,\count_reg[8]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_count_reg[8]_i_1_O_UNCONNECTED [7:3],\count_reg[8]_i_1_n_13 ,\count_reg[8]_i_1_n_14 ,\count_reg[8]_i_1_n_15 }),
        .S({1'b0,1'b0,1'b0,1'b0,1'b1,\count[8]_i_2_n_0 ,\count[8]_i_3_n_0 ,\count[8]_i_4_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[9] 
       (.C(clk),
        .CE(count),
        .CLR(trigger_out_i_2_n_0),
        .D(\count_reg[8]_i_1_n_14 ),
        .Q(count_reg[9]));
  LUT5 #(
    .INIT(32'hEEFF0030)) 
    trigger_out_i_1
       (.I0(trigger_out_i_3_n_0),
        .I1(state[1]),
        .I2(trigger_in),
        .I3(state[0]),
        .I4(trigger_out),
        .O(trigger_out_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    trigger_out_i_2
       (.I0(reset),
        .O(trigger_out_i_2_n_0));
  LUT3 #(
    .INIT(8'h0D)) 
    trigger_out_i_3
       (.I0(trigger_out_i_4_n_0),
        .I1(trigger_out_i_5_n_0),
        .I2(count_reg[11]),
        .O(trigger_out_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFEAAAAAAAA)) 
    trigger_out_i_4
       (.I0(count_reg[5]),
        .I1(count_reg[2]),
        .I2(count_reg[3]),
        .I3(count_reg[0]),
        .I4(count_reg[1]),
        .I5(count_reg[4]),
        .O(trigger_out_i_4_n_0));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    trigger_out_i_5
       (.I0(count_reg[8]),
        .I1(count_reg[10]),
        .I2(count_reg[9]),
        .I3(count_reg[6]),
        .I4(count_reg[7]),
        .O(trigger_out_i_5_n_0));
  FDCE #(
    .INIT(1'b0)) 
    trigger_out_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(trigger_out_i_2_n_0),
        .D(trigger_out_i_1_n_0),
        .Q(trigger_out));
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
