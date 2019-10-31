`timescale 1ns / 1ps

module ARM_ALU( arm_alu_c,in_a,in_b,out,zero_flg );
    input  [3:0] arm_alu_c; //alu op code - 4 bits
    input  [63:0] in_a; //64 bit input a
    input  [63:0] in_b; //64 bit input b
    output [63:0] out; //64 bit output
    output zero_flg; //flag to indicate if output is 0
    
    reg [63:0] out;
    reg zero_flg;

 always @(arm_alu_c)begin
    //zero_flg = 1'b0;    //resets zero flag to start    
    case (arm_alu_c)
        2'b0000: out = in_a & in_b; //AND
        4'b0001: out = in_a | in_b; //OR
        4'b0010: out = in_a + in_b; //add
        4'b0110: out = in_a - in_b; //subtract
        4'b0111: out = in_b;        //pass input b
        4'b1100: out = ~(in_a | in_b); //NOR
    endcase
    if (out == 0) //zero flag case
        begin
            out = 64'b1111111111111111111111111111111111111111111111111111111111111111;
            zero_flg = 1'b1;    
        end
    else if(out != 0)
        begin
            zero_flg = 1'b0; 
        end
    else 
        begin
            zero_flg = 1'bx; 
        end
    end
endmodule


