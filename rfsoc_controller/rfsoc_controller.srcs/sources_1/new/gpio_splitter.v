`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2019 10:26:00 AM
// Design Name: 
// Module Name: gpio_splitter
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


module gpio_splitter(
    
    input [15:0] gpio_in,
    output [7:0] led_out,
    output [7:0] controll_out
    );
    
    assign led_out = gpio_in[15:8];
    assign controll_out = gpio_in[7:0];
endmodule
