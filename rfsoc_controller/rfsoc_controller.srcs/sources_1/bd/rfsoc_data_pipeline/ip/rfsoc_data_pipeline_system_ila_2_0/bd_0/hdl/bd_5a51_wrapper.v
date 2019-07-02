//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_5a51_wrapper.bd
//Design : bd_5a51_wrapper
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_5a51_wrapper
   (clk,
    probe0);
  input clk;
  input [7:0]probe0;

  wire clk;
  wire [7:0]probe0;

  bd_5a51 bd_5a51_i
       (.clk(clk),
        .probe0(probe0));
endmodule
