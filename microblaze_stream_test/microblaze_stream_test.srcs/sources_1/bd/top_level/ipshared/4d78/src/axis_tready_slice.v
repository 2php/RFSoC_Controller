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


module axis_tready_slice
#(
parameter valid_bit = 0,
parameter ready_bit = 1,
parameter sclk_bit = 3,
parameter sdata_bit = 4
)
(

    input wire clk,
    input wire reset,
    input wire s_axis_tvalid,
    (* dont_touch = "true" *) output reg s_axis_tready,
    input wire [255:0] s_axis_tdata,
    input wire s_axis_tlast,
    
    
    input wire [7:0] gpio_in,
    input wire ext_trigger,
    
    
    output wire [255:0] m_axis_tdata,
    output wire m_axis_tvalid,
    input wire m_axis_tready,
    
    output wire [255:0] mloop_axis_tdata,
    (* dont_touch = "true" *) output reg mloop_axis_tvalid,
    input wire mloop_axis_tready 
        
    );
    
    wire [31:0] count_val;
    reg [1:0] state;
    reg [31:0] count;
    shift_register #(32) sr (.clk(gpio_in[sclk_bit]), .reset(reset), .data_in(gpio_in[sdata_bit]), .data_out(count_val));
    
    localparam [1:0] state_wait_trigger = 2'b00,
		             state_trigger = 2'b01,
		             state_cleanup = 2'b10; 
    
    initial begin
         s_axis_tready <= 1'b0;
         mloop_axis_tvalid <= 1'b0;
         state <= state_wait_trigger;
         count <= 0;
    end
    
    always @ (posedge clk or negedge reset) begin
        if(reset == 1'b0) begin
             s_axis_tready <= 1'b0;
             mloop_axis_tvalid <= 1'b0;
             state <= state_wait_trigger;
             count <= 0;
        end
        
        else begin
               
            case(state)
            
                state_wait_trigger: begin
                    if(gpio_in[ready_bit] == 1'b1 || ext_trigger == 1'b1) begin
                        count <= count + 1;
                        state <= state_trigger;
                        s_axis_tready <= 1'b1;
                        mloop_axis_tvalid <= 1'b1;
                    end
                end
                
                
                state_trigger: begin
                    if(count > count_val || count == count_val) begin
                        count <= 0;
                        s_axis_tready <= 1'b0;
                        mloop_axis_tvalid <= 1'b0;
                        state <= state_cleanup;
                    end
                    else begin
                        count = count + 1'b1;
                    end
                
                
                end
                
                state_cleanup: begin
                    if(gpio_in[ready_bit] == 1'b0 && ext_trigger == 1'b0) begin
                        state <= state_wait_trigger;
                    end
                end
                
                default begin
                    state <= state_wait_trigger;
                end
            
            
            endcase
            
        end
    
    
    end
    
    
    assign m_axis_tdata = s_axis_tdata;
	assign mloop_axis_tdata = s_axis_tdata; 
	assign m_axis_tvalid = 1'b1;
    
endmodule




