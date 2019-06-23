`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2019 03:11:18 PM
// Design Name: 
// Module Name: dummy_controller
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


module dummy_controller(
    output wire [255:0] dummy_data,
    output wire t_valid,
    output wire reset
    );
    
    
    assign t_valid = 1'b1;
    assign reset = 1'b1;
    
    assign dummy_data = 256'h10000161F81B5051EC83200001EC831B505161F8100009E084AFB137D0000137D4AFB9E08;
    
    
endmodule
