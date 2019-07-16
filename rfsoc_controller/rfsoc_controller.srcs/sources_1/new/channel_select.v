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
    input wire mb_clk,
    input wire mb_reset,
    input wire [15:0] gpio_in,
    output wire ch0,
    output wire ch1,
    output wire ch2,
    output wire ch3,
    output wire ch4,
    output wire ch5,
    output wire ch6,
    output wire ch7,
    output wire ch8,
    output wire ch9,
    output wire ch10,
    output wire ch11,
    output wire ch12,
    output wire ch13,
    output wire ch14,
    output wire ch15

    );
    
    wire [15:0] locking_select;
    shift_register #(16) sr(.clk(mb_clk), .sclk(gpio_in[sclk]), .reset(mb_reset), .data_in(gpio_in[sdata]), .data_out(locking_select));
     
    assign ch0 = locking_select[0];
    assign ch1 = locking_select[1];
    assign ch2 = locking_select[2];
    assign ch3 = locking_select[3];
    assign ch4 = locking_select[4];
    assign ch5 = locking_select[5];
    assign ch6 = locking_select[6];
    assign ch7 = locking_select[7];
    assign ch8 = locking_select[8];
    assign ch9 = locking_select[9];
    assign ch10 = locking_select[10];
    assign ch11 = locking_select[11];
    assign ch12 = locking_select[12];
    assign ch13 = locking_select[13];
    assign ch14 = locking_select[14];
    assign ch15 = locking_select[15];
    
    
endmodule
