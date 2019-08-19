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
    output wire [127:0] m_axis_tdata_0,
    output wire m_axis_tvalid_0,
    input wire m_axis_tready_0,
    
    //Loopback interfaces from data fifos
    input wire [127:0] s_axis_tdata_1,
    input wire s_axis_tvalid_1,
    output wire s_axis_tready_1,

    
    //Outputs to CPU
    output wire [31:0] m_axis_tdata_1,
    output wire m_axis_tvalid_1,
    input wire m_axis_tready_1,
    
    output wire [31:0] m_axis_tdata_2,
    output wire m_axis_tvalid_2,
    input wire m_axis_tready_2,
    
    output wire [31:0] m_axis_tdata_3,
    output wire m_axis_tvalid_3,
    input wire m_axis_tready_3,
    
    output wire [31:0] m_axis_tdata_4,
    output wire m_axis_tvalid_4,
    input wire m_axis_tready_4
    
    //output wire [1:0] state_out,
    //output wire [31:0] count_out,
    //output wire [31:0] count_val_out
    
    );

reg data_valid;
reg [1:0] state;
reg [31:0] count;


localparam [1:0] state_wait_trigger = 2'b00,
                 state_trigger = 2'b01,
                 state_cleanup = 2'b10;
	
wire [31:0] count_val;
shift_register #(32) sr_cycles(.clk(rf_clk), .sclk(gpio_in[adc_capture_count_sclk]), .reset(rf_reset), .data_in(gpio_in[sdata]), .data_out(count_val));

wire [31:0] shift_val;
shift_register #(32) sr_shift(.clk(rf_clk), .sclk(gpio_in[adc_shift_sclk]), .reset(rf_reset), .data_in(gpio_in[sdata]), .data_out(shift_val));

//Interface for incomming adc data is always ready
assign s_axis_tready_0 = 1'b1;

//Making sure we're not adding garbage to the first capture
wire [127:0] s_axis_tdata_1_i = data_valid ? s_axis_tdata_1 : 0;
//wire [127:0] s_axis_tdata_1_i = s_axis_tdata_1;

//Averaging function

//Each value
wire signed [15:0] val_0 = s_axis_tdata_0[15:0];
wire signed [15:0] val_1 = s_axis_tdata_0[31:16];
wire signed [15:0] val_2 = s_axis_tdata_0[47:32];
wire signed [15:0] val_3 = s_axis_tdata_0[63:48];
wire signed [15:0] val_4 = s_axis_tdata_0[79:64];
wire signed [15:0] val_5 = s_axis_tdata_0[95:80];
wire signed [15:0] val_6 = s_axis_tdata_0[111:96];
wire signed [15:0] val_7 = s_axis_tdata_0[127:112];

//Each divide
wire signed [15:0] val_0_div = (val_0 >>> shift_val);
wire signed [15:0] val_1_div = (val_1 >>> shift_val);
wire signed [15:0] val_2_div = (val_2 >>> shift_val);
wire signed [15:0] val_3_div = (val_3 >>> shift_val);
wire signed [15:0] val_4_div = (val_4 >>> shift_val);
wire signed [15:0] val_5_div = (val_5 >>> shift_val);
wire signed [15:0] val_6_div = (val_6 >>> shift_val);
wire signed [15:0] val_7_div = (val_7 >>> shift_val);

//Each average

wire signed [15:0] avg_0 = val_0_div + s_axis_tdata_1_i[15:0];
wire signed [15:0] avg_1 = val_1_div + s_axis_tdata_1_i[31:16];
wire signed [15:0] avg_2 = val_2_div + s_axis_tdata_1_i[47:32];
wire signed [15:0] avg_3 = val_3_div + s_axis_tdata_1_i[63:48];
wire signed [15:0] avg_4 = val_4_div + s_axis_tdata_1_i[79:64];
wire signed [15:0] avg_5 = val_5_div + s_axis_tdata_1_i[95:80];
wire signed [15:0] avg_6 = val_6_div + s_axis_tdata_1_i[111:96];
wire signed [15:0] avg_7 = val_7_div + s_axis_tdata_1_i[127:112];

//Packing the values back into the averaging function
wire [127:0] avg_function;
assign avg_function[15:0] = avg_0;
assign avg_function[31:16] = avg_1;
assign avg_function[47:32] = avg_2;
assign avg_function[63:48] = avg_3;
assign avg_function[79:64] = avg_4;
assign avg_function[95:80] = avg_5;
assign avg_function[111:96] = avg_6;
assign avg_function[127:112] = avg_7;


//    assign avg_function = ((s_axis_tdata_0[15:0] >>> shift_val) + s_axis_tdata_1_i[15:0]) |
//                          (((s_axis_tdata_0[31:16] >>> shift_val) + s_axis_tdata_1_i[31:16]) << 16) |
//                          (((s_axis_tdata_0[47:32] >>> shift_val) + s_axis_tdata_1_i[47:32]) << 32) |
//                          (((s_axis_tdata_0[63:48] >>> shift_val) + s_axis_tdata_1_i[63:48]) << 48) |
//                          (((s_axis_tdata_0[79:64] >>> shift_val) + s_axis_tdata_1_i[79:64]) << 64) |
//                          (((s_axis_tdata_0[95:80] >>> shift_val) + s_axis_tdata_1_i[95:80]) << 80) |
//                          (((s_axis_tdata_0[111:96] >>> shift_val) + s_axis_tdata_1_i[111:96]) << 96) |
//                          (((s_axis_tdata_0[127:112] >>> shift_val) + s_axis_tdata_1_i[127:112]) << 112);

//Figuring out when the clock crossing fifos are ready for 
wire cpu_ready;
assign cpu_ready = m_axis_tready_4 & m_axis_tready_3 & m_axis_tready_2 & m_axis_tready_1;

//Assignment for output to data fifo
//If we're not shifting, then just pass data through, otherwise add it to whats comming out of the data fifo
assign m_axis_tdata_0 = shift_val == 0 ? s_axis_tdata_0 : avg_function;
//Data can only enter the data fifo when we're capturing
assign m_axis_tvalid_0 = data_valid | state == state_trigger;

//Assignment for loopback interface
assign s_axis_tready_1 = shift_val == 0 ? cpu_ready : data_valid;

//Assignment for CPU outputs
assign m_axis_tdata_1 = s_axis_tdata_1[31:0];
assign m_axis_tdata_2 = s_axis_tdata_1[63:32];
assign m_axis_tdata_3 = s_axis_tdata_1[95:64];
assign m_axis_tdata_4 = s_axis_tdata_1[127:96];

//If we're not shifting, then data is valid when data from the data fifo is ready, otherwise data is not valud
assign m_axis_tvalid_1 = shift_val == 0 ? s_axis_tvalid_1 & cpu_ready : 0;
assign m_axis_tvalid_2 = shift_val == 0 ? s_axis_tvalid_1 & cpu_ready : 0;
assign m_axis_tvalid_3 = shift_val == 0 ? s_axis_tvalid_1 & cpu_ready : 0;
assign m_axis_tvalid_4 = shift_val == 0 ? s_axis_tvalid_1 & cpu_ready : 0;



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
                    //If there isn't any data in the fifos
                    if(s_axis_tvalid_1 == 1'b0) begin
                        //Stop all data transfers, data needs to build up first
                        data_valid <= 1'b0;
                    end
                    else begin
                        //Start the data transfer to the fifos
                        data_valid <= 1'b1;
                    end
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
                    data_valid <= 1'b0;
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
