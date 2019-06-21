`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2019 08:14:40 PM
// Design Name: 
// Module Name: logic_blocks
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


module logic_blocks(
input wire nanda,
input wire nandb,
output wire nand_out
    );
    
    assign nand1_out = !(nanda & nandb);
endmodule
