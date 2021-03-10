`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2020 07:43:52 PM
// Design Name: 
// Module Name: add_mul_tb
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


module add_mul_tb();
    
    //mul
    reg signed [15:0] x_Input;
    reg signed [15:0] y_Input;
    wire signed [34:0] product;
    
    //adder
    reg signed [34:0] reg_Input;
    reg signed [31:0] post_mul_Input;
    wire signed [34:0] sum;
    
    mult mul(.x_Input(x_Input), .y_Input(y_Input), .product(product));
    adder add(.post_mul_Input(post_mul_Input), .reg_Input(reg_Input), .sum(sum));

    
    initial begin
    
        #10
        
        x_Input =   16'b0000000000000100;
        y_Input =   16'b0000000000000001;
        
        #10
        
        post_mul_Input = product;
        reg_Input = 32'b00000000000000000000000000000001;
        
     end   
        
        

endmodule
