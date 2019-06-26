`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2019 01:08:31 PM
// Design Name: 
// Module Name: axis_tready_slice
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


module axis_tready_slice(
    input wire s_axis_tvalid,
    output wire s_axis_tready,
    input wire [255:0] s_axis_tdata,
    input wire s_axis_tlast,
    
    
    input wire [2:0] gpio_in,
    //input wire ext_trigger,
    
    
    output wire [255:0] m_axis_tdata,
    output wire m_axis_tvalid,
    input wire m_axis_tready    
    );
    
    assign m_axis_tvalid = gpio_in[0];
    assign s_axis_tready = gpio_in[1];
    assign m_axis_tdata = s_axis_tdata;
    
    
endmodule
