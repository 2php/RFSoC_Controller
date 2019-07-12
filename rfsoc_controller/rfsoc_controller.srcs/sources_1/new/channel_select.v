`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2019 06:16:40 PM
// Design Name: 
// Module Name: locking_sr
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


module channel_select
#(
parameter sclk = 9,
parameter sdata = 4
)
(
    input wire rf_clk,
    input wire rf_reset,
    input wire [15:0] gpio_in,
    output wire ch0,
    output wire ch1,
    output wire ch2,
    output wire ch3

    );
    
    wire [15:0] locking_select;
    shift_register #(16) sr(.clk(rf_clk), .sclk(gpio_in[sclk]), .reset(rf_reset), .data_in(gpio_in[sdata]), .data_out(locking_select));
     
    assign ch0 = locking_select[0];
    assign ch1 = locking_select[1];
    assign ch2 = locking_select[2];
    assign ch3 = locking_select[3];
    
endmodule
