`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2019 06:14:53 PM
// Design Name: 
// Module Name: fire_controller
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


module fire_controller
#(
	parameter depth = 1000,
	parameter delay_width = 64
)
(
    input wire reset,
    input wire p_clk_in,
    output wire p_clk_out,
    input wire s_clk,//Serial clock for loading delay
    input wire s_data,//Serial data for loading delay
    input wire fire,//Needs to be strobed high for one clock cycle to work
    output reg idle_out
);
    
 localparam [1:0] state_wait_fire = 2'b00,
		   state_fire = 2'b01,
		   state_cleanup = 2'b10;   
 
 reg [1:0] state;
 reg run_count;//runs counter when 1, also enables p_clk output
 
 wire [63:0] count;//counter output to check when we're done resetting
 wire count_done;//1 when 
 
 //Counter reset assignments
 reg counter_reset;
 wire c_r;
 assign c_r = reset == 1'b0 ? 0 : counter_reset;
counter #(delay_width) cnt
(
    .s_clk(s_clk),//Used to shift in trigger value
    .data_in(s_data),//Data bit for trigger value
    .fire(run_count),//Only counts up if this line is high
    .clk(p_clk_in),
    .rst(c_r),
    .count_out(count),
    .done(count_done)//Set to 1 when done counting
);

initial begin
    reset_regs();
end

always @ (negedge p_clk_in or negedge reset) begin
    if(reset == 1'b0) begin
        reset_regs();
    end
    else begin
    
        case(state)
        
            state_wait_fire: begin
                //Reset the counter reset line
                counter_reset <= 1'b1;
            
                //If the fire line is active
                if(fire == 1'b1) begin
                    //Turn off the idle signal
                    idle_out <= 1'b0;
                    //start the counter
                    run_count <= 1'b1;
                    //Advance to the fire state
                    state <= state_fire;
                end    
            end
            
            
            state_fire: begin
                //If we're done counting and it's time to stop firing
                if(count_done) begin
                   //Turn on the idle signal
                    idle_out <= 1'b1;
                    //Advance to cleanup state
                    state <= state_cleanup;
                end
            end
            
            state_cleanup: begin
                //If we're done counting
                if(count == depth) begin
                    //Turn off the parallel clock
                    run_count <= 1'b0;
                    //reset the counter
                    counter_reset <= 1'b0;
                    //go back to the idle state
                    if(fire == 1'b0) begin
                        state <= state_wait_fire;
                    end
                end
            
            end
        
        endcase
    
    
    end

end

task reset_regs();
begin
    idle_out <= 1'b1;
    counter_reset <= 1'b1;
    run_count <= 1'b0;
    state <= state_wait_fire;
end
endtask
    

assign p_clk_out = run_count ? p_clk_in : 0;

endmodule
