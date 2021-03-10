`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2020 03:26:03 PM
// Design Name: 
// Module Name: Adder_32b
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


module Adder_32b(
    input [31:0] post_mul_Input,
    input [34:0] reg_Input,
    output [34:0] sum );

    assign sum[34:0] = (post_mul_Input[31:0] + reg_Input[34:0]);
    
endmodule
