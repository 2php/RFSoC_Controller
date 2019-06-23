`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2019 08:56:12 PM
// Design Name: 
// Module Name: reg_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module reg_module
#(
	parameter width = 256,
	parameter depth = 1000
)
(
  input wire s_clk,//Clock for driving the shift register
  input wire p_clk,//Clock for driving the parallel register chain
  input wire pll_clk,//Incomming clock from PLL
  input wire fire,//When 1, clock from PLL is used to drive registers
  input wire idle,//When 1, outputs to RF default to idle pattern
  input wire reset,//global reset
  input wire s_data_in,//data input to shift register
  output wire s_data_out,//data output to next module
  input wire cycle,//If 1, data from last register cycles back to first register
  input wire [width-1:0] idle_pattern,//Idle pattern to be displayed on DACs when module is in idle mode
  output wire [width-1:0] data_out
);

wire p_clk_int;//Wire for distributing the internal parallel clock

wire [width-1:0] chain_input;
wire [width-1:0] chain_output;
wire [width-1:0] wire_matrix [0:depth-2];
//Generating the register chain
genvar i;
for(i = 0; i < depth; i=i+1)begin:chain
    //If we're on the first register
    if(i == 0)begin
        register #(width) r(p_clk_int, reset, chain_input, wire_matrix[0]);
    end
    //If we're on the last register
    else if(i == depth - 1)begin
        register #(width) r(p_clk_int, reset, wire_matrix[i-1], chain_output);
    end
    else begin
        register #(width) r(p_clk_int, reset, wire_matrix[i-1], wire_matrix[i]);
    end    

end

wire [width-1:0] shift_reg_output;
//connecting our proramming register to the input
shift_register #(width) sr (s_clk, reset, s_data_in, s_data_out, shift_reg_output);
//Connecting chain to output
assign data_out = idle ? idle_pattern : chain_output; 

//Assignment for cycle behavior
assign chain_input = cycle ? chain_output : shift_reg_output;

//Assignment for clock
assign p_clk_int = fire ? pll_clk : p_clk;
    

endmodule
