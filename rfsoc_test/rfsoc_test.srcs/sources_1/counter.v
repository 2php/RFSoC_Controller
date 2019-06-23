`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 05:10:19 PM
// Design Name: 
// Module Name: counter
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


module counter
#(
	parameter width = 64
)
(
    input wire s_clk,//Used to shift in trigger value
    input wire data_in,//Data bit for trigger value
    input wire fire,//Only counts up if this line is high
    input wire clk,
    input wire rst,
    output wire [width-1:0] count_out,
    output reg done//Set to 1 when done counting
);

wire [width-1:0] trigger;
wire dummy_s;//Dummy wire for serial output
shift_register #(width) sr (s_clk, reset, data_in, dummy_s, trigger);

reg [width-1:0] count;

initial begin
    count = 0;
    done = 0;
end

always @ (posedge clk or negedge rst) begin
    if(rst == 1'b0) begin//If we're in the reset state
        count = 0;
        done = 0;
    end
    else begin
        //Need to trigger a cycle early to avoid overrunning the idle counter
        if(count < (trigger - 1) && fire) begin//If we're below our trigger
            count <= count + 1;//We need to increment
        end
        else if(fire) begin
            done <= 1'b1;//We're done
            count <= count + 1;//We need to still increment to tell the fire controller when to stop driving the waveform registers
        end//else
    end//if reset
end//always

assign count_out = count;

endmodule



