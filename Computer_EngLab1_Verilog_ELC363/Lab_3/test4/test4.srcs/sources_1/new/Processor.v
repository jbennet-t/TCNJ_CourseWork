`timescale 1ns / 1ps
module Processor(	
	input CLK, 
	input reset,
	//input RWn,
	output reg [2:0] OP_CODE,
	output [4:0] state,
	output reg [11:0] PC, A, MA,
	output reg [15:0] IR, AC, MD,
		
	reg MD_E, IR_E, AC_E, MA_E, PC_E, MA_C, A_C, MEM_C, AM_BIT,
	reg [1:0] PC_C,
	reg [2:0] ALU_C,
	reg C,
	reg [4:0] PRState, NXState,
	reg [16:0] T1 // temp reg
	);
	
	//all states for state machine
 	parameter S00 = 5'h00, S01 = 5'h01, S02 = 5'h02, S03 = 5'h03,
           	S04 = 5'h04, S05 = 5'h05, S06 = 5'h06, S07 = 5'h07, S08 = 5'h08,
           	S09 = 5'h09, S10 = 5'h0A, S11 = 5'h0B, S12 = 5'h0C, S13 = 5'h0D,
           	S14 = 5'h0E, S15 = 5'h0F, S16 = 5'h10; 
           	
	//parameters for op codes for easy understanding of code
 	parameter NOT = 3'b000, ADC = 3'b001, JPA = 3'b010,
           	INCA = 3'b011, STA = 3'b100, LDA = 3'b101; 
           	
	//used for easy zeroing of registers
	parameter zero = 16'b0000000000000000;
	
	//memory register
	reg [15:0] memory [0:11];
	
	//Fills memory register with program from memory file
	initial begin
		
           
	memory[0] = 16'b1011000000001010;
    memory[1] = 16'b1001000000001011;
    memory[2] = 16'b1010000000001010;
    memory[3] = 16'b0110000000000000;
    memory[4] = 16'b1000000000001010;
    memory[5] = 16'b1010000000001011;
    memory[6] = 16'b0110000000000000;
    memory[7] = 16'b1000000000001011;
    memory[8] = 16'b0000000000000000;
    memory[9] = 16'b0100000000000000;
    memory[10] = 16'b0000000000000000;
    memory[11] = 16'b0000000000001100;

	
	end

//---------------------------------------------------------------------------
//Datapath Module
//---------------------------------------------------------------------------
	always @ (posedge CLK) begin
    	
    	if(reset == 1'b1) begin //resets all registers to zero
    	
        	MD = 16'b0000000000000000; 
        	IR = 16'b0000000000000000;
        	AC = 16'b0000000000000000;
        	MA = 12'b000000000000;
        	PC = 12'b000000000000;
        	T1 = 16'b0000000000000000; //temp 1
        	A = 12'b000000000000;
        	
    	end
    	
    	else begin
    	// IF MD_E or IR_E ===> RWn ==> READ Enabled
        	if(MD_E == 1'b1) begin
             	MD = memory[A];
        	end
        	
        	if(IR_E == 1'b1) begin
            	IR = memory[A];
        	end
    	
//------------------------
//ALU Sub Module
//------------------------
        	if(AC_E == 1'b1) begin
            	case(ALU_C)
            	   	3'b000 : T1 = ~AC; //NOT
                	3'b001 : T1 = AC + MD + C; //ADC
                	3'b010 : T1 = AC + 1'b1; //INCA
                	3'b011 : T1 = zero; //Z - STUR and clear
                	3'b100 : T1 = MD; //Pb
            	endcase
        	end
//------------------------
      
        	if(MA_E == 1'b1) begin
            	case(MA_C) //ma mux
                	1'b0   : MA = IR;
                	1'b1   : MA = MD;
            	endcase
        	end
        	if(PC_E == 1'b1) begin
            	case(PC_C)// pc mux
                	2'b00  : PC = PC + 1'b1;
                	2'b01  : PC = IR;
                	2'b10  : PC = MD;
            	endcase
        	end
        	
        	case(A_C) //A mux
            	1'b0   : A = PC;
            	1'b1   : A = MA;
        	endcase
       	
        	case(MEM_C)
            	1'b1   : memory[A] = AC;
        	endcase
    	end
    	
    	AC = T1;
    	C = T1[16];
    	OP_CODE = IR[15:13];
    	AM_BIT = IR[12];
	end	
	
	
//---------------------------------------------------------------------------
//Controller Module
//---------------------------------------------------------------------------
	
	//sets state machine to state zero on reset, and defines state transition
	always @ (posedge CLK) begin
    	if(reset == 1'b1) begin
        	PRState = S00;
    	end
    	
    	else begin
        	PRState = NXState;
    	end
	end
	
	//states
	always @ (PRState) begin
    	//initalizing enables and muxes to 0
    	MD_E = 1'b0;
    	IR_E = 1'b0;
    	AC_E = 1'b0;
    	MA_E = 1'b0;
    	PC_E = 1'b0;
    	MA_C = 1'b0;
    	A_C =  1'b0;
    	PC_C = 1'b00;
    	MEM_C = zero;
    	
    	//only changing muxes and enables as neccesary, otherwise "don't care" values
        	if(PRState == S00) begin
            	MEM_C = 1'b0;
            	A_C = 1'b0;
            	IR_E = 1'b1;
            	end
        	if(PRState == S01) begin
            	IR_E = 1'b1;
            	PC_C = 2'b00;
            	PC_E = 1'b1;
            	end
        	if(PRState == S02) begin
            	ALU_C = 3'b000;
            	AC_E = 1'b1;
            	end
        	if(PRState == S03) begin
            	ALU_C = 3'b010;
            	AC_E = 1'b1;
            	end
        	if(PRState == S04) begin
            	MA_C = 1'b0;
            	MA_E = 1'b1;
            	A_C = 1'b1;
            	end
        	if(PRState == S05) begin
            	MEM_C = 1'b0;
            	A_C = 1'b1;
            	MD_E = 1'b1;
            	end
        	if(PRState == S06) begin
            	PC_C = 2'b10;
            	PC_E = 1'b1;
            	end
        	if(PRState == S07) begin
            	PC_C = 2'b01;
            	PC_E = 1'b1;
            	end
        	if(PRState == S08) begin
            	MA_C = 1'b0;
            	MA_E = 1'b1;
            	A_C = 1'b1;
        	end
        	if(PRState == S09) begin
            	MEM_C = 1'b0;
            	MD_E = 1'b1;
            	end
        	if(PRState == S10) begin
            	MA_C = 2'b1;
            	MA_E = 1'b1;
        	end
        	if(PRState == S11) begin
            	MEM_C = 1'b1;
            	ALU_C = 3'b011;
            	AC_E = 1'b1;
            	A_C = 1'b1;
            	end
        	if(PRState == S12) begin
            	MEM_C = 1'b0;
            	A_C = 1'b1;
            	MD_E = 1'b1;
            	end
        	if(PRState == S13) begin
            	MA_C = 1'b1;
            	MA_E = 1'b1;
            	A_C = 1'b1;
            	end
        	if(PRState == S14) begin
            	MEM_C = 1'b0;
            	A_C = 1'b1;
            	MD_E = 1'b1;
            	end
        	if(PRState == S15) begin
            	ALU_C = 3'b001;
            	AC_E = 1'b1;
            	end
        	if(PRState == S16) begin
            	ALU_C = 3'b100;
            	AC_E = 1'b1;
            	end
	end
	
	//sets next state
	always @ (posedge CLK) begin
    	case(PRState)
        	S00 : NXState = S01;
        	S01 : begin
        	
        	if(OP_CODE == NOT) begin
            	NXState = S02;
        	end
        	else if(OP_CODE == INCA) begin
            	NXState = S03;
        	end
        	
        	else if(OP_CODE != JPA) begin
            	NXState = S08;
        	end
        	
        	else if(AC < zero) begin
            	NXState = S00;
        	end
        	
        	else if(AM_BIT == 1'b1) begin
            	NXState = S04;
        	end
        	else if(AM_BIT == 1'b0) begin
           	NXState = S07;
        	end
        	
    	end
    	
        	S02 : NXState = S00;
        	S03 : NXState = S00;
        	S04 : NXState = S05;
        	S05 : NXState = S06;
        	S06 : NXState = S00;
        	S07 : NXState = S00;
        	S08 : begin
        	if(OP_CODE != STA) begin
            	NXState = S12;
         	end
            	
        	else if(AM_BIT == 1'b1) begin
            	NXState = S09;
        	end
        	
        	else 
        	   NXState = S11;
        	end
        	
        	S09 : NXState = S10;
        	S10 : NXState = S11;
        	S11 : NXState = S00;
        	S12 : begin
        	
        	if(AM_BIT == 1'b1) begin
            	NXState = S13;
        	end
        	
        	else if(OP_CODE == ADC) begin
            	NXState = S15;
        	end
        	
        	else NXState = S16;
        	end
        	
        	S13 : NXState = S14;
        	S14 : begin
        	if(OP_CODE == ADC) begin
            	NXState = S15;
        	end
        	
        	else NXState = S16;
        	end
        	
        	S15 : NXState = S00;
        	S16 : NXState = S00;
    	endcase
	end
	
	assign state = PRState;
endmodule
