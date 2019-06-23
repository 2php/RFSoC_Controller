// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Fri Jun 21 11:56:36 2019
// Host        : DESKTOP-6ILET8A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ top_level_gpio_split_0_0_sim_netlist.v
// Design      : top_level_gpio_split_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu29dr-ffvf1760-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "top_level_gpio_split_0_0,gpio_split,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "gpio_split,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (gpio_in,
    arm,
    fire,
    wave_reg_sclk,
    wave_reg_pclk,
    wave_reg_data_in,
    wave_reg_cycle,
    delay_reg_sclk,
    delay_reg_data_in,
    idle_reg_sclk,
    idle_reg_data_in,
    a_tv,
    dummy_reset,
    dummy_microblaze_reset);
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 dummy_reset RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dummy_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) output dummy_reset;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 dummy_microblaze_reset RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dummy_microblaze_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) output dummy_microblaze_reset;

  wire \<const0> ;
  wire \<const1> ;
  wire [15:0]gpio_in;

  assign a_tv = gpio_in[10];
  assign arm = gpio_in[0];
  assign delay_reg_data_in = gpio_in[7];
  assign delay_reg_sclk = gpio_in[6];
  assign dummy_microblaze_reset = \<const0> ;
  assign dummy_reset = \<const1> ;
  assign fire = gpio_in[1];
  assign idle_reg_data_in = gpio_in[9];
  assign idle_reg_sclk = gpio_in[8];
  assign wave_reg_cycle = gpio_in[5];
  assign wave_reg_data_in = gpio_in[4];
  assign wave_reg_pclk = gpio_in[3];
  assign wave_reg_sclk = gpio_in[2];
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
