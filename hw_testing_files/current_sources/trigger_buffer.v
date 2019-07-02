`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2019 04:05:26 PM
// Design Name: 
// Module Name: trigger_buffer
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


module trigger_buffer
#(
    parameter count_cycles = 2000
)
(
    input wire clk,
    input wire reset,
    input wire trigger_in,
    output reg trigger_out
    );
    
    reg [31:0] count;
    reg [1:0] state;
    
     localparam [1:0] state_wait_trigger = 2'b00,
		              state_trigger = 2'b01,
		              state_cleanup = 2'b10; 
    
    initial begin
        count <= 0;
        state <= state_wait_trigger;
        trigger_out <= 1'b0;
    end 
    
    
    always @ (posedge clk or negedge reset) begin
    
        if(reset == 1'b0) begin
            count <= 0;
            state <= state_wait_trigger;
            trigger_out <= 1'b0;
        end
        
        else begin
        
            case(state)
            
                state_wait_trigger: begin
                    if(trigger_in == 1'b1) begin
                        state <= state_trigger;
                        trigger_out <= 1'b1;
                    end
                end
                
                state_trigger: begin
                    if(count > count_cycles) begin
                        count <= 0;
                        state <= state_cleanup;
                        trigger_out <= 1'b0;
                    end
                    else begin
                        count <= count + 1'b1;
                    end
                end
                
                state_cleanup: begin
                    if(trigger_in == 1'b0) begin
                        state <= state_wait_trigger;
                    end
                end
            
            endcase
        
        end
    
    
    end
endmodule
