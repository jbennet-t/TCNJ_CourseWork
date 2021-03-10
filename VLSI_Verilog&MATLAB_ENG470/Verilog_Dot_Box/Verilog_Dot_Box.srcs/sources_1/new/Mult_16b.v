`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2020 03:40:56 PM
// Design Name: 
// Module Name: Mult_16b
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


module Mult_16b(
    input [15:0] x_Input,
    input [15:0] y_Input,
    output [34:0] product );

    assign product[34:0] = (x_Input[31:0] * y_Input[31:0]);
    
endmodule
