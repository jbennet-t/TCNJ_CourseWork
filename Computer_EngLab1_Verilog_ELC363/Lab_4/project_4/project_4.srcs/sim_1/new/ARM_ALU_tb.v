`timescale 1ns / 1ps

module ARM_ALU_tb;

    reg [3:0] arm_alu_c; //alu op code
    reg [63:0] in_a; //64 bit input a 
    reg [63:0] in_b; //64 bit input b
    
    wire [63:0]out; //64 bit output
    wire zero_flg;
    
    ARM_ALU uut(.arm_alu_c(arm_alu_c),.in_a(in_a),.in_b(in_b),.out(out),.zero_flg(zero_flg)); //instantiating unit under test (uut)
    
    initial begin 
        arm_alu_c = 4'b0000; //AND
        in_a = 3; 
        in_b = 2; //output should be ...02
        #10      
        arm_alu_c = 4'b0001; //OR
        in_a = 4;
        in_b = 3; //output should be ...07
        #10
        arm_alu_c = 4'b0010; //ADD
        in_a = 7;
        in_b = 1; //output should be ...08
        #10
        arm_alu_c = 4'b0110; //SUB
        in_a = 9;
        in_b = 1; //output should be ...08
        #10
        arm_alu_c = 4'b0111; //Pass input b
        in_a = 31;
        in_b = 1;  //output should be ...01
        #10
        arm_alu_c = 4'b1100; //NOR
        in_a = 8;
        in_b = 7; //output should be ...f0
        #10
        arm_alu_c = 4'b0000; //AND
        in_a = 20; 
        in_b = 16; //output should be ...015
        #10      
        arm_alu_c = 4'b0001; //OR
        in_a = 5;
        in_b = 10; //output should be ...031
        #10
        arm_alu_c = 4'b0010; //ADD
        in_a = 31;
        in_b = 1; //output should be ...032
        #10
        arm_alu_c = 4'b0110; //SUB
        in_a = 27;
        in_b = 9; //output should be ...016
        #10
        arm_alu_c = 4'b0111; //Pass input b
        in_a = 64'b1111111111111111111111111111111111111111111111111111111111111111;
        in_b = 0;  //output should be ...00
        #10
        arm_alu_c = 4'b1100; //NOR
        in_a = 1;
        in_b = 0; //output should be ...fe
        
    end
    initial #120 $finish;
endmodule


