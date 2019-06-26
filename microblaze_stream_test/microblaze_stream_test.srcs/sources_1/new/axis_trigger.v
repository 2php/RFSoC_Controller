`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2019 09:25:49 AM
// Design Name: 
// Module Name: axis_trigger
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


module axis_trigger(
    input wire s_axis_tvalid,
    output wire s_axis_tready,
    input wire [255:0] s_axis_tdata,
    input wire [31:0] s_axis_tkeep,
    input wire s_axis_tlast,
    
    
    input wire [2:0] gpio_in,
    output wire rf_reset,
    //input wire ext_trigger,
    
    
    output wire [255:0] m_axis_tdata,
    output wire [31:0] m_axis_tkeep,
    output wire m_axis_tlast,
    output wire m_axis_tvalid,
    input wire m_axis_tready
    
    );
    
    assign m_axis_tvalid = s_axis_tvalid;
    assign s_axis_tready = m_axis_tready;
    assign m_axis_tdata = s_axis_tdata;
    assign m_axis_tkeep = s_axis_tkeep;
    assign m_axis_tlast = gpio_in[0];
    assign rf_reset = gpio_in[1];
    
endmodule
