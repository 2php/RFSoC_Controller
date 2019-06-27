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

    input wire clk,
    input wire reset,
    input wire s_axis_tvalid,
    output reg s_axis_tready,
    input wire [255:0] s_axis_tdata,
    input wire s_axis_tlast,
    
    
    input wire [2:0] gpio_in,
    //input wire ext_trigger,
    
    
    output wire [255:0] m_axis_tdata,
    output reg m_axis_tvalid,
    input wire m_axis_tready    
    );
    
    
    assign m_axis_tdata = s_axis_tdata;
    
    always @ (posedge clk or negedge reset) begin
        if(reset == 1'b0) begin
             m_axis_tvalid <= 1'b1;
             s_axis_tready <= 1'b0;
        end
        
        else begin
            m_axis_tvalid <= gpio_in[0];
            s_axis_tready <= gpio_in[1];
        end
    
    
    end
    
    
    
endmodule
