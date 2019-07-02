`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2019 06:44:55 PM
// Design Name: 
// Module Name: sr_gpio_breakout
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


module sr_gpio_breakout
#(
parameter sclk_bit = 3,//Used for loading in clock cycles
parameter sdata_bit = 4
)
(
    input wire [7:0] gpio_in,
    output wire sclk,
    output wire sdata
    );
    
    assign sclk = gpio_in[sclk_bit];
    assign sdata = gpio_in[sdata_bit];
    
    
endmodule
