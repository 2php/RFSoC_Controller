// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Sat Jun 22 14:26:25 2019
// Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/james/fpga_projects/microblaze_axi_test/microblaze_axi_test.srcs/sources_1/bd/top_level/ip/top_level_dummy_controller_0_0/top_level_dummy_controller_0_0_sim_netlist.v
// Design      : top_level_dummy_controller_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "top_level_dummy_controller_0_0,dummy_controller,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "dummy_controller,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module top_level_dummy_controller_0_0
   (dummy_data,
    t_valid,
    t_ready,
    reset);
  output [255:0]dummy_data;
  output t_valid;
  input t_ready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) output reset;

  wire \<const0> ;
  wire \<const1> ;

  assign dummy_data[255] = \<const1> ;
  assign dummy_data[254] = \<const0> ;
  assign dummy_data[253] = \<const0> ;
  assign dummy_data[252] = \<const0> ;
  assign dummy_data[251] = \<const0> ;
  assign dummy_data[250] = \<const0> ;
  assign dummy_data[249] = \<const0> ;
  assign dummy_data[248] = \<const1> ;
  assign dummy_data[247] = \<const1> ;
  assign dummy_data[246] = \<const0> ;
  assign dummy_data[245] = \<const1> ;
  assign dummy_data[244] = \<const1> ;
  assign dummy_data[243] = \<const0> ;
  assign dummy_data[242] = \<const1> ;
  assign dummy_data[241] = \<const0> ;
  assign dummy_data[240] = \<const1> ;
  assign dummy_data[239] = \<const0> ;
  assign dummy_data[238] = \<const0> ;
  assign dummy_data[237] = \<const0> ;
  assign dummy_data[236] = \<const0> ;
  assign dummy_data[235] = \<const0> ;
  assign dummy_data[234] = \<const1> ;
  assign dummy_data[233] = \<const0> ;
  assign dummy_data[232] = \<const1> ;
  assign dummy_data[231] = \<const0> ;
  assign dummy_data[230] = \<const0> ;
  assign dummy_data[229] = \<const0> ;
  assign dummy_data[228] = \<const1> ;
  assign dummy_data[227] = \<const1> ;
  assign dummy_data[226] = \<const1> ;
  assign dummy_data[225] = \<const1> ;
  assign dummy_data[224] = \<const0> ;
  assign dummy_data[223] = \<const1> ;
  assign dummy_data[222] = \<const1> ;
  assign dummy_data[221] = \<const0> ;
  assign dummy_data[220] = \<const0> ;
  assign dummy_data[219] = \<const1> ;
  assign dummy_data[218] = \<const0> ;
  assign dummy_data[217] = \<const0> ;
  assign dummy_data[216] = \<const0> ;
  assign dummy_data[215] = \<const0> ;
  assign dummy_data[214] = \<const0> ;
  assign dummy_data[213] = \<const1> ;
  assign dummy_data[212] = \<const1> ;
  assign dummy_data[211] = \<const0> ;
  assign dummy_data[210] = \<const0> ;
  assign dummy_data[209] = \<const1> ;
  assign dummy_data[208] = \<const0> ;
  assign dummy_data[207] = \<const0> ;
  assign dummy_data[206] = \<const0> ;
  assign dummy_data[205] = \<const0> ;
  assign dummy_data[204] = \<const0> ;
  assign dummy_data[203] = \<const0> ;
  assign dummy_data[202] = \<const0> ;
  assign dummy_data[201] = \<const0> ;
  assign dummy_data[200] = \<const0> ;
  assign dummy_data[199] = \<const0> ;
  assign dummy_data[198] = \<const0> ;
  assign dummy_data[197] = \<const0> ;
  assign dummy_data[196] = \<const0> ;
  assign dummy_data[195] = \<const0> ;
  assign dummy_data[194] = \<const0> ;
  assign dummy_data[193] = \<const0> ;
  assign dummy_data[192] = \<const0> ;
  assign dummy_data[191] = \<const0> ;
  assign dummy_data[190] = \<const0> ;
  assign dummy_data[189] = \<const0> ;
  assign dummy_data[188] = \<const1> ;
  assign dummy_data[187] = \<const1> ;
  assign dummy_data[186] = \<const1> ;
  assign dummy_data[185] = \<const1> ;
  assign dummy_data[184] = \<const0> ;
  assign dummy_data[183] = \<const1> ;
  assign dummy_data[182] = \<const1> ;
  assign dummy_data[181] = \<const0> ;
  assign dummy_data[180] = \<const0> ;
  assign dummy_data[179] = \<const1> ;
  assign dummy_data[178] = \<const0> ;
  assign dummy_data[177] = \<const0> ;
  assign dummy_data[176] = \<const0> ;
  assign dummy_data[175] = \<const0> ;
  assign dummy_data[174] = \<const0> ;
  assign dummy_data[173] = \<const1> ;
  assign dummy_data[172] = \<const1> ;
  assign dummy_data[171] = \<const0> ;
  assign dummy_data[170] = \<const0> ;
  assign dummy_data[169] = \<const0> ;
  assign dummy_data[168] = \<const1> ;
  assign dummy_data[167] = \<const1> ;
  assign dummy_data[166] = \<const0> ;
  assign dummy_data[165] = \<const1> ;
  assign dummy_data[164] = \<const1> ;
  assign dummy_data[163] = \<const0> ;
  assign dummy_data[162] = \<const1> ;
  assign dummy_data[161] = \<const0> ;
  assign dummy_data[160] = \<const1> ;
  assign dummy_data[159] = \<const0> ;
  assign dummy_data[158] = \<const0> ;
  assign dummy_data[157] = \<const0> ;
  assign dummy_data[156] = \<const0> ;
  assign dummy_data[155] = \<const0> ;
  assign dummy_data[154] = \<const1> ;
  assign dummy_data[153] = \<const0> ;
  assign dummy_data[152] = \<const1> ;
  assign dummy_data[151] = \<const0> ;
  assign dummy_data[150] = \<const0> ;
  assign dummy_data[149] = \<const0> ;
  assign dummy_data[148] = \<const1> ;
  assign dummy_data[147] = \<const0> ;
  assign dummy_data[146] = \<const1> ;
  assign dummy_data[145] = \<const1> ;
  assign dummy_data[144] = \<const0> ;
  assign dummy_data[143] = \<const0> ;
  assign dummy_data[142] = \<const0> ;
  assign dummy_data[141] = \<const0> ;
  assign dummy_data[140] = \<const1> ;
  assign dummy_data[139] = \<const1> ;
  assign dummy_data[138] = \<const1> ;
  assign dummy_data[137] = \<const1> ;
  assign dummy_data[136] = \<const1> ;
  assign dummy_data[135] = \<const1> ;
  assign dummy_data[134] = \<const0> ;
  assign dummy_data[133] = \<const0> ;
  assign dummy_data[132] = \<const0> ;
  assign dummy_data[131] = \<const0> ;
  assign dummy_data[130] = \<const0> ;
  assign dummy_data[129] = \<const0> ;
  assign dummy_data[128] = \<const1> ;
  assign dummy_data[127] = \<const0> ;
  assign dummy_data[126] = \<const0> ;
  assign dummy_data[125] = \<const0> ;
  assign dummy_data[124] = \<const0> ;
  assign dummy_data[123] = \<const0> ;
  assign dummy_data[122] = \<const0> ;
  assign dummy_data[121] = \<const0> ;
  assign dummy_data[120] = \<const0> ;
  assign dummy_data[119] = \<const0> ;
  assign dummy_data[118] = \<const0> ;
  assign dummy_data[117] = \<const0> ;
  assign dummy_data[116] = \<const0> ;
  assign dummy_data[115] = \<const0> ;
  assign dummy_data[114] = \<const0> ;
  assign dummy_data[113] = \<const0> ;
  assign dummy_data[112] = \<const0> ;
  assign dummy_data[111] = \<const1> ;
  assign dummy_data[110] = \<const0> ;
  assign dummy_data[109] = \<const0> ;
  assign dummy_data[108] = \<const1> ;
  assign dummy_data[107] = \<const1> ;
  assign dummy_data[106] = \<const1> ;
  assign dummy_data[105] = \<const1> ;
  assign dummy_data[104] = \<const0> ;
  assign dummy_data[103] = \<const0> ;
  assign dummy_data[102] = \<const0> ;
  assign dummy_data[101] = \<const0> ;
  assign dummy_data[100] = \<const0> ;
  assign dummy_data[99] = \<const1> ;
  assign dummy_data[98] = \<const0> ;
  assign dummy_data[97] = \<const0> ;
  assign dummy_data[96] = \<const0> ;
  assign dummy_data[95] = \<const0> ;
  assign dummy_data[94] = \<const1> ;
  assign dummy_data[93] = \<const0> ;
  assign dummy_data[92] = \<const0> ;
  assign dummy_data[91] = \<const1> ;
  assign dummy_data[90] = \<const0> ;
  assign dummy_data[89] = \<const1> ;
  assign dummy_data[88] = \<const0> ;
  assign dummy_data[87] = \<const1> ;
  assign dummy_data[86] = \<const1> ;
  assign dummy_data[85] = \<const1> ;
  assign dummy_data[84] = \<const1> ;
  assign dummy_data[83] = \<const1> ;
  assign dummy_data[82] = \<const0> ;
  assign dummy_data[81] = \<const1> ;
  assign dummy_data[80] = \<const1> ;
  assign dummy_data[79] = \<const0> ;
  assign dummy_data[78] = \<const0> ;
  assign dummy_data[77] = \<const0> ;
  assign dummy_data[76] = \<const1> ;
  assign dummy_data[75] = \<const0> ;
  assign dummy_data[74] = \<const0> ;
  assign dummy_data[73] = \<const1> ;
  assign dummy_data[72] = \<const1> ;
  assign dummy_data[71] = \<const0> ;
  assign dummy_data[70] = \<const1> ;
  assign dummy_data[69] = \<const1> ;
  assign dummy_data[68] = \<const1> ;
  assign dummy_data[67] = \<const1> ;
  assign dummy_data[66] = \<const1> ;
  assign dummy_data[65] = \<const0> ;
  assign dummy_data[64] = \<const1> ;
  assign dummy_data[63] = \<const0> ;
  assign dummy_data[62] = \<const0> ;
  assign dummy_data[61] = \<const0> ;
  assign dummy_data[60] = \<const0> ;
  assign dummy_data[59] = \<const0> ;
  assign dummy_data[58] = \<const0> ;
  assign dummy_data[57] = \<const0> ;
  assign dummy_data[56] = \<const0> ;
  assign dummy_data[55] = \<const0> ;
  assign dummy_data[54] = \<const0> ;
  assign dummy_data[53] = \<const0> ;
  assign dummy_data[52] = \<const0> ;
  assign dummy_data[51] = \<const0> ;
  assign dummy_data[50] = \<const0> ;
  assign dummy_data[49] = \<const0> ;
  assign dummy_data[48] = \<const0> ;
  assign dummy_data[47] = \<const0> ;
  assign dummy_data[46] = \<const0> ;
  assign dummy_data[45] = \<const0> ;
  assign dummy_data[44] = \<const1> ;
  assign dummy_data[43] = \<const0> ;
  assign dummy_data[42] = \<const0> ;
  assign dummy_data[41] = \<const1> ;
  assign dummy_data[40] = \<const1> ;
  assign dummy_data[39] = \<const0> ;
  assign dummy_data[38] = \<const1> ;
  assign dummy_data[37] = \<const1> ;
  assign dummy_data[36] = \<const1> ;
  assign dummy_data[35] = \<const1> ;
  assign dummy_data[34] = \<const1> ;
  assign dummy_data[33] = \<const0> ;
  assign dummy_data[32] = \<const1> ;
  assign dummy_data[31] = \<const0> ;
  assign dummy_data[30] = \<const1> ;
  assign dummy_data[29] = \<const0> ;
  assign dummy_data[28] = \<const0> ;
  assign dummy_data[27] = \<const1> ;
  assign dummy_data[26] = \<const0> ;
  assign dummy_data[25] = \<const1> ;
  assign dummy_data[24] = \<const0> ;
  assign dummy_data[23] = \<const1> ;
  assign dummy_data[22] = \<const1> ;
  assign dummy_data[21] = \<const1> ;
  assign dummy_data[20] = \<const1> ;
  assign dummy_data[19] = \<const1> ;
  assign dummy_data[18] = \<const0> ;
  assign dummy_data[17] = \<const1> ;
  assign dummy_data[16] = \<const1> ;
  assign dummy_data[15] = \<const1> ;
  assign dummy_data[14] = \<const0> ;
  assign dummy_data[13] = \<const0> ;
  assign dummy_data[12] = \<const1> ;
  assign dummy_data[11] = \<const1> ;
  assign dummy_data[10] = \<const1> ;
  assign dummy_data[9] = \<const1> ;
  assign dummy_data[8] = \<const0> ;
  assign dummy_data[7] = \<const0> ;
  assign dummy_data[6] = \<const0> ;
  assign dummy_data[5] = \<const0> ;
  assign dummy_data[4] = \<const0> ;
  assign dummy_data[3] = \<const1> ;
  assign dummy_data[2] = \<const0> ;
  assign dummy_data[1] = \<const0> ;
  assign dummy_data[0] = \<const0> ;
  assign reset = \<const1> ;
  assign t_valid = \<const1> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
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
