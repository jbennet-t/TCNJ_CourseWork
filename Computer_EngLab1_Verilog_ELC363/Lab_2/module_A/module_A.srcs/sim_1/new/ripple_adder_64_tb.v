`timescale 1ns / 1ps

// Create Date: 09/13/2019 01:25:01 PM
// Module Name: ripple_adder_64_tb
// Authors: Jordan Sinoway, Condor Gao

module ripple_adder_64_tb;

  reg [63:0] a;
  reg [63:0] b; //inputs

  wire [63:0] sum;
  wire c;//outputs

  ripple_adder_64 uut(.a(a), .b(b), .sum(sum), .c(c));// instantiate unit under test (UUT)


  initial begin
		
		
		
				
		a = 64'b0000000000000000000000000000000000000000000000000000000001111101;
		b = 64'b0000000000000000000000000000000000000000000000000000000000000010;
		//b = {60'b0, 1111};
		
		
		#25
		a = 12;
		b = 20;
		
    end
    initial #50 $finish;
endmodule