`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2019 10:13:40 AM
// Design Name: 
// Module Name: pipeline_active_buffer
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


module pipeline_active_buffer(

    input wire active_in,
    output wire active_out,

    input wire s_axis_tvalid,
    output wire s_axis_tready,
    input wire [7:0] s_axis_tdata,
    
    output wire [7:0] m_axis_tdata,
    output wire m_axis_tvalid,
    input wire m_axis_tready

    );
    
    
    assign s_axis_tready = 1'b1;
    assign m_axis_tvalid = 1'b1;
    
    assign m_axis_tdata[0] = active_in;
    assign active_out = s_axis_tdata[0];
    
endmodule
