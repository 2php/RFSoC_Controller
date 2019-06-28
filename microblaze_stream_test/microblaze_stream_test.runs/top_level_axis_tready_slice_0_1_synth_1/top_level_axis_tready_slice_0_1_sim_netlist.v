// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Thu Jun 27 17:11:46 2019
// Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_axis_tready_slice_0_1_sim_netlist.v
// Design      : top_level_axis_tready_slice_0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_tready_slice
   (s_axis_tready,
    m_axis_tvalid,
    clk,
    gpio_in,
    reset,
    ext_trigger);
  output s_axis_tready;
  output m_axis_tvalid;
  input clk;
  input [1:0]gpio_in;
  input reset;
  input ext_trigger;

  wire clk;
  wire ext_trigger;
  wire [1:0]gpio_in;
  wire m_axis_tvalid;
  wire reset;
  wire s_axis_tready;
  wire s_axis_tready_i_1_n_0;
  wire s_axis_tready_i_2_n_0;

  FDPE m_axis_tvalid_reg
       (.C(clk),
        .CE(1'b1),
        .D(gpio_in[0]),
        .PRE(s_axis_tready_i_2_n_0),
        .Q(m_axis_tvalid));
  LUT2 #(
    .INIT(4'hE)) 
    s_axis_tready_i_1
       (.I0(gpio_in[1]),
        .I1(ext_trigger),
        .O(s_axis_tready_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    s_axis_tready_i_2
       (.I0(reset),
        .O(s_axis_tready_i_2_n_0));
  FDCE s_axis_tready_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(s_axis_tready_i_2_n_0),
        .D(s_axis_tready_i_1_n_0),
        .Q(s_axis_tready));
endmodule

(* CHECK_LICENSE_TYPE = "top_level_axis_tready_slice_0_1,axis_tready_slice,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "axis_tready_slice,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    reset,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tlast,
    gpio_in,
    ext_trigger,
    m_axis_tdata,
    m_axis_tvalid,
    m_axis_tready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF m_axis:s_axis, ASSOCIATED_RESET reset, FREQ_HZ 250000000, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_1_clk_dac0, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input reset;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *) input s_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TREADY" *) output s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA" *) input [255:0]s_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TLAST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 250000000, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_1_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *) input s_axis_tlast;
  input [2:0]gpio_in;
  input ext_trigger;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TDATA" *) output [255:0]m_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TVALID" *) output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 250000000, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_1_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *) input m_axis_tready;

  wire clk;
  wire ext_trigger;
  wire [2:0]gpio_in;
  wire m_axis_tvalid;
  wire reset;
  wire [255:0]s_axis_tdata;
  wire s_axis_tready;

  assign m_axis_tdata[255:0] = s_axis_tdata;
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_tready_slice inst
       (.clk(clk),
        .ext_trigger(ext_trigger),
        .gpio_in(gpio_in[1:0]),
        .m_axis_tvalid(m_axis_tvalid),
        .reset(reset),
        .s_axis_tready(s_axis_tready));
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
