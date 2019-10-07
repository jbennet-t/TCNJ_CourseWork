`timescale 1ns / 1ps

// Create Date: 09/19/2019 12:41:05 PM
// Module Name: behavioral_adder_64
// Authors: Jordan Sinoway, Condor Gao



module behavioral_adder_64(input [63:0] a, input [63:0] b, output [64:0] sum);

assign sum = (a + b);

endmodule
