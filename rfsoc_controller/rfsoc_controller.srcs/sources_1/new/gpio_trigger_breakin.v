`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2019 05:16:35 PM
// Design Name: 
// Module Name: gpio_trigger_breakin
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


module gpio_trigger_breakin
#(
    parameter trigger_bit = 7
)
(
    input trigger_in,
    output [7:0] gpio_out
);
    
    assign gpio_out[trigger_bit] = trigger_in;
    
endmodule
