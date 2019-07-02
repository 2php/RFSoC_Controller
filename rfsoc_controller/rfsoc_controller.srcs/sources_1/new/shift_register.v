`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2019 03:50:28 PM
// Design Name: 
// Module Name: shift_register
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


module shift_register
#(
	parameter width = 32
)
(
    input wire clk,
    input wire reset,
    input wire data_in,
    //output wire s_data_out,
    output reg [width-1:0] data_out
);

wire [width-1:0] data_next;

initial begin
    //Set the registers to 0
    data_out <= 0;
end

always @ (posedge clk or negedge reset) begin
    if(reset == 1'b0)begin
        //Set the registers to 0
        data_out <= 0;
    end
    else begin
        //Update our value
        data_out <= data_next;
    end
end

assign data_next = {data_in, data_out[width-1:1]};

//assign s_data_out = data_out[0];

endmodule