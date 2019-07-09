// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Tue Jul  9 15:17:23 2019
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
    pipeline_active_in_0,
    pipeline_active_in_1,
    pipeline_active_in_2,
    pipeline_active_in_3,
    trigger_out);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 250000000, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input reset;
  input trigger_in;
  input pipeline_active_in_0;
  input pipeline_active_in_1;
  input pipeline_active_in_2;
  input pipeline_active_in_3;
  output trigger_out;

  wire clk;
  wire pipeline_active_in_0;
  wire pipeline_active_in_1;
  wire pipeline_active_in_2;
  wire pipeline_active_in_3;
  wire reset;
  wire trigger_in;
  wire trigger_out;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_trigger_buffer inst
       (.clk(clk),
        .pipeline_active_in_0(pipeline_active_in_0),
        .pipeline_active_in_1(pipeline_active_in_1),
        .pipeline_active_in_2(pipeline_active_in_2),
        .pipeline_active_in_3(pipeline_active_in_3),
        .reset(reset),
        .trigger_in(trigger_in),
        .trigger_out(trigger_out));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_trigger_buffer
   (trigger_out,
    clk,
    trigger_in,
    pipeline_active_in_2,
    pipeline_active_in_3,
    pipeline_active_in_1,
    pipeline_active_in_0,
    reset);
  output trigger_out;
  input clk;
  input trigger_in;
  input pipeline_active_in_2;
  input pipeline_active_in_3;
  input pipeline_active_in_1;
  input pipeline_active_in_0;
  input reset;

  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_2_n_0 ;
  wire \FSM_onehot_state[2]_i_3_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[2] ;
  wire clk;
  wire count;
  wire \count[0]_i_2_n_0 ;
  wire \count[0]_i_3_n_0 ;
  wire \count[0]_i_4_n_0 ;
  wire \count[0]_i_5_n_0 ;
  wire [3:1]count_reg;
  wire \count_reg[0]_i_1_n_13 ;
  wire \count_reg[0]_i_1_n_14 ;
  wire \count_reg[0]_i_1_n_15 ;
  wire \count_reg[0]_i_1_n_4 ;
  wire \count_reg[0]_i_1_n_6 ;
  wire \count_reg[0]_i_1_n_7 ;
  wire \count_reg_n_0_[0] ;
  wire pipeline_active_in_0;
  wire pipeline_active_in_1;
  wire pipeline_active_in_2;
  wire pipeline_active_in_3;
  wire reset;
  wire trigger_in;
  wire trigger_out;
  wire trigger_out_i_1_n_0;
  wire trigger_out_i_2_n_0;
  wire trigger_out_i_3_n_0;
  wire [7:2]\NLW_count_reg[0]_i_1_CO_UNCONNECTED ;
  wire [7:3]\NLW_count_reg[0]_i_1_O_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hF2FFF22222222222)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(count),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .I3(trigger_in),
        .I4(\FSM_onehot_state_reg_n_0_[2] ),
        .I5(\FSM_onehot_state[2]_i_3_n_0 ),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h15)) 
    \FSM_onehot_state[2]_i_2 
       (.I0(count_reg[3]),
        .I1(count_reg[2]),
        .I2(count_reg[1]),
        .O(\FSM_onehot_state[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_onehot_state[2]_i_3 
       (.I0(pipeline_active_in_0),
        .I1(pipeline_active_in_1),
        .I2(pipeline_active_in_3),
        .I3(pipeline_active_in_2),
        .O(\FSM_onehot_state[2]_i_3_n_0 ));
  (* FSM_ENCODED_STATES = "state_wait_trigger:001,state_trigger:010,state_cleanup:100," *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(clk),
        .CE(\FSM_onehot_state[2]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[2] ),
        .PRE(trigger_out_i_2_n_0),
        .Q(\FSM_onehot_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "state_wait_trigger:001,state_trigger:010,state_cleanup:100," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(clk),
        .CE(\FSM_onehot_state[2]_i_1_n_0 ),
        .CLR(trigger_out_i_2_n_0),
        .D(\FSM_onehot_state_reg_n_0_[0] ),
        .Q(count));
  (* FSM_ENCODED_STATES = "state_wait_trigger:001,state_trigger:010,state_cleanup:100," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(clk),
        .CE(\FSM_onehot_state[2]_i_1_n_0 ),
        .CLR(trigger_out_i_2_n_0),
        .D(count),
        .Q(\FSM_onehot_state_reg_n_0_[2] ));
  LUT3 #(
    .INIT(8'h15)) 
    \count[0]_i_2 
       (.I0(count_reg[3]),
        .I1(count_reg[2]),
        .I2(count_reg[1]),
        .O(\count[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \count[0]_i_3 
       (.I0(count_reg[1]),
        .I1(count_reg[2]),
        .I2(count_reg[3]),
        .O(\count[0]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \count[0]_i_4 
       (.I0(count_reg[1]),
        .I1(count_reg[2]),
        .I2(count_reg[3]),
        .O(\count[0]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0015)) 
    \count[0]_i_5 
       (.I0(\count_reg_n_0_[0] ),
        .I1(count_reg[1]),
        .I2(count_reg[2]),
        .I3(count_reg[3]),
        .O(\count[0]_i_5_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(clk),
        .CE(count),
        .CLR(trigger_out_i_2_n_0),
        .D(\count_reg[0]_i_1_n_15 ),
        .Q(\count_reg_n_0_[0] ));
  CARRY8 \count_reg[0]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\NLW_count_reg[0]_i_1_CO_UNCONNECTED [7:4],\count_reg[0]_i_1_n_4 ,\NLW_count_reg[0]_i_1_CO_UNCONNECTED [2],\count_reg[0]_i_1_n_6 ,\count_reg[0]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\count[0]_i_2_n_0 }),
        .O({\NLW_count_reg[0]_i_1_O_UNCONNECTED [7:3],\count_reg[0]_i_1_n_13 ,\count_reg[0]_i_1_n_14 ,\count_reg[0]_i_1_n_15 }),
        .S({1'b0,1'b0,1'b0,1'b0,1'b1,\count[0]_i_3_n_0 ,\count[0]_i_4_n_0 ,\count[0]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(clk),
        .CE(count),
        .CLR(trigger_out_i_2_n_0),
        .D(\count_reg[0]_i_1_n_14 ),
        .Q(count_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(clk),
        .CE(count),
        .CLR(trigger_out_i_2_n_0),
        .D(\count_reg[0]_i_1_n_13 ),
        .Q(count_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(clk),
        .CE(count),
        .CLR(trigger_out_i_2_n_0),
        .D(\count_reg[0]_i_1_n_4 ),
        .Q(count_reg[3]));
  LUT6 #(
    .INIT(64'hABBBFFFFAAAAAAAA)) 
    trigger_out_i_1
       (.I0(trigger_out_i_3_n_0),
        .I1(count_reg[3]),
        .I2(count_reg[2]),
        .I3(count_reg[1]),
        .I4(count),
        .I5(trigger_out),
        .O(trigger_out_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    trigger_out_i_2
       (.I0(reset),
        .O(trigger_out_i_2_n_0));
  LUT6 #(
    .INIT(64'h0001000000000000)) 
    trigger_out_i_3
       (.I0(pipeline_active_in_2),
        .I1(pipeline_active_in_3),
        .I2(pipeline_active_in_1),
        .I3(pipeline_active_in_0),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .I5(trigger_in),
        .O(trigger_out_i_3_n_0));
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
