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
parameter trigger_override_bit = 0,//Tells the state machine to trigger continuously instead of for a set number of clock cycles
parameter ready_bit = 1,//Tells the state machine to trigger
parameter sclk = 3,//Used for loading the locking cycle
parameter sdata = 4,
parameter buffer_flush_bit = 5//Used for setting all outputs to 0
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
    input wire mloop_axis_tready, 
    
    input wire [31:0] count_val_in,
    output wire pipeline_active,
    
    input wire is_locking

    
    );
    
    assign count_out = count;
    assign state_out = state;
    assign pipeline_active = s_axis_tready;
    
    wire [31:0] count_val;
    assign count_val = count_val_in;
    
    reg [1:0] state;
    reg [31:0] count;
    
    localparam [1:0] state_wait_trigger = 2'b00,
		             state_trigger = 2'b01,
		             state_cleanup = 2'b10; 
    
    wire [255:0] locking_waveform;
    shift_register #(256) sr(.clk(clk), .sclk(gpio_in[sclk]), .reset(reset), .data_in(gpio_in[sdata]), .data_out(locking_waveform));
    
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
                //If we're recieving a trigger signal
                    if(gpio_in[ready_bit] == 1'b1 || ext_trigger == 1'b1) begin
                        //If we're overriding the state machine
                        if(gpio_in[trigger_override_bit] == 1'b1) begin
                            //start all data transfers
                            s_axis_tready <= 1'b1;
                            mloop_axis_tvalid <= 1'b1;
                            //go to the cleanup state and wait for the trigger signal to go low
                            state <= state_cleanup;
                        end
                        else begin
                            //Increment count
                            count <= count + 1;
                            //advance to the trigger state
                            state <= state_trigger;
                            //start all data transfers
                            s_axis_tready <= 1'b1;
                            mloop_axis_tvalid <= 1'b1;
                        end
                    end
                end
                
                
                state_trigger: begin
                    //If we're done counting
                    if(count > count_val || count == count_val) begin
                        //reset the count
                        count <= 0;
                        //stop all transfers
                        s_axis_tready <= 1'b0;
                        mloop_axis_tvalid <= 1'b0;
                        //wait for the trigger signals to go low
                        state <= state_cleanup;
                    end
                    else begin
                        count = count + 1'b1;
                    end
                
                
                end
                
                state_cleanup: begin
                    //If both trigger signals are low
                    if(gpio_in[ready_bit] == 1'b0 && ext_trigger == 1'b0) begin
                        count <= 0;
                        state <= state_wait_trigger;
                        //Reset our trigger signals in case we were using trigger override
                        s_axis_tready <= 1'b0;
                        mloop_axis_tvalid <= 1'b0;
                    end
                end
                
                default begin
                    state <= state_wait_trigger;
                end
            
            
            endcase
            
        end
    
    
    end
    
    
    assign m_axis_tdata = gpio_in[buffer_flush_bit] ? 0 : (s_axis_tready == 1'b1 ? s_axis_tdata : (is_locking == 1'b1 ? locking_waveform : 0));
	assign mloop_axis_tdata = gpio_in[buffer_flush_bit] ? 0 : s_axis_tdata; 
	assign m_axis_tvalid = 1'b1;
    
endmodule




