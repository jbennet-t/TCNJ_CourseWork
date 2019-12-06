`timescale 1ns / 1ps

//--------------------------------------------------------------------------------------------------
//Overall ARM CPU Module
//--------------------------------------------------------------------------------------------------

module ARM_CPU
(
  input Clk,
  input [31:0] Instruction_32, //32 bit instruction
  output reg [63:0] PC, //program counter
  
  input [63:0] Reg_Data1, //regdata1 output from register blk
  input [63:0] Reg_Data2, //regdata1 output from register blk
  output reg [4:0] Read_Reg1, //register1, instruction bits 9-5
  output reg [4:0] Read_Reg2, //register2, instruction bits 20-16
  output reg [4:0] Write_Reg,//register being written to
  
  output reg Reg2Loc_C, //reg2loc control line
  output reg RegWrite_C, //regwrite control line
  output reg MemRead_C, //memRead control line
  output reg MemWrite_C, //memWrite control line
  output reg Branch_C, //branch control line
  
  output [63:0] ALU_Output, //output of ALU
  input [63:0] data_mem_out, //output from data memory blk
  output reg [63:0] Write_RegData //output of last mux being written to register
);

  reg [10:0] tempInstruction; //temp register for 31:21
  reg [4:0] tempReg1; //temp register for 20:16
  reg [4:0] tempReg2;//temp register for 4:0

  reg MemToReg_C;
  reg ALU_Src_C;
  reg [1:0] ALU_Op_C;

  wire ALU_Zero_temp;
  reg [3:0] ALU_C_temp;
  reg [63:0] ALU_in2_temp;
  reg[63:0] immediate_temp;

  reg [63:0] shift_Immediate_temp;

  reg jump_C;
  wire [63:0] PCnext;
  wire nextPCZero;
  wire [63:0] shiftPC;
  wire shiftPCZero;
  reg tempBranchZero;
  reg [63:0] next2PC_reg;


// Program Counter MUX----------------------------------------
    always @(*) begin   
        if (jump_C == 0) begin        
            next2PC_reg = PCnext;       
        end
                        
        else begin       
            next2PC_reg = shiftPC;        
        end
    end
    

//Pre-Registers MUX-------------------------------------------
    always @(*) begin
      if (Reg2Loc_C == 0) begin
        Read_Reg2 = tempReg1;
      end
   
      else begin  
        Read_Reg2 = tempReg2;  
      end
    end


//Pre ALU MUX--------------------------------------------------
    always @(*) begin
      if (ALU_Src_C == 0) begin
        ALU_in2_temp = Reg_Data2;  
      end
        
      else begin
        ALU_in2_temp = immediate_temp;
      end
    end

//Post-Data Memory MUX------------------------------------------
    always @(*) begin
      if (MemToReg_C == 0) begin
        Write_RegData = ALU_Output; 
      end
       
      else begin 
        Write_RegData = data_mem_out;
      end
    end    
    
//Sign Extension------------------------------------------------

      always @(*) begin
        if (Instruction_32[31:26] == 6'b000101) begin // B
          immediate_temp[25:0] = Instruction_32[25:0];
          immediate_temp[63:26] = {64{immediate_temp[25]}};
        end 
        
        else if (Instruction_32[31:24] == 8'b10110100) begin // CBZ
          immediate_temp[19:0] = Instruction_32[23:5];
          immediate_temp[63:20] = {64{immediate_temp[19]}};
        end 
        
        else begin // D Type
          immediate_temp[9:0] = Instruction_32[20:12];
          immediate_temp[63:10] = {64{immediate_temp[9]}};
        end
      end


//Shift Left 2 Block-------------------------------------------

    always @(immediate_temp) begin
  
      shift_Immediate_temp = immediate_temp << 2;
  
    end


//ALU Control Block------------------------------------------
    always @(ALU_Op_C or tempInstruction) begin 
      case (ALU_Op_C)
  
        2'b00 : ALU_C_temp = 4'b0010;
        2'b01 : ALU_C_temp = 4'b0111;
        2'b10 : begin
  
          case (tempInstruction)
            11'b10001011000 : ALU_C_temp = 4'b0010; // ADD  
            11'b11001011000 : ALU_C_temp = 4'b0110; // SUB  
            11'b10001010000 : ALU_C_temp = 4'b0000; // AND
            11'b10101010000 : ALU_C_temp = 4'b0001; // ORR 
          endcase
        end 
      endcase
    end
    
// Main ALU output from Registers to Data Memory
  ALU aluResult(Reg_Data1, ALU_in2_temp, ALU_C_temp, ALU_Output, ALU_Zero_temp);

// ALU instance to perform add operation for PC for +4
  ALU adderNextPC(PC, 64'h00000004, 4'b0010, PCnext, nextPCZero);
  
// ALU instance to perform add for shifted PC
  ALU adderShiftPC(PC, shift_Immediate_temp, 4'b0010, shiftPC, shiftPCZero);


//initialization for CPU
  initial begin
    PC = 0;
    Reg2Loc_C = 1'bz;
    MemToReg_C = 1'bz;
    RegWrite_C = 1'bz;
    MemRead_C = 1'bz;
    MemWrite_C = 1'bz;
    ALU_Src_C = 1'bz;
    Branch_C = 1'b0;
    tempBranchZero = ALU_Zero_temp & Branch_C;
    jump_C = tempBranchZero;
  end


  // set Control lines 
  always @(posedge Clk or Instruction_32) begin

    // Set the PC to the jumped value
    if (jump_C == 1'b1) begin
      PC = #1 next2PC_reg - 4;
    end

    // Parse the incoming instruction for a given PC
    tempInstruction = Instruction_32[31:21];
    tempReg1 = Instruction_32[20:16];
    tempReg2 = Instruction_32[4:0];
    Read_Reg1 = Instruction_32[9:5];
    Write_Reg = Instruction_32[4:0];

    if (Instruction_32[31:24] == 8'b10110100) begin // Control bits for CBZ
      Reg2Loc_C = 1'b0;
      MemToReg_C = 1'b0;
      RegWrite_C = 1'b0;
      MemRead_C = 1'b0;
      MemWrite_C = 1'b0;
      ALU_Src_C = 1'b0;
      ALU_Op_C = 2'b01;
      Branch_C = 1'b1;
    end 
    
    else begin // R-Type Control Bits
      case (tempInstruction)
        11'b11111000010 : begin // Control bits for LDUR
          Reg2Loc_C = 1'bx;
          MemToReg_C = 1'b1;
          RegWrite_C = 1'b1;
          MemRead_C = 1'b1;
          MemWrite_C = 1'b0;
          ALU_Src_C = 1'b1;
          Branch_C = 1'b0;
          ALU_Op_C = 2'b00;
        end

        11'b11111000000 : begin //Control bits for STUR
          // Control Bits
          Reg2Loc_C = 1'b1;
          MemToReg_C = 1'bx;
          RegWrite_C = 1'b0;
          MemRead_C = 1'b0;
          MemWrite_C = 1'b1;
          ALU_Src_C = 1'b1;
          Branch_C = 1'b0;
          ALU_Op_C = 2'b00;
        end

        11'b10001011000 : begin //Control bits for ADD
          Reg2Loc_C = 1'b0;
          MemToReg_C = 1'b0;
          RegWrite_C = 1'b1;
          MemRead_C = 1'b0;
          MemWrite_C = 1'b0;
          ALU_Src_C = 1'b0;
          Branch_C = 1'b0;
          ALU_Op_C = 2'b10;
        end

        11'b11001011000 : begin //Control bits for SUB
          Reg2Loc_C = 1'b0;
          MemToReg_C = 1'b0;
          RegWrite_C = 1'b1;
          MemRead_C = 1'b0;
          MemWrite_C = 1'b0;
          ALU_Src_C = 1'b0;
          Branch_C = 1'b0;
          ALU_Op_C = 2'b10;
        end

        11'b10001010000 : begin //Control bits for AND
          Reg2Loc_C = 1'b0;
          MemToReg_C = 1'b0;
          RegWrite_C = 1'b1;
          MemRead_C = 1'b0;
          MemWrite_C = 1'b0;
          ALU_Src_C = 1'b0;
          Branch_C = 1'b0;
          ALU_Op_C = 2'b10;
        end

        11'b10101010000 : begin //Control bits for ORR
          Reg2Loc_C = 1'b0;
          MemToReg_C = 1'b0;
          RegWrite_C = 1'b1;
          MemRead_C = 1'b0;
          MemWrite_C = 1'b0;
          ALU_Src_C = 1'b0;
          Branch_C = 1'b0;
          ALU_Op_C = 2'b10;
        end
      endcase
    end


    //Determine whether to branch
    tempBranchZero = ALU_Zero_temp & Branch_C;
    jump_C = tempBranchZero;

    // For non-branch code, set the next sequential PC value
    if (jump_C == 1'b0) begin
    	PC <= #1 next2PC_reg;
    end
  end
endmodule


//--------------------------------------------------------------------------------------------------
//ALU Module
//--------------------------------------------------------------------------------------------------
module ALU
(
  input [63:0] A_in,
  input [63:0] B_in,
  input [3:0] ALU_C,
  output reg [63:0] ALU_Result,
  output reg Zero_Flag
);

  always @(A_in or B_in or ALU_C) begin
    case (ALU_C)
      4'b0000 : ALU_Result = A_in & B_in; //AND
      4'b0001 : ALU_Result = A_in | B_in; //OR
      4'b0010 : ALU_Result = A_in + B_in; //ADD
      4'b0110 : ALU_Result = A_in - B_in; //SUB
      4'b0111 : ALU_Result = B_in; //pass input b
      4'b1100 : ALU_Result = ~(A_in | B_in); //NOR
    endcase

    if (ALU_Result == 0) 
      begin
        Zero_Flag = 1'b1;
      end 
    else begin
      Zero_Flag = 1'b0;
    end
  end
endmodule


//--------------------------------------------------------------------------------------------------
//Instruction Memory Module
//--------------------------------------------------------------------------------------------------
module Instruction_Memory
(
  input [63:0] PC,
  output reg [31:0] CPU_Instruction
);

    integer i;
    integer j=0;
  reg [8:0]Instruction_Memory[63:0];
  reg [8:0] Data[63:0];

  initial begin
 $readmemb("IM.mem", Instruction_Memory);
  begin
      for(i=0; i<64; i=i+1)
      begin
          begin
              Data[i] = Instruction_Memory[j];
              j=j+1;
          end
      end
  end
end


  always @(PC) 
  begin
    CPU_Instruction[8:0] = Data[PC+3];
    CPU_Instruction[16:8] = Data[PC+2];
    CPU_Instruction[24:16] = Data[PC+1];
    CPU_Instruction[31:24] = Data[PC];
  end
endmodule


//--------------------------------------------------------------------------------------------------
//Registers Module
//--------------------------------------------------------------------------------------------------
module Registers
(
  input [4:0] readreg1,
  input [4:0] readreg2,
  input [4:0] writeReg,
  input [63:0] writeData,
  input RegWrite_C,
  output reg [63:0] regData1,
  output reg [63:0] regData2
);

  reg [63:0] Data[31:0];//64 line 2D array of 32 bits

  integer initCount;

  initial begin
    for (initCount = 0; initCount < 31; initCount = initCount + 1) begin
      Data[initCount] = initCount;
    end
    Data[31] = 64'h00000000;
  end

  always @(readreg1, readreg2, writeReg, writeData, RegWrite_C) begin
    regData1 = Data[readreg1];
    regData2 = Data[readreg2];

    if (RegWrite_C == 1) begin
      Data[writeReg] = writeData;
    end
  end
endmodule


//--------------------------------------------------------------------------------------------------
//Data Memory Module
//--------------------------------------------------------------------------------------------------
module Data_Memory
(
  input [63:0] address_in,
  input [63:0] inputData,
  input memRead_inControl,
  input memWrite_inControl,
  output reg [63:0] outputData
);

  reg [63:0] Data[31:0]; //64 line 2D array of 32 bits

  integer initCount;

  initial begin
    for (initCount = 0; initCount < 32; initCount = initCount + 1) begin
      Data[initCount] = initCount * 100;
    end
  end

    always @(address_in, inputData, memRead_inControl, memWrite_inControl) begin
      if (memWrite_inControl == 1) begin
        Data[address_in] = inputData;
      end

      if (memRead_inControl == 1) begin
        outputData = Data[address_in];
      end
    end
endmodule