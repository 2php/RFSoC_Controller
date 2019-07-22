`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2019 03:20:04 PM
// Design Name: 
// Module Name: gpio_buffer
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


module gpio_and_select_buffer(

    input wire [15:0] gpio_in,
    output wire [15:0] gpio_out,
    input wire select_in,
    output wire select_out,
    input wire ext_trigger_in,
    output wire ext_trigger_out,

    input wire s_axis_tvalid,
    output wire s_axis_tready,
    input wire [31:0] s_axis_tdata,
    
    output wire [31:0] m_axis_tdata,
    output wire m_axis_tvalid,
    input wire m_axis_tready 
    
    );
    
    
    assign s_axis_tready = 1'b1;
    assign m_axis_tvalid = 1'b1;
    
    assign m_axis_tdata[15:0] = gpio_in;
    assign gpio_out = s_axis_tdata[15:0];
    
    assign m_axis_tdata[17] = select_in;
    assign select_out = s_axis_tdata[17];
    
    assign m_axis_tdata[18] = ext_trigger_in;
    assign ext_trigger_out = s_axis_tdata[18]; 
    
endmodule
