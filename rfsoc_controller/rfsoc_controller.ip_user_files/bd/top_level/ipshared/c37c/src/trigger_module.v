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


module trigger_module
#(
    parameter count_cycles = 2,
    parameter gpio_trigger = 11
)
(
    input wire rf_clk,
    input wire rf_reset,
    input wire trigger_in,
    input wire pipeline_active_in_0,
    input wire pipeline_active_in_1,
    input wire pipeline_active_in_2,
    input wire pipeline_active_in_3,

    
    input wire [15:0] gpio_in,
    
    (* dont_touch = "true" *)output reg trigger_c0,
    (* dont_touch = "true" *)output reg trigger_c1,
    (* dont_touch = "true" *)output reg trigger_c2,
    (* dont_touch = "true" *)output reg trigger_c3
    );
    
    reg [31:0] count;
    reg [1:0] state;
    
    wire pipeline_active_in;
    assign pipeline_active_in = pipeline_active_in_0 | 
                                pipeline_active_in_1 | 
                                pipeline_active_in_2 | 
                                pipeline_active_in_3;
        
     localparam [1:0] state_wait_trigger = 2'b00,
		              state_trigger = 2'b01,
		              state_cleanup = 2'b10; 
    
    initial begin
        count <= 0;
        state <= state_wait_trigger;
        trigger_c0 <= 1'b0;
        trigger_c1 <= 1'b0;
        trigger_c2 <= 1'b0;
        trigger_c3 <= 1'b0;
    end 
    
    
    always @ (posedge rf_clk or negedge rf_reset) begin
    
        if(rf_reset == 1'b0) begin
            count <= 0;
            state <= state_wait_trigger;
            trigger_c0 <= 1'b0;
            trigger_c1 <= 1'b0;
            trigger_c2 <= 1'b0;
            trigger_c3 <= 1'b0;

        end
        
        else begin
        
            case(state)
            
                state_wait_trigger: begin
                    if((trigger_in == 1'b1 || gpio_in[gpio_trigger] == 1'b1)&& pipeline_active_in == 1'b0) begin
                        state <= state_trigger;
                        trigger_c0 <= 1'b1;
                        trigger_c1 <= 1'b1;
                        trigger_c2 <= 1'b1;
                        trigger_c3 <= 1'b1;
                    end
                end
                
                state_trigger: begin
                    if(count > count_cycles) begin
                        count <= 0;
                        state <= state_cleanup;
                        trigger_c0 <= 1'b0;
                        trigger_c1 <= 1'b0;
                        trigger_c2 <= 1'b0;
                        trigger_c3 <= 1'b0;
                    end
                    else begin
                        count <= count + 1'b1;
                    end
                end
                
                state_cleanup: begin
                    if(trigger_in == 1'b0 && gpio_in[gpio_trigger] == 1'b0 && pipeline_active_in == 1'b0) begin
                        state <= state_wait_trigger;
                    end
                end
            
            endcase
        
        end
    
    
    end
endmodule
