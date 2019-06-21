//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_04f1_wrapper.bd
//Design : bd_04f1_wrapper
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_04f1_wrapper
   (Clk,
    GPIO1_tri_o,
    GPIO2_tri_o,
    Reset,
    UART_rxd,
    UART_txd);
  input Clk;
  output [15:0]GPIO1_tri_o;
  output [7:0]GPIO2_tri_o;
  input Reset;
  input UART_rxd;
  output UART_txd;

  wire Clk;
  wire [15:0]GPIO1_tri_o;
  wire [7:0]GPIO2_tri_o;
  wire Reset;
  wire UART_rxd;
  wire UART_txd;

  bd_04f1 bd_04f1_i
       (.Clk(Clk),
        .GPIO1_tri_o(GPIO1_tri_o),
        .GPIO2_tri_o(GPIO2_tri_o),
        .Reset(Reset),
        .UART_rxd(UART_rxd),
        .UART_txd(UART_txd));
endmodule
