`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2019 06:07:39 PM
// Design Name: 
// Module Name: RFSoC_Controller
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


module RFSoC_Controller
#(
    parameter width = 256,//Width of the DAC data interface in bits
    parameter depth = 2,//Depth of the registers
    parameter channels = 1,//Number of channels
    parameter delay_width = 64//Width of delay value when firing
)
(

    input wire clk_in, //Main system clock from RF block
    input wire reset, //Main system reset
    
    output wire fire_clk_out,//out to clock buffer 
    input wire fire_clk_in,//in to clock buffer
    
    input wire arm,//Tells wave registers to switch from programming mode to firing mode, sets their pclk to the pll input
    input wire fire, //Tells the system to begin experiment cycle

    //Waveform register connections
    input wire wave_reg_sclk,
    input wire wave_reg_pclk,
    input wire wave_reg_data_in,
    input wire wave_reg_cycle,//changes chain input from programming register to loop
    //wire wave_reg_idle,
    
    //Delay register connections
    input wire delay_reg_sclk,
    input wire delay_reg_data_in,
    
    //Idle pattern register connections
    input wire idle_reg_sclk,
    input wire idle_reg_data_in,
    
    //RF Outputs
    output wire [width-1:0] ch_0_data
   // output wire [width-1:0] ch_1_data,
    //output wire [width-1:0] ch_2_data,
    //output wire [width-1:0] ch_3_data,
    //output wire [width-1:0] ch_4_data,
    //output wire [width-1:0] ch_5_data,
    //output wire [width-1:0] ch_6_data,
    //output wire [width-1:0] ch_7_data,
    //output wire [width-1:0] ch_8_data,
    //output wire [width-1:0] ch_9_data,
    //output wire [width-1:0] ch_10_data,
    //output wire [width-1:0] ch_11_data,
    //output wire [width-1:0] ch_12_data,
    //output wire [width-1:0] ch_13_data,
    //output wire [width-1:0] ch_14_data,
    //output wire [width-1:0] ch_15_data
    
);


//Wire for arming the registers
wire int_fire;
assign int_fire = arm;
//Serial connections between wave registers
wire [channels-1:0] s_wave_inter;
//Serial connections between idle registers
wire [channels-1:0] s_idle_inter;
//wire matrix for idle pattern routing
wire [width-1:0] idle_patterns [0:channels-1];
//Wire for controlling when matricies should idle
wire idle_wire;
//Wire for denoting when registers should cycle or be loaded with incomming serial data
wire cycle_wire;
assign cycle_wire = arm;
//Wire for firing clock, should be connected to output of fire controller
wire fire_clock;
assign fire_clk_out = fire_clock;
//Wire matrix for routing DAC input busses
wire [width-1:0] dac_data [0:channels-1];
//Assignments for wire matrix
assign ch_0_data = dac_data[0];
//assign ch_1_data = dac_data[1];
//assign ch_2_data = dac_data[2];
//assign ch_3_data = dac_data[3];
//assign ch_4_data = dac_data[4];
//assign ch_5_data = dac_data[5];
//assign ch_6_data = dac_data[6];
//assign ch_7_data = dac_data[7];
//assign ch_8_data = dac_data[8];
//assign ch_9_data = dac_data[9];
//assign ch_10_data = dac_data[10];
//assign ch_11_data = dac_data[11];
//assign ch_12_data = dac_data[12];
//assign ch_13_data = dac_data[13];
//assign ch_14_data = dac_data[14];
//assign ch_15_data = dac_data[15];





//Reset line common to all DAC AXIS interfaces
wire dac_axis_reset;
//Wire for clocking the AXI controll interface
wire axi_clock;

//Generate statement for instantiating registers
genvar i;
for(i = 0; i < channels; i=i+1)begin:chns
    
    //If we're the first channel
    if(i == 0) begin
         //Idle pattern register
        shift_register #(width) idle_reg(
            idle_reg_sclk, 
            reset, 
            idle_reg_data_in, 
            s_idle_inter[0], 
            idle_patterns[0]);
        //waveform registr
        reg_module #(width, depth) wave_reg(
            wave_reg_sclk, 
            wave_reg_pclk, 
            fire_clk_in, 
            int_fire, 
            idle_wire, 
            reset, 
            wave_reg_data_in, 
            s_wave_inter[0], 
            cycle_wire, 
            idle_patterns[0], 
            dac_data[0]);
    end
    
    else begin    
        //Idle pattern register
        shift_register #(width) idle_reg(
            idle_reg_sclk, 
            reset, 
            s_idle_inter[i-1], 
            s_idle_inter[i], 
            idle_patterns[i]);
        //waveform registr
        reg_module #(width, depth) wave_reg(
            wave_reg_sclk, 
            wave_reg_pclk, 
            fire_clk_in, 
            int_fire, 
            idle_wire, 
            reset, 
            s_wave_inter[i-1], 
            s_wave_inter[i], 
            cycle_wire, 
            idle_patterns[i], 
            dac_data[i]);
    end

end


//Fire controler instantiation
fire_controller #(depth, delay_width) fc
(
    .reset(reset),
    .p_clk_in(clk_in),
    .p_clk_out(fire_clock),
    .s_clk(delay_reg_sclk),//Serial clock for loading delay
    .s_data(delay_reg_data_in),//Serial data for loading delay
    .fire(fire),//Needs to be strobed high for one clock cycle to work
    .idle_out(idle_wire)
);
    
    
endmodule
