`timescale 1ns / 1ps
// Create Date: 09/19/2019 01:35:13 PM
// Module Name: LA_tb
//Authors: Jordan Sinoway, Condor Gao



module LA_tb;

  reg [63:0] a;
  reg [63:0] b; //inputs

  wire [63:0] sum;
  wire c;//ouputs

  ripple_adder_64_2bit_look_ahead uut(.A(a), .B(b), .SUM(sum), .CARRY_OUT(c));// instantiate unit under test (UUT)


  initial begin
		
		a = 64'b0000000000000000000000000000000000000000000000000000000001111101;
		b = 64'b0000000000000000000000000000000000000000000000000000000000000010;
		
		#25
		
		a = 10;
		b = 12;
		
    end
    initial #50 $finish;
endmodule
