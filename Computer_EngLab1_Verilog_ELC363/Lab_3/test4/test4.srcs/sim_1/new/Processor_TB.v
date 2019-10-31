`timescale 1ns / 1ps
module Processor_TB;
	reg CLK;
	reg reset;
	//reg RWn;
	wire [2:0] OP_CODE;
	wire [4:0] state;
	wire [11:0] PC, A, MA;
	wire [15:0] IR, AC, MD;
	
	reg [15:0] memory [0:11];
	parameter zero = 16'b0000000000000000; //easy zero set instead of long zero
	
	//initalizing unit under test (uut)
	Processor uut1 ( 
    	.CLK(CLK),
    	.reset(reset),
    	//.RWn(RWn),
    	.state(state),
    	.OP_CODE(OP_CODE),
    	.IR(IR),
    	.PC(PC),
    	.A(A),
    	.AC(AC),
    	.MD(MD),
    	.MA(MA));
    	
	initial begin
    	$readmemh("C:/Users/sinow/Documents/ELC363-Lab/test4/data.mem", memory);
    	/*
        	memory[0]=16'b0000000000000001;//Not
         	memory[1]=16'b0010000000000010;//ADC
         	memory[2]=16'b0011000000000010;//ADC w AM=1
         	memory[3]=16'b0100000000000011;//JPA
         	memory[4]=16'b0101000000000011;//JPA w AM=1
         	memory[5]=16'b0110000000000100;//INCA
         	memory[6]=16'b1000000000000101;//STA
         	memory[7]=16'b1001000000000101;//STA w AM=1
         	memory[8]=16'b1010000000000111;//LDA
         	memory[9]=16'b1011000000000111;//LDA w AM=1
         	*/
    	
    	CLK = 1; // initialize clock
    	reset = 1; // set reset
    	#1000 //wait 1000 for everything to catch up
    	
    	reset = 0; //disables reset
	end
	always @(CLK)#500 CLK <= ~CLK; // sets clock to pulse every 500
	
	//always @(RWn)#500 CLK <= ~CLK;
endmodule
