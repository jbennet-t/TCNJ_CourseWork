`timescale 1ns / 1ps

module mult
(
    input signed [15:0] x_Input,
    input signed [15:0] y_Input,
    output signed [34:0] product );
    
    assign product[34:0] = (x_Input[15:0] * y_Input[15:0]);

endmodule