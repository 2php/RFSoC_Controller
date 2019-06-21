//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_4f04_wrapper.bd
//Design : bd_4f04_wrapper
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_4f04_wrapper
   (Clk,
    GPIO1_tri_o,
    INTC_IRQ,
    Reset,
    UART_Interrupt,
    UART_rxd,
    UART_txd);
  input Clk;
  output [7:0]GPIO1_tri_o;
  output INTC_IRQ;
  input Reset;
  output UART_Interrupt;
  input UART_rxd;
  output UART_txd;

  wire Clk;
  wire [7:0]GPIO1_tri_o;
  wire INTC_IRQ;
  wire Reset;
  wire UART_Interrupt;
  wire UART_rxd;
  wire UART_txd;

  bd_4f04 bd_4f04_i
       (.Clk(Clk),
        .GPIO1_tri_o(GPIO1_tri_o),
        .INTC_IRQ(INTC_IRQ),
        .Reset(Reset),
        .UART_Interrupt(UART_Interrupt),
        .UART_rxd(UART_rxd),
        .UART_txd(UART_txd));
endmodule
