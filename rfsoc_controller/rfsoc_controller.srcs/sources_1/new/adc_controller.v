`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2019 09:56:19 AM
// Design Name: 
// Module Name: adc_controller
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


module adc_controller
#(
parameter trigger_override_bit = 0,//Tells the state machine to trigger continuously instead of for a set number of clock cycles
parameter ready_bit = 1,//Tells the state machine to trigger
parameter locking_sclk = 3,//Used for loading the locking cycle
parameter sdata = 4,
parameter buffer_flush_bit = 5,//Used for setting all outputs to 0
parameter zeros_sclk = 7,
parameter cycles_sclk = 8,
parameter pre_waveform_sclk = 10,
parameter adc_capture_count_sclk = 12,
parameter adc_shift_sclk = 14
)
(
    input wire rf_clk,
    input wire rf_reset,
    input wire ext_trigger,
    input wire [15:0] gpio_in,
    
    //Input from ADC
    input wire [127:0] s_axis_tdata_0,
    input wire s_axis_tvalid_0,
    output wire s_axis_tready_0,
    
    //Outputs to data fifos
    output wire [31:0] m_axis_tdata_0,
    output wire m_axis_tvalid_0,
    input wire m_axis_tready_0,
    
    output wire [31:0] m_axis_tdata_1,
    output wire m_axis_tvalid_1,
    input wire m_axis_tready_1,
    
    output wire [31:0] m_axis_tdata_2,
    output wire m_axis_tvalid_2,
    input wire m_axis_tready_2,
    
    output wire [31:0] m_axis_tdata_3,
    output wire m_axis_tvalid_3,
    input wire m_axis_tready_3,
    
    //Loopback interfaces from data fifos
    input wire [31:0] s_axis_tdata_1,
    input wire s_axis_tvalid_1,
    output wire s_axis_tready_1,
    
    input wire [31:0] s_axis_tdata_2,
    input wire s_axis_tvalid_2,
    output wire s_axis_tready_2,
    
    input wire [31:0] s_axis_tdata_3,
    input wire s_axis_tvalid_3,
    output wire s_axis_tready_3,
    
    input wire [31:0] s_axis_tdata_4,
    input wire s_axis_tvalid_4,
    output wire s_axis_tready_4,
    
    //Outputs to CPU
    output wire [31:0] m_axis_tdata_4,
    output wire m_axis_tvalid_4,
    input wire m_axis_tready_4,
    
    output wire [31:0] m_axis_tdata_5,
    output wire m_axis_tvalid_5,
    input wire m_axis_tready_5,
    
    output wire [31:0] m_axis_tdata_6,
    output wire m_axis_tvalid_6,
    input wire m_axis_tready_6,
    
    output wire [31:0] m_axis_tdata_7,
    output wire m_axis_tvalid_7,
    input wire m_axis_tready_7
    
    //output wire [1:0] state_out,
    //output wire [31:0] count_out,
    //output wire [31:0] count_val_out
    
    );
    
    //Interface for incomming adc data is always ready
    assign s_axis_tready = 1'b1;
   
    
    //if the shift value is 0, then we're not averaging, otherwise average
    assign m_axis_tdata_3 = shift_val == 0 ? s_axis_tdata_0[127:96] : (s_axis_tdata_4 >> shift_val) + (s_axis_tdata_0[127:96] >> shift_val);
    assign m_axis_tdata_2 = shift_val == 0 ? s_axis_tdata_0[95:64] : (s_axis_tdata_3 >> shift_val) + (s_axis_tdata_0[95:64] >> shift_val);
    assign m_axis_tdata_1 = shift_val == 0 ? s_axis_tdata_0[63:32] : (s_axis_tdata_2 >> shift_val) + (s_axis_tdata_0[63:32] >> shift_val);
    assign m_axis_tdata_0 = shift_val == 0 ? s_axis_tdata_0[31:0] : (s_axis_tdata_1 >> shift_val) + (s_axis_tdata_0[31:0] >> shift_val);
    
    
    //If we're still averaging, then the data fifos can only cycle when they're being averaged, otherwise they can output when the clock crossing fifo is ready
    assign s_axis_tready_1 = shift_val == 0 ? m_axis_tready_4 : data_valid[0];
    assign s_axis_tready_2 = shift_val == 0 ? m_axis_tready_5 : data_valid[1];
    assign s_axis_tready_3 = shift_val == 0 ? m_axis_tready_6 : data_valid[2];
    assign s_axis_tready_4 = shift_val == 0 ? m_axis_tready_7 : data_valid[3];
    
    //If we're averadging then the clock crossing fifos cannot accept data, otherwise they can only accept data when the data fifos are ready
    assign m_axis_tvalid_4 = shift_val == 0 ? s_axis_tvalid_1 : 0;
    assign m_axis_tvalid_5 = shift_val == 0 ? s_axis_tvalid_2 : 0;
    assign m_axis_tvalid_6 = shift_val == 0 ? s_axis_tvalid_3 : 0;
    assign m_axis_tvalid_7 = shift_val == 0 ? s_axis_tvalid_4 : 0;
    
    //data for the clock crossing fifos is always connected to the output of the data fifos
    assign m_axis_tdata_4 = s_axis_tdata_1;
    assign m_axis_tdata_5 = s_axis_tdata_2;
    assign m_axis_tdata_6 = s_axis_tdata_3;
    assign m_axis_tdata_7 = s_axis_tdata_4;
    
    reg [3:0] data_valid;
    assign m_axis_tvalid_0 = data_valid[0];
    assign m_axis_tvalid_1 = data_valid[1];
    assign m_axis_tvalid_2 = data_valid[2];
    assign m_axis_tvalid_3 = data_valid[3];
    
    reg [1:0] state;
    reg [31:0] count;
    
    //assign state_out = state;
    //assign count_val_out = count_val;
    //assign count_out = count;
    
    wire [31:0] count_val;
    shift_register #(32) sr_cycles(.clk(rf_clk), .sclk(gpio_in[adc_capture_count_sclk]), .reset(rf_reset), .data_in(gpio_in[sdata]), .data_out(count_val));
    
    wire [31:0] shift_val;
    shift_register #(32) sr_shift(.clk(rf_clk), .sclk(gpio_in[adc_shift_sclk]), .reset(rf_reset), .data_in(gpio_in[sdata]), .data_out(count_val));
    
    localparam [1:0] state_wait_trigger = 2'b00,
                     state_trigger = 2'b01,
                     state_cleanup = 2'b10;
    
    initial begin
    
        state <= state_wait_trigger;
        count <= 0;
        data_valid <= 0;
    
    end
    
    
    always @ (posedge rf_clk or negedge rf_reset) begin
    
        if(rf_reset == 1'b0) begin
        
            state <= state_wait_trigger;
            count <= 0;
            data_valid <= 0;
        
        end
        
        else begin
        
        
            case(state)
            
                state_wait_trigger: begin
                    if(ext_trigger == 1'b1) begin
                        //Start the data transfer to the fifos
                        data_valid <= 4'hf;
                        //Set the count to 1
                        count <= 1;
                        //Go to the trigger state
                        state <= state_trigger;
                    end
                end
                
                state_trigger: begin
                    //If we're done counting
                    if(count > count_val || count == count_val) begin
                        //reset the count
                        count <= 0;
                        //stop all transfers
                        data_valid <= 4'h0;
                        //wait for the trigger signals to go low
                        state <= state_cleanup;
                    end
                    else begin
                        count = count + 1'b1;
                    end
                
                end
                
                state_cleanup: begin
                    if(ext_trigger == 1'b0) begin
                        //Go back to waiting for a trigger pulse
                        state <= state_wait_trigger;
                    end
                
                end
                
                default: begin
                    
                    state <= state_wait_trigger;
                
                end
                
            endcase
        end//else not resetting
    end
    
    
    
endmodule
