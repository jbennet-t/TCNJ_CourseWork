`timescale 1ns / 1ps


module CPU_TEST;

  reg Clk; //clock
  wire [31:0] instructionOut;//connecting Instruction mem to CPU
  wire [63:0] instructionPC;

  wire [4:0] Read_Reg1;//connecting registers to CPU
  wire [4:0] Read_Reg2;
  wire [4:0] Write_Reg;
  wire [63:0] Write_RegData;
  wire [63:0] Reg_Data1;
  wire [63:0] Reg_Data2;

  wire [63:0] data_mem_out;//connecting data mem to CPU
  wire [63:0] ALU_Output;

  wire Reg2Loc_C;//connecting control lines to mem
  wire RegWrite_C;
  wire MemRead_C;
  wire MemWrite_C;
  wire Branch_C;


 //instantiating instruction mem module
  Instruction_Memory instr_mem(instructionPC,instructionOut);

 //instantiating register module
  Registers regist(Read_Reg1,Read_Reg2,Write_Reg,Write_RegData,RegWrite_C,Reg_Data1,Reg_Data2);

 //instantiating data mem
  Data_Memory dataMem(ALU_Output,Reg_Data2,MemRead_C,MemWrite_C,data_mem_out);

 //instantiating main CPU, unit under test
  ARM_CPU uut(
    .Clk(Clk),
    .Instruction_32(instructionOut),  
    .PC(instructionPC), 
    
    .Reg_Data1(Reg_Data1),
    .Reg_Data2(Reg_Data2), 
    .Read_Reg1(Read_Reg1),
    .Read_Reg2(Read_Reg2),
    .Write_Reg(Write_Reg),

    .Reg2Loc_C(Reg2Loc_C),
    .RegWrite_C(RegWrite_C),
    .MemRead_C(MemRead_C),
    .MemWrite_C(MemWrite_C),
    .Branch_C(Branch_C),

    .ALU_Output(ALU_Output),
    .data_mem_out(data_mem_out),
    .Write_RegData(Write_RegData));


//starting clock
  initial begin
    Clk = 1'b0;

    #10 $finish;
  end


//setting clock to alternate
  always begin
    #1 Clk = ~Clk;

  end
endmodule
