`timescale 1ns / 1ps
// Create Date: 09/23/2019 10:35:20 PM
// Module Name: ba64_tb
// Authors: Jordan Sinoway, Condor Gao



module ba64_tb;

  reg [63:0] a;
  reg [63:0] b; //inputs

  wire [63:0] sum; //outputs


  behavioral_adder_64 uut(.a(a), .b(b), .sum(sum));// instantiate unit under test (UUT)


  initial begin
				
		
		
		a = 64'b0000000000000000000000000000000000000000000000000000000001111101;
		b = 64'b0000000000000000000000000000000000000000000000000000000000000010;
	    
	   #1
	    
	    a = 12;
	    b = 10;
	    
	   #15
	   
	   a = 15;
	   b = 1;
	    

		
    end
    initial #50 $finish;
endmodule
