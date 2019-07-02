// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Tue Jul  2 14:13:39 2019
// Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_count_buffer_0_0_sim_netlist.v
// Design      : top_level_count_buffer_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_count_buffer
   (gpio_out,
    s_axis_tready,
    m_axis_tvalid,
    m_axis_tdata,
    s_axis_tdata,
    gpio_in,
    s_axis_tvalid,
    m_axis_tready);
  output [31:0]gpio_out;
  output s_axis_tready;
  output m_axis_tvalid;
  output [31:0]m_axis_tdata;
  input [31:0]s_axis_tdata;
  input [31:0]gpio_in;
  input s_axis_tvalid;
  input m_axis_tready;

  (* DONT_TOUCH *) wire [31:0]gpio_in;
  (* DONT_TOUCH *) wire m_axis_tready;
  (* DONT_TOUCH *) wire m_axis_tvalid;
  (* DONT_TOUCH *) wire [31:0]s_axis_tdata;
  (* DONT_TOUCH *) wire s_axis_tready;
  (* DONT_TOUCH *) wire s_axis_tvalid;

  assign gpio_out[31:0] = s_axis_tdata;
  assign m_axis_tdata[31:0] = gpio_in;
  LUT1 #(
    .INIT(2'h2)) 
    insti_0
       (.I0(1'b1),
        .O(s_axis_tready));
  LUT1 #(
    .INIT(2'h2)) 
    insti_1
       (.I0(1'b1),
        .O(m_axis_tvalid));
endmodule

(* CHECK_LICENSE_TYPE = "top_level_count_buffer_0_0,count_buffer,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "count_buffer,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (gpio_in,
    gpio_out,
    s_axis_clk,
    s_axis_resetn,
    m_axis_clk,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tvalid,
    m_axis_tready,
    m_axis_tvalid,
    m_axis_tdata);
  input [31:0]gpio_in;
  output [31:0]gpio_out;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axis_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_clk, ASSOCIATED_BUSIF s_axis, ASSOCIATED_RESET s_axis_resetn, FREQ_HZ 250000000, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, INSERT_VIP 0" *) input s_axis_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_axis_resetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_axis_resetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m_axis_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_clk, ASSOCIATED_BUSIF m_axis, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN top_level_clk_wiz_1_0_clk_out1, INSERT_VIP 0" *) input m_axis_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TREADY" *) output s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA" *) (* dont_touch = "true" *) input [31:0]s_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 250000000, PHASE 0.000, CLK_DOMAIN top_level_usp_rf_data_converter_0_0_clk_dac0, LAYERED_METADATA undef, INSERT_VIP 0" *) (* dont_touch = "true" *) input s_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TREADY" *) (* dont_touch = "true" *) input m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TVALID" *) output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN top_level_clk_wiz_1_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *) output [31:0]m_axis_tdata;

  wire [31:0]gpio_in;
  wire [31:0]gpio_out;
  wire [31:0]m_axis_tdata;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire [31:0]s_axis_tdata;
  wire s_axis_tready;
  wire s_axis_tvalid;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_count_buffer inst
       (.gpio_in(gpio_in),
        .gpio_out(gpio_out),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
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
