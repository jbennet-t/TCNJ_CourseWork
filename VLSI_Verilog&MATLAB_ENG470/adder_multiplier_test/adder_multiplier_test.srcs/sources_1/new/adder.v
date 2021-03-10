`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2020 07:38:05 PM
// Design Name: 
// Module Name: adder
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


module adder
(
    input signed [31:0] post_mul_Input,
    input signed [34:0] reg_Input,
    output signed [34:0] sum );

    assign sum[34:0] = (post_mul_Input[31:0] + reg_Input[34:0]);

endmodule