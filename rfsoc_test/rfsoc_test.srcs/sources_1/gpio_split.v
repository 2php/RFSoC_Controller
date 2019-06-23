`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2019 09:36:22 AM
// Design Name: 
// Module Name: gpio_split
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


module gpio_split(
    input wire [15:0] gpio_in,
    
    output wire arm,
    output wire fire, 
    
     //Waveform register connections
    output wire wave_reg_sclk,
    output wire wave_reg_pclk,
    output wire wave_reg_data_in,
    output wire wave_reg_cycle,//changes chain input from programming register to loop
    //wire wave_reg_idle,
    
    //Delay register connections
    output wire delay_reg_sclk,
    output wire delay_reg_data_in,
    
    //Idle pattern register connections
    output wire idle_reg_sclk,
    output wire idle_reg_data_in,
    
    output wire a_tv,
    //output wire a_tr //Assigned to fire
    
    output wire dummy_reset,
    output wire dummy_microblaze_reset
    );
    
    
    assign arm = gpio_in[0];
    assign fire = gpio_in[1];
    assign wave_reg_sclk = gpio_in[2];
    assign wave_reg_pclk = gpio_in[3];
    assign wave_reg_data_in = gpio_in[4];
    assign wave_reg_cycle = gpio_in[5];
    assign delay_reg_sclk = gpio_in[6];
    assign delay_reg_data_in = gpio_in[7];
    assign idle_reg_sclk = gpio_in[8];
    assign idle_reg_data_in = gpio_in[9];
    assign a_tv = gpio_in[10];
    assign axis_tready = gpio_in[1];
    
    assign dummy_reset = 1'b1;
    assign dummy_microblaze_reset = 1'b0;
endmodule
