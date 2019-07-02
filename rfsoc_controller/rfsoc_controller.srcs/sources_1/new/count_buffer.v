`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2019 10:05:09 PM
// Design Name: 
// Module Name: count_buffer
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


module count_buffer(

    input wire [31:0] gpio_in,
    output wire [31:0] gpio_out,
    
    input wire s_axis_clk,
    input wire s_axis_resetn,
    input wire m_axis_clk,
    
    (* dont_touch = "true" *)output wire s_axis_tready,
    (* dont_touch = "true" *)input wire [31:0] s_axis_tdata,
    (* dont_touch = "true" *)input wire s_axis_tvalid,
    
    
    (* dont_touch = "true" *)input wire m_axis_tready,
    (* dont_touch = "true" *)output wire m_axis_tvalid,
    (* dont_touch = "true" *)output wire [31:0] m_axis_tdata
    );
    
    
    assign m_axis_tdata = gpio_in;
    assign m_axis_tvalid = 1'b1;
    assign s_axis_tready = 1'b1;
    assign gpio_out = s_axis_tdata; 
    
endmodule
