// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Sun Oct 27 13:55:26 2019
// Host        : DESKTOP-KIRCJ76 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/sinow/Documents/ELC363-Lab/test4/test4.sim/sim_1/impl/timing/xsim/Processor_TB_time_impl.v
// Design      : Processor
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module RAM32M_UNIQ_BASE_
   (DOA,
    DOB,
    DOC,
    DOD,
    ADDRA,
    ADDRB,
    ADDRC,
    ADDRD,
    DIA,
    DIB,
    DIC,
    DID,
    WCLK,
    WE);
  output [1:0]DOA;
  output [1:0]DOB;
  output [1:0]DOC;
  output [1:0]DOD;
  input [4:0]ADDRA;
  input [4:0]ADDRB;
  input [4:0]ADDRC;
  input [4:0]ADDRD;
  input [1:0]DIA;
  input [1:0]DIB;
  input [1:0]DIC;
  input [1:0]DID;
  input WCLK;
  input WE;

  wire ADDRA0;
  wire ADDRA1;
  wire ADDRA2;
  wire ADDRA3;
  wire ADDRA4;
  wire ADDRB0;
  wire ADDRB1;
  wire ADDRB2;
  wire ADDRB3;
  wire ADDRB4;
  wire ADDRC0;
  wire ADDRC1;
  wire ADDRC2;
  wire ADDRC3;
  wire ADDRC4;
  wire ADDRD0;
  wire ADDRD1;
  wire ADDRD2;
  wire ADDRD3;
  wire ADDRD4;
  wire DIA0;
  wire DIA1;
  wire DIB0;
  wire DIB1;
  wire DIC0;
  wire DIC1;
  wire DID0;
  wire DID1;
  wire DOA0;
  wire DOA1;
  wire DOB0;
  wire DOB1;
  wire DOC0;
  wire DOC1;
  wire DOD0;
  wire DOD1;
  wire WCLK;
  wire WE;

  assign ADDRA0 = ADDRA[0];
  assign ADDRA1 = ADDRA[1];
  assign ADDRA2 = ADDRA[2];
  assign ADDRA3 = ADDRA[3];
  assign ADDRA4 = ADDRA[4];
  assign ADDRB0 = ADDRB[0];
  assign ADDRB1 = ADDRB[1];
  assign ADDRB2 = ADDRB[2];
  assign ADDRB3 = ADDRB[3];
  assign ADDRB4 = ADDRB[4];
  assign ADDRC0 = ADDRC[0];
  assign ADDRC1 = ADDRC[1];
  assign ADDRC2 = ADDRC[2];
  assign ADDRC3 = ADDRC[3];
  assign ADDRC4 = ADDRC[4];
  assign ADDRD0 = ADDRD[0];
  assign ADDRD1 = ADDRD[1];
  assign ADDRD2 = ADDRD[2];
  assign ADDRD3 = ADDRD[3];
  assign ADDRD4 = ADDRD[4];
  assign DIA0 = DIA[0];
  assign DIA1 = DIA[1];
  assign DIB0 = DIB[0];
  assign DIB1 = DIB[1];
  assign DIC0 = DIC[0];
  assign DIC1 = DIC[1];
  assign DID0 = DID[0];
  assign DID1 = DID[1];
  assign DOA[1] = DOA1;
  assign DOA[0] = DOA0;
  assign DOB[1] = DOB1;
  assign DOB[0] = DOB0;
  assign DOC[1] = DOC1;
  assign DOC[0] = DOC0;
  assign DOD[1] = DOD1;
  assign DOD[0] = DOD0;
  RAMD32 #(
    .INIT(32'h000000A2),
    .IS_CLK_INVERTED(1'b0)) 
    RAMA
       (.CLK(WCLK),
        .I(DIA0),
        .O(DOA0),
        .RADR0(ADDRA0),
        .RADR1(ADDRA1),
        .RADR2(ADDRA2),
        .RADR3(ADDRA3),
        .RADR4(ADDRA4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h000000B7),
    .IS_CLK_INVERTED(1'b0)) 
    RAMA_D1
       (.CLK(WCLK),
        .I(DIA1),
        .O(DOA1),
        .RADR0(ADDRA0),
        .RADR1(ADDRA1),
        .RADR2(ADDRA2),
        .RADR3(ADDRA3),
        .RADR4(ADDRA4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000800),
    .IS_CLK_INVERTED(1'b0)) 
    RAMB
       (.CLK(WCLK),
        .I(DIB0),
        .O(DOB0),
        .RADR0(ADDRB0),
        .RADR1(ADDRB1),
        .RADR2(ADDRB2),
        .RADR3(ADDRB3),
        .RADR4(ADDRB4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h000008B7),
    .IS_CLK_INVERTED(1'b0)) 
    RAMB_D1
       (.CLK(WCLK),
        .I(DIB1),
        .O(DOB1),
        .RADR0(ADDRB0),
        .RADR1(ADDRB1),
        .RADR2(ADDRB2),
        .RADR3(ADDRB3),
        .RADR4(ADDRB4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMC
       (.CLK(WCLK),
        .I(DIC0),
        .O(DOC0),
        .RADR0(ADDRC0),
        .RADR1(ADDRC1),
        .RADR2(ADDRC2),
        .RADR3(ADDRC3),
        .RADR4(ADDRC4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMC_D1
       (.CLK(WCLK),
        .I(DIC1),
        .O(DOC1),
        .RADR0(ADDRC0),
        .RADR1(ADDRC1),
        .RADR2(ADDRC2),
        .RADR3(ADDRC3),
        .RADR4(ADDRC4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMS32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMD
       (.ADR0(ADDRD0),
        .ADR1(ADDRD1),
        .ADR2(ADDRD2),
        .ADR3(ADDRD3),
        .ADR4(ADDRD4),
        .CLK(WCLK),
        .I(DID0),
        .O(DOD0),
        .WE(WE));
  RAMS32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMD_D1
       (.ADR0(ADDRD0),
        .ADR1(ADDRD1),
        .ADR2(ADDRD2),
        .ADR3(ADDRD3),
        .ADR4(ADDRD4),
        .CLK(WCLK),
        .I(DID1),
        .O(DOD1),
        .WE(WE));
endmodule

module RAM32M_HD11
   (DOA,
    DOB,
    DOC,
    DOD,
    ADDRA,
    ADDRB,
    ADDRC,
    ADDRD,
    DIA,
    DIB,
    DIC,
    DID,
    WCLK,
    WE);
  output [1:0]DOA;
  output [1:0]DOB;
  output [1:0]DOC;
  output [1:0]DOD;
  input [4:0]ADDRA;
  input [4:0]ADDRB;
  input [4:0]ADDRC;
  input [4:0]ADDRD;
  input [1:0]DIA;
  input [1:0]DIB;
  input [1:0]DIC;
  input [1:0]DID;
  input WCLK;
  input WE;

  wire ADDRA0;
  wire ADDRA1;
  wire ADDRA2;
  wire ADDRA3;
  wire ADDRA4;
  wire ADDRB0;
  wire ADDRB1;
  wire ADDRB2;
  wire ADDRB3;
  wire ADDRB4;
  wire ADDRC0;
  wire ADDRC1;
  wire ADDRC2;
  wire ADDRC3;
  wire ADDRC4;
  wire ADDRD0;
  wire ADDRD1;
  wire ADDRD2;
  wire ADDRD3;
  wire ADDRD4;
  wire DIA0;
  wire DIA1;
  wire DIB0;
  wire DIB1;
  wire DIC0;
  wire DIC1;
  wire DID0;
  wire DID1;
  wire DOA0;
  wire DOA1;
  wire DOB0;
  wire DOB1;
  wire DOC0;
  wire DOC1;
  wire DOD0;
  wire DOD1;
  wire WCLK;
  wire WE;

  assign ADDRA0 = ADDRA[0];
  assign ADDRA1 = ADDRA[1];
  assign ADDRA2 = ADDRA[2];
  assign ADDRA3 = ADDRA[3];
  assign ADDRA4 = ADDRA[4];
  assign ADDRB0 = ADDRB[0];
  assign ADDRB1 = ADDRB[1];
  assign ADDRB2 = ADDRB[2];
  assign ADDRB3 = ADDRB[3];
  assign ADDRB4 = ADDRB[4];
  assign ADDRC0 = ADDRC[0];
  assign ADDRC1 = ADDRC[1];
  assign ADDRC2 = ADDRC[2];
  assign ADDRC3 = ADDRC[3];
  assign ADDRC4 = ADDRC[4];
  assign ADDRD0 = ADDRD[0];
  assign ADDRD1 = ADDRD[1];
  assign ADDRD2 = ADDRD[2];
  assign ADDRD3 = ADDRD[3];
  assign ADDRD4 = ADDRD[4];
  assign DIA0 = DIA[0];
  assign DIA1 = DIA[1];
  assign DIB0 = DIB[0];
  assign DIB1 = DIB[1];
  assign DIC0 = DIC[0];
  assign DIC1 = DIC[1];
  assign DID0 = DID[0];
  assign DID1 = DID[1];
  assign DOA[1] = DOA1;
  assign DOA[0] = DOA0;
  assign DOB[1] = DOB1;
  assign DOB[0] = DOB0;
  assign DOC[1] = DOC1;
  assign DOC[0] = DOC0;
  assign DOD[1] = DOD1;
  assign DOD[0] = DOD0;
  RAMD32 #(
    .INIT(32'h00000003),
    .IS_CLK_INVERTED(1'b0)) 
    RAMA
       (.CLK(WCLK),
        .I(DIA0),
        .O(DOA0),
        .RADR0(ADDRA0),
        .RADR1(ADDRA1),
        .RADR2(ADDRA2),
        .RADR3(ADDRA3),
        .RADR4(ADDRA4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h0000006D),
    .IS_CLK_INVERTED(1'b0)) 
    RAMA_D1
       (.CLK(WCLK),
        .I(DIA1),
        .O(DOA1),
        .RADR0(ADDRA0),
        .RADR1(ADDRA1),
        .RADR2(ADDRA2),
        .RADR3(ADDRA3),
        .RADR4(ADDRA4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000248),
    .IS_CLK_INVERTED(1'b0)) 
    RAMB
       (.CLK(WCLK),
        .I(DIB0),
        .O(DOB0),
        .RADR0(ADDRB0),
        .RADR1(ADDRB1),
        .RADR2(ADDRB2),
        .RADR3(ADDRB3),
        .RADR4(ADDRB4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h000000B7),
    .IS_CLK_INVERTED(1'b0)) 
    RAMB_D1
       (.CLK(WCLK),
        .I(DIB1),
        .O(DOB1),
        .RADR0(ADDRB0),
        .RADR1(ADDRB1),
        .RADR2(ADDRB2),
        .RADR3(ADDRB3),
        .RADR4(ADDRB4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMC
       (.CLK(WCLK),
        .I(DIC0),
        .O(DOC0),
        .RADR0(ADDRC0),
        .RADR1(ADDRC1),
        .RADR2(ADDRC2),
        .RADR3(ADDRC3),
        .RADR4(ADDRC4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMC_D1
       (.CLK(WCLK),
        .I(DIC1),
        .O(DOC1),
        .RADR0(ADDRC0),
        .RADR1(ADDRC1),
        .RADR2(ADDRC2),
        .RADR3(ADDRC3),
        .RADR4(ADDRC4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMS32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMD
       (.ADR0(ADDRD0),
        .ADR1(ADDRD1),
        .ADR2(ADDRD2),
        .ADR3(ADDRD3),
        .ADR4(ADDRD4),
        .CLK(WCLK),
        .I(DID0),
        .O(DOD0),
        .WE(WE));
  RAMS32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMD_D1
       (.ADR0(ADDRD0),
        .ADR1(ADDRD1),
        .ADR2(ADDRD2),
        .ADR3(ADDRD3),
        .ADR4(ADDRD4),
        .CLK(WCLK),
        .I(DID1),
        .O(DOD1),
        .WE(WE));
endmodule

module RAM32M_HD12
   (DOA,
    DOB,
    DOC,
    DOD,
    ADDRA,
    ADDRB,
    ADDRC,
    ADDRD,
    DIA,
    DIB,
    DIC,
    DID,
    WCLK,
    WE);
  output [1:0]DOA;
  output [1:0]DOB;
  output [1:0]DOC;
  output [1:0]DOD;
  input [4:0]ADDRA;
  input [4:0]ADDRB;
  input [4:0]ADDRC;
  input [4:0]ADDRD;
  input [1:0]DIA;
  input [1:0]DIB;
  input [1:0]DIC;
  input [1:0]DID;
  input WCLK;
  input WE;

  wire ADDRA0;
  wire ADDRA1;
  wire ADDRA2;
  wire ADDRA3;
  wire ADDRA4;
  wire ADDRB0;
  wire ADDRB1;
  wire ADDRB2;
  wire ADDRB3;
  wire ADDRB4;
  wire ADDRC0;
  wire ADDRC1;
  wire ADDRC2;
  wire ADDRC3;
  wire ADDRC4;
  wire ADDRD0;
  wire ADDRD1;
  wire ADDRD2;
  wire ADDRD3;
  wire ADDRD4;
  wire DIA0;
  wire DIA1;
  wire DIB0;
  wire DIB1;
  wire DIC0;
  wire DIC1;
  wire DID0;
  wire DID1;
  wire DOA0;
  wire DOA1;
  wire DOB0;
  wire DOB1;
  wire DOC0;
  wire DOC1;
  wire DOD0;
  wire DOD1;
  wire WCLK;
  wire WE;

  assign ADDRA0 = ADDRA[0];
  assign ADDRA1 = ADDRA[1];
  assign ADDRA2 = ADDRA[2];
  assign ADDRA3 = ADDRA[3];
  assign ADDRA4 = ADDRA[4];
  assign ADDRB0 = ADDRB[0];
  assign ADDRB1 = ADDRB[1];
  assign ADDRB2 = ADDRB[2];
  assign ADDRB3 = ADDRB[3];
  assign ADDRB4 = ADDRB[4];
  assign ADDRC0 = ADDRC[0];
  assign ADDRC1 = ADDRC[1];
  assign ADDRC2 = ADDRC[2];
  assign ADDRC3 = ADDRC[3];
  assign ADDRC4 = ADDRC[4];
  assign ADDRD0 = ADDRD[0];
  assign ADDRD1 = ADDRD[1];
  assign ADDRD2 = ADDRD[2];
  assign ADDRD3 = ADDRD[3];
  assign ADDRD4 = ADDRD[4];
  assign DIA0 = DIA[0];
  assign DIA1 = DIA[1];
  assign DIB0 = DIB[0];
  assign DIB1 = DIB[1];
  assign DIC0 = DIC[0];
  assign DIC1 = DIC[1];
  assign DID0 = DID[0];
  assign DID1 = DID[1];
  assign DOA[1] = DOA1;
  assign DOA[0] = DOA0;
  assign DOB[1] = DOB1;
  assign DOB[0] = DOB0;
  assign DOC[1] = DOC1;
  assign DOC[0] = DOC0;
  assign DOD[1] = DOD1;
  assign DOD[0] = DOD0;
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMA
       (.CLK(WCLK),
        .I(DIA0),
        .O(DOA0),
        .RADR0(ADDRA0),
        .RADR1(ADDRA1),
        .RADR2(ADDRA2),
        .RADR3(ADDRA3),
        .RADR4(ADDRA4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMA_D1
       (.CLK(WCLK),
        .I(DIA1),
        .O(DOA1),
        .RADR0(ADDRA0),
        .RADR1(ADDRA1),
        .RADR2(ADDRA2),
        .RADR3(ADDRA3),
        .RADR4(ADDRA4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMB
       (.CLK(WCLK),
        .I(DIB0),
        .O(DOB0),
        .RADR0(ADDRB0),
        .RADR1(ADDRB1),
        .RADR2(ADDRB2),
        .RADR3(ADDRB3),
        .RADR4(ADDRB4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMB_D1
       (.CLK(WCLK),
        .I(DIB1),
        .O(DOB1),
        .RADR0(ADDRB0),
        .RADR1(ADDRB1),
        .RADR2(ADDRB2),
        .RADR3(ADDRB3),
        .RADR4(ADDRB4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMC
       (.CLK(WCLK),
        .I(DIC0),
        .O(DOC0),
        .RADR0(ADDRC0),
        .RADR1(ADDRC1),
        .RADR2(ADDRC2),
        .RADR3(ADDRC3),
        .RADR4(ADDRC4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMC_D1
       (.CLK(WCLK),
        .I(DIC1),
        .O(DOC1),
        .RADR0(ADDRC0),
        .RADR1(ADDRC1),
        .RADR2(ADDRC2),
        .RADR3(ADDRC3),
        .RADR4(ADDRC4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMS32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMD
       (.ADR0(ADDRD0),
        .ADR1(ADDRD1),
        .ADR2(ADDRD2),
        .ADR3(ADDRD3),
        .ADR4(ADDRD4),
        .CLK(WCLK),
        .I(DID0),
        .O(DOD0),
        .WE(WE));
  RAMS32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMD_D1
       (.ADR0(ADDRD0),
        .ADR1(ADDRD1),
        .ADR2(ADDRD2),
        .ADR3(ADDRD3),
        .ADR4(ADDRD4),
        .CLK(WCLK),
        .I(DID1),
        .O(DOD1),
        .WE(WE));
endmodule

(* ADC = "3'b001" *) (* ECO_CHECKSUM = "87d0c0a1" *) (* INCA = "3'b011" *) 
(* JPA = "3'b010" *) (* LDA = "3'b101" *) (* NOT = "3'b000" *) 
(* S00 = "5'b00000" *) (* S01 = "5'b00001" *) (* S02 = "5'b00010" *) 
(* S03 = "5'b00011" *) (* S04 = "5'b00100" *) (* S05 = "5'b00101" *) 
(* S06 = "5'b00110" *) (* S07 = "5'b00111" *) (* S08 = "5'b01000" *) 
(* S09 = "5'b01001" *) (* S10 = "5'b01010" *) (* S11 = "5'b01011" *) 
(* S12 = "5'b01100" *) (* S13 = "5'b01101" *) (* S14 = "5'b01110" *) 
(* S15 = "5'b01111" *) (* S16 = "5'b10000" *) (* STA = "3'b100" *) 
(* zero = "16'b0000000000000000" *) 
(* NotValidForBitStream *)
module Processor
   (CLK,
    reset,
    OP_CODE,
    state,
    PC,
    A,
    MA,
    IR,
    AC,
    MD,
    MD_E,
    IR_E,
    AC_E,
    MA_E,
    PC_E,
    MA_C,
    A_C,
    MEM_C,
    AM_BIT,
    PC_C,
    ALU_C,
    C,
    PRState,
    NXState,
    T1);
  input CLK;
  input reset;
  output [2:0]OP_CODE;
  output [4:0]state;
  output [11:0]PC;
  output [11:0]A;
  output [11:0]MA;
  output [15:0]IR;
  output [15:0]AC;
  output [15:0]MD;
  output MD_E;
  output IR_E;
  output AC_E;
  output MA_E;
  output PC_E;
  output MA_C;
  output A_C;
  output MEM_C;
  output AM_BIT;
  output [1:0]PC_C;
  output [2:0]ALU_C;
  output C;
  output [4:0]PRState;
  output [4:0]NXState;
  output [16:0]T1;

  wire [11:0]A;
  wire [15:0]AC;
  wire \AC[0]_i_1_n_0 ;
  wire \AC[0]_i_2_n_0 ;
  wire \AC[0]_i_3_n_0 ;
  wire \AC[0]_i_5_n_0 ;
  wire \AC[0]_i_6_n_0 ;
  wire \AC[0]_i_7_n_0 ;
  wire \AC[0]_i_8_n_0 ;
  wire \AC[10]_i_1_n_0 ;
  wire \AC[10]_i_2_n_0 ;
  wire \AC[11]_i_1_n_0 ;
  wire \AC[11]_i_2_n_0 ;
  wire \AC[12]_i_1_n_0 ;
  wire \AC[12]_i_2_n_0 ;
  wire \AC[12]_i_5_n_0 ;
  wire \AC[12]_i_6_n_0 ;
  wire \AC[12]_i_7_n_0 ;
  wire \AC[12]_i_8_n_0 ;
  wire \AC[13]_i_1_n_0 ;
  wire \AC[13]_i_2_n_0 ;
  wire \AC[14]_i_1_n_0 ;
  wire \AC[14]_i_2_n_0 ;
  wire \AC[15]_i_1_n_0 ;
  wire \AC[15]_i_2_n_0 ;
  wire \AC[1]_i_1_n_0 ;
  wire \AC[1]_i_2_n_0 ;
  wire \AC[2]_i_1_n_0 ;
  wire \AC[2]_i_2_n_0 ;
  wire \AC[3]_i_1_n_0 ;
  wire \AC[3]_i_2_n_0 ;
  wire \AC[4]_i_1_n_0 ;
  wire \AC[4]_i_2_n_0 ;
  wire \AC[4]_i_4_n_0 ;
  wire \AC[4]_i_5_n_0 ;
  wire \AC[4]_i_6_n_0 ;
  wire \AC[4]_i_7_n_0 ;
  wire \AC[5]_i_1_n_0 ;
  wire \AC[5]_i_2_n_0 ;
  wire \AC[6]_i_1_n_0 ;
  wire \AC[6]_i_2_n_0 ;
  wire \AC[7]_i_1_n_0 ;
  wire \AC[7]_i_2_n_0 ;
  wire \AC[8]_i_1_n_0 ;
  wire \AC[8]_i_2_n_0 ;
  wire \AC[8]_i_4_n_0 ;
  wire \AC[8]_i_5_n_0 ;
  wire \AC[8]_i_6_n_0 ;
  wire \AC[8]_i_7_n_0 ;
  wire \AC[9]_i_1_n_0 ;
  wire \AC[9]_i_2_n_0 ;
  wire AC_E;
  wire AC_E_OBUF;
  wire \AC_reg[0]_i_4_n_0 ;
  wire \AC_reg[12]_i_4_n_0 ;
  wire \AC_reg[1]_i_3_n_0 ;
  wire \AC_reg[4]_i_3_n_0 ;
  wire \AC_reg[5]_i_3_n_0 ;
  wire \AC_reg[8]_i_3_n_0 ;
  wire \AC_reg[9]_i_3_n_0 ;
  wire [2:0]ALU_C;
  wire [2:0]ALU_C_OBUF;
  wire \ALU_C_reg[0]_i_1_n_0 ;
  wire \ALU_C_reg[1]_i_1_n_0 ;
  wire \ALU_C_reg[2]_i_1_n_0 ;
  wire AM_BIT;
  wire AM_BIT_OBUF;
  wire \A[10]_i_1_n_0 ;
  wire \A[11]_i_1_n_0 ;
  wire \A[4]_i_1_n_0 ;
  wire \A[5]_i_1_n_0 ;
  wire \A[6]_i_1_n_0 ;
  wire \A[7]_i_1_n_0 ;
  wire \A[8]_i_1_n_0 ;
  wire \A[9]_i_1_n_0 ;
  wire A_C;
  wire A_C_OBUF;
  wire [11:0]A_OBUF;
  wire \A_reg[0]_lopt_replica_1 ;
  wire \A_reg[1]_lopt_replica_1 ;
  wire \A_reg[2]_lopt_replica_1 ;
  wire \A_reg[3]_lopt_replica_1 ;
  wire C;
  wire CLK;
  wire CLK_IBUF;
  wire CLK_IBUF_BUFG;
  wire C_i_1_n_0;
  wire C_i_2_n_0;
  wire [15:0]IR;
  wire IR_E;
  wire IR_E_OBUF;
  wire [15:0]IR_OBUF;
  wire \IR_reg[0]_lopt_replica_1 ;
  wire \IR_reg[10]_lopt_replica_1 ;
  wire \IR_reg[11]_lopt_replica_1 ;
  wire \IR_reg[12]_lopt_replica_1 ;
  wire \IR_reg[12]_lopt_replica_2_1 ;
  wire \IR_reg[1]_lopt_replica_1 ;
  wire \IR_reg[2]_lopt_replica_1 ;
  wire \IR_reg[3]_lopt_replica_1 ;
  wire \IR_reg[4]_lopt_replica_1 ;
  wire \IR_reg[5]_lopt_replica_1 ;
  wire \IR_reg[6]_lopt_replica_1 ;
  wire \IR_reg[7]_lopt_replica_1 ;
  wire \IR_reg[8]_lopt_replica_1 ;
  wire \IR_reg[9]_lopt_replica_1 ;
  wire [11:0]MA;
  wire \MA[0]_i_1_n_0 ;
  wire \MA[0]_i_2_n_0 ;
  wire \MA[10]_i_1_n_0 ;
  wire \MA[10]_i_2_n_0 ;
  wire \MA[11]_i_1_n_0 ;
  wire \MA[11]_i_2_n_0 ;
  wire \MA[11]_i_3_n_0 ;
  wire \MA[11]_i_5_n_0 ;
  wire \MA[1]_i_1_n_0 ;
  wire \MA[1]_i_2_n_0 ;
  wire \MA[2]_i_1_n_0 ;
  wire \MA[2]_i_2_n_0 ;
  wire \MA[3]_i_1_n_0 ;
  wire \MA[3]_i_2_n_0 ;
  wire \MA[4]_i_1_n_0 ;
  wire \MA[4]_i_2_n_0 ;
  wire \MA[5]_i_1_n_0 ;
  wire \MA[5]_i_2_n_0 ;
  wire \MA[6]_i_1_n_0 ;
  wire \MA[6]_i_2_n_0 ;
  wire \MA[7]_i_1_n_0 ;
  wire \MA[7]_i_2_n_0 ;
  wire \MA[8]_i_1_n_0 ;
  wire \MA[8]_i_2_n_0 ;
  wire \MA[9]_i_1_n_0 ;
  wire \MA[9]_i_2_n_0 ;
  wire MA_C;
  wire MA_C_OBUF;
  wire MA_E;
  wire MA_E_OBUF;
  wire [11:0]MA_OBUF;
  wire [15:0]MD;
  wire [15:0]MD0;
  wire [15:0]MD0_out;
  wire MD_E;
  wire MD_E_OBUF;
  wire [15:0]MD_OBUF;
  wire \MD_reg[0]_lopt_replica_1 ;
  wire \MD_reg[10]_lopt_replica_1 ;
  wire \MD_reg[11]_lopt_replica_1 ;
  wire \MD_reg[12]_lopt_replica_1 ;
  wire \MD_reg[13]_lopt_replica_1 ;
  wire \MD_reg[14]_lopt_replica_1 ;
  wire \MD_reg[15]_lopt_replica_1 ;
  wire \MD_reg[1]_lopt_replica_1 ;
  wire \MD_reg[2]_lopt_replica_1 ;
  wire \MD_reg[3]_lopt_replica_1 ;
  wire \MD_reg[4]_lopt_replica_1 ;
  wire \MD_reg[5]_lopt_replica_1 ;
  wire \MD_reg[6]_lopt_replica_1 ;
  wire \MD_reg[7]_lopt_replica_1 ;
  wire \MD_reg[8]_lopt_replica_1 ;
  wire \MD_reg[9]_lopt_replica_1 ;
  wire MEM_C;
  wire MEM_C_OBUF;
  wire [4:0]NXState;
  wire \NXState[0]_i_1_n_0 ;
  wire \NXState[0]_i_2_n_0 ;
  wire \NXState[0]_i_3_n_0 ;
  wire \NXState[0]_i_4_n_0 ;
  wire \NXState[1]_i_1_n_0 ;
  wire \NXState[1]_i_2_n_0 ;
  wire \NXState[1]_i_3_n_0 ;
  wire \NXState[1]_i_4_n_0 ;
  wire \NXState[1]_i_5_n_0 ;
  wire \NXState[2]_i_1_n_0 ;
  wire \NXState[2]_i_2_n_0 ;
  wire \NXState[2]_i_3_n_0 ;
  wire \NXState[2]_i_4_n_0 ;
  wire \NXState[3]_i_1_n_0 ;
  wire \NXState[3]_i_2_n_0 ;
  wire \NXState[3]_i_3_n_0 ;
  wire \NXState[4]_i_1_n_0 ;
  wire \NXState[4]_i_2_n_0 ;
  wire \NXState[4]_i_3_n_0 ;
  wire \NXState[4]_i_4_n_0 ;
  wire \NXState[4]_i_5_n_0 ;
  wire [4:0]NXState_OBUF;
  wire [2:0]OP_CODE;
  wire \OP_CODE_reg[0]_lopt_replica_1 ;
  wire \OP_CODE_reg[0]_lopt_replica_2_1 ;
  wire \OP_CODE_reg[1]_lopt_replica_1 ;
  wire \OP_CODE_reg[1]_lopt_replica_2_1 ;
  wire \OP_CODE_reg[2]_lopt_replica_1 ;
  wire \OP_CODE_reg[2]_lopt_replica_2_1 ;
  wire [11:0]PC;
  wire \PC[0]_i_1_n_0 ;
  wire \PC[10]_i_1_n_0 ;
  wire \PC[10]_i_2_n_0 ;
  wire \PC[10]_i_3_n_0 ;
  wire \PC[11]_i_1_n_0 ;
  wire \PC[11]_i_2_n_0 ;
  wire \PC[11]_i_4_n_0 ;
  wire \PC[11]_i_5_n_0 ;
  wire \PC[11]_i_6_n_0 ;
  wire \PC[11]_i_7_n_0 ;
  wire \PC[1]_i_1_n_0 ;
  wire \PC[1]_i_2_n_0 ;
  wire \PC[1]_i_3_n_0 ;
  wire \PC[2]_i_1_n_0 ;
  wire \PC[2]_i_2_n_0 ;
  wire \PC[2]_i_3_n_0 ;
  wire \PC[3]_i_1_n_0 ;
  wire \PC[3]_i_2_n_0 ;
  wire \PC[3]_i_3_n_0 ;
  wire \PC[4]_i_1_n_0 ;
  wire \PC[4]_i_2_n_0 ;
  wire \PC[4]_i_4_n_0 ;
  wire \PC[5]_i_1_n_0 ;
  wire \PC[5]_i_2_n_0 ;
  wire \PC[5]_i_3_n_0 ;
  wire \PC[6]_i_1_n_0 ;
  wire \PC[6]_i_2_n_0 ;
  wire \PC[6]_i_3_n_0 ;
  wire \PC[7]_i_1_n_0 ;
  wire \PC[7]_i_2_n_0 ;
  wire \PC[7]_i_3_n_0 ;
  wire \PC[8]_i_1_n_0 ;
  wire \PC[8]_i_2_n_0 ;
  wire \PC[8]_i_4_n_0 ;
  wire \PC[9]_i_1_n_0 ;
  wire \PC[9]_i_2_n_0 ;
  wire \PC[9]_i_3_n_0 ;
  wire [1:0]PC_C;
  wire [1:0]PC_C_OBUF;
  wire PC_E;
  wire PC_E_OBUF;
  wire [11:0]PC_OBUF;
  wire \PC_reg[4]_i_3_n_0 ;
  wire \PC_reg[8]_i_3_n_0 ;
  wire [4:0]PRState;
  wire [4:0]PRState_OBUF;
  wire [16:0]T1;
  wire [16:1]T10;
  wire [16:0]T100_in;
  wire [16:0]T1_OBUF;
  wire memory_reg_0_15_0_5_i_2_n_0;
  wire memory_reg_0_15_0_5_i_3_n_0;
  wire memory_reg_0_15_0_5_i_4_n_0;
  wire memory_reg_0_15_0_5_i_5_n_0;
  wire p_0_in0_out;
  wire [11:1]p_5_in;
  wire reset;
  wire reset_IBUF;
  wire [4:0]state;
  wire [2:0]\NLW_AC_reg[0]_i_4_CO_UNCONNECTED ;
  wire [2:0]\NLW_AC_reg[12]_i_4_CO_UNCONNECTED ;
  wire [2:0]\NLW_AC_reg[13]_i_4_CO_UNCONNECTED ;
  wire [3:3]\NLW_AC_reg[13]_i_4_O_UNCONNECTED ;
  wire [2:0]\NLW_AC_reg[1]_i_3_CO_UNCONNECTED ;
  wire [2:0]\NLW_AC_reg[4]_i_3_CO_UNCONNECTED ;
  wire [2:0]\NLW_AC_reg[5]_i_3_CO_UNCONNECTED ;
  wire [2:0]\NLW_AC_reg[8]_i_3_CO_UNCONNECTED ;
  wire [2:0]\NLW_AC_reg[9]_i_3_CO_UNCONNECTED ;
  wire [3:1]NLW_C_reg_i_3_CO_UNCONNECTED;
  wire [3:0]NLW_C_reg_i_3_O_UNCONNECTED;
  wire [3:0]\NLW_PC_reg[11]_i_3_CO_UNCONNECTED ;
  wire [3:3]\NLW_PC_reg[11]_i_3_O_UNCONNECTED ;
  wire [2:0]\NLW_PC_reg[4]_i_3_CO_UNCONNECTED ;
  wire [2:0]\NLW_PC_reg[8]_i_3_CO_UNCONNECTED ;
  wire [1:0]NLW_memory_reg_0_15_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_memory_reg_0_15_12_15_DOC_UNCONNECTED;
  wire [1:0]NLW_memory_reg_0_15_12_15_DOD_UNCONNECTED;
  wire [1:0]NLW_memory_reg_0_15_6_11_DOD_UNCONNECTED;

initial begin
 $sdf_annotate("Processor_TB_time_impl.sdf",,,,"tool_control");
end
  LUT6 #(
    .INIT(64'h0322032200220322)) 
    \AC[0]_i_1 
       (.I0(T1_OBUF[0]),
        .I1(reset_IBUF),
        .I2(\AC[0]_i_2_n_0 ),
        .I3(AC_E_OBUF),
        .I4(\AC[0]_i_3_n_0 ),
        .I5(MD0_out[0]),
        .O(\AC[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00DFFCD0)) 
    \AC[0]_i_2 
       (.I0(T100_in[0]),
        .I1(ALU_C_OBUF[1]),
        .I2(ALU_C_OBUF[0]),
        .I3(ALU_C_OBUF[2]),
        .I4(T1_OBUF[0]),
        .O(\AC[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \AC[0]_i_3 
       (.I0(ALU_C_OBUF[2]),
        .I1(ALU_C_OBUF[0]),
        .I2(ALU_C_OBUF[1]),
        .O(\AC[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \AC[0]_i_5 
       (.I0(T1_OBUF[3]),
        .I1(MD_OBUF[3]),
        .I2(MD_E_OBUF),
        .I3(MD0[3]),
        .O(\AC[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \AC[0]_i_6 
       (.I0(T1_OBUF[2]),
        .I1(MD_OBUF[2]),
        .I2(MD_E_OBUF),
        .I3(MD0[2]),
        .O(\AC[0]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \AC[0]_i_7 
       (.I0(T1_OBUF[1]),
        .I1(MD_OBUF[1]),
        .I2(MD_E_OBUF),
        .I3(MD0[1]),
        .O(\AC[0]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \AC[0]_i_8 
       (.I0(T1_OBUF[0]),
        .I1(T1_OBUF[16]),
        .O(\AC[0]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0322032200220322)) 
    \AC[10]_i_1 
       (.I0(T1_OBUF[10]),
        .I1(reset_IBUF),
        .I2(\AC[10]_i_2_n_0 ),
        .I3(AC_E_OBUF),
        .I4(\AC[0]_i_3_n_0 ),
        .I5(MD0_out[10]),
        .O(\AC[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FFF0F550F3300F0)) 
    \AC[10]_i_2 
       (.I0(T10[10]),
        .I1(T100_in[10]),
        .I2(T1_OBUF[10]),
        .I3(ALU_C_OBUF[2]),
        .I4(ALU_C_OBUF[0]),
        .I5(ALU_C_OBUF[1]),
        .O(\AC[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0322032200220322)) 
    \AC[11]_i_1 
       (.I0(T1_OBUF[11]),
        .I1(reset_IBUF),
        .I2(\AC[11]_i_2_n_0 ),
        .I3(AC_E_OBUF),
        .I4(\AC[0]_i_3_n_0 ),
        .I5(MD0_out[11]),
        .O(\AC[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FFF0F550F3300F0)) 
    \AC[11]_i_2 
       (.I0(T10[11]),
        .I1(T100_in[11]),
        .I2(T1_OBUF[11]),
        .I3(ALU_C_OBUF[2]),
        .I4(ALU_C_OBUF[0]),
        .I5(ALU_C_OBUF[1]),
        .O(\AC[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0322032200220322)) 
    \AC[12]_i_1 
       (.I0(T1_OBUF[12]),
        .I1(reset_IBUF),
        .I2(\AC[12]_i_2_n_0 ),
        .I3(AC_E_OBUF),
        .I4(\AC[0]_i_3_n_0 ),
        .I5(MD0_out[12]),
        .O(\AC[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FFF0F550F3300F0)) 
    \AC[12]_i_2 
       (.I0(T10[12]),
        .I1(T100_in[12]),
        .I2(T1_OBUF[12]),
        .I3(ALU_C_OBUF[2]),
        .I4(ALU_C_OBUF[0]),
        .I5(ALU_C_OBUF[1]),
        .O(\AC[12]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \AC[12]_i_3 
       (.I0(MD0[12]),
        .I1(MD_E_OBUF),
        .I2(MD_OBUF[12]),
        .O(MD0_out[12]));
  LUT4 #(
    .INIT(16'h56A6)) 
    \AC[12]_i_5 
       (.I0(T1_OBUF[15]),
        .I1(MD_OBUF[15]),
        .I2(MD_E_OBUF),
        .I3(MD0[15]),
        .O(\AC[12]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \AC[12]_i_6 
       (.I0(T1_OBUF[14]),
        .I1(MD_OBUF[14]),
        .I2(MD_E_OBUF),
        .I3(MD0[14]),
        .O(\AC[12]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \AC[12]_i_7 
       (.I0(T1_OBUF[13]),
        .I1(MD_OBUF[13]),
        .I2(MD_E_OBUF),
        .I3(MD0[13]),
        .O(\AC[12]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \AC[12]_i_8 
       (.I0(T1_OBUF[12]),
        .I1(MD_OBUF[12]),
        .I2(MD_E_OBUF),
        .I3(MD0[12]),
        .O(\AC[12]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0322032200220322)) 
    \AC[13]_i_1 
       (.I0(T1_OBUF[13]),
        .I1(reset_IBUF),
        .I2(\AC[13]_i_2_n_0 ),
        .I3(AC_E_OBUF),
        .I4(\AC[0]_i_3_n_0 ),
        .I5(MD0_out[13]),
        .O(\AC[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FFF0F550F3300F0)) 
    \AC[13]_i_2 
       (.I0(T10[13]),
        .I1(T100_in[13]),
        .I2(T1_OBUF[13]),
        .I3(ALU_C_OBUF[2]),
        .I4(ALU_C_OBUF[0]),
        .I5(ALU_C_OBUF[1]),
        .O(\AC[13]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \AC[13]_i_3 
       (.I0(MD0[13]),
        .I1(MD_E_OBUF),
        .I2(MD_OBUF[13]),
        .O(MD0_out[13]));
  LUT6 #(
    .INIT(64'h0322032200220322)) 
    \AC[14]_i_1 
       (.I0(T1_OBUF[14]),
        .I1(reset_IBUF),
        .I2(\AC[14]_i_2_n_0 ),
        .I3(AC_E_OBUF),
        .I4(\AC[0]_i_3_n_0 ),
        .I5(MD0_out[14]),
        .O(\AC[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FFF0F550F3300F0)) 
    \AC[14]_i_2 
       (.I0(T10[14]),
        .I1(T100_in[14]),
        .I2(T1_OBUF[14]),
        .I3(ALU_C_OBUF[2]),
        .I4(ALU_C_OBUF[0]),
        .I5(ALU_C_OBUF[1]),
        .O(\AC[14]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \AC[14]_i_3 
       (.I0(MD0[14]),
        .I1(MD_E_OBUF),
        .I2(MD_OBUF[14]),
        .O(MD0_out[14]));
  LUT6 #(
    .INIT(64'h0322032200220322)) 
    \AC[15]_i_1 
       (.I0(T1_OBUF[15]),
        .I1(reset_IBUF),
        .I2(\AC[15]_i_2_n_0 ),
        .I3(AC_E_OBUF),
        .I4(\AC[0]_i_3_n_0 ),
        .I5(MD0_out[15]),
        .O(\AC[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FFF0F550F3300F0)) 
    \AC[15]_i_2 
       (.I0(T10[15]),
        .I1(T100_in[15]),
        .I2(T1_OBUF[15]),
        .I3(ALU_C_OBUF[2]),
        .I4(ALU_C_OBUF[0]),
        .I5(ALU_C_OBUF[1]),
        .O(\AC[15]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \AC[15]_i_3 
       (.I0(MD0[15]),
        .I1(MD_E_OBUF),
        .I2(MD_OBUF[15]),
        .O(MD0_out[15]));
  LUT6 #(
    .INIT(64'h0322032200220322)) 
    \AC[1]_i_1 
       (.I0(T1_OBUF[1]),
        .I1(reset_IBUF),
        .I2(\AC[1]_i_2_n_0 ),
        .I3(AC_E_OBUF),
        .I4(\AC[0]_i_3_n_0 ),
        .I5(MD0_out[1]),
        .O(\AC[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FFF0F550F3300F0)) 
    \AC[1]_i_2 
       (.I0(T10[1]),
        .I1(T100_in[1]),
        .I2(T1_OBUF[1]),
        .I3(ALU_C_OBUF[2]),
        .I4(ALU_C_OBUF[0]),
        .I5(ALU_C_OBUF[1]),
        .O(\AC[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0322032200220322)) 
    \AC[2]_i_1 
       (.I0(T1_OBUF[2]),
        .I1(reset_IBUF),
        .I2(\AC[2]_i_2_n_0 ),
        .I3(AC_E_OBUF),
        .I4(\AC[0]_i_3_n_0 ),
        .I5(MD0_out[2]),
        .O(\AC[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FFF0F550F3300F0)) 
    \AC[2]_i_2 
       (.I0(T10[2]),
        .I1(T100_in[2]),
        .I2(T1_OBUF[2]),
        .I3(ALU_C_OBUF[2]),
        .I4(ALU_C_OBUF[0]),
        .I5(ALU_C_OBUF[1]),
        .O(\AC[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0322032200220322)) 
    \AC[3]_i_1 
       (.I0(T1_OBUF[3]),
        .I1(reset_IBUF),
        .I2(\AC[3]_i_2_n_0 ),
        .I3(AC_E_OBUF),
        .I4(\AC[0]_i_3_n_0 ),
        .I5(MD0_out[3]),
        .O(\AC[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FFF0F550F3300F0)) 
    \AC[3]_i_2 
       (.I0(T10[3]),
        .I1(T100_in[3]),
        .I2(T1_OBUF[3]),
        .I3(ALU_C_OBUF[2]),
        .I4(ALU_C_OBUF[0]),
        .I5(ALU_C_OBUF[1]),
        .O(\AC[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0322032200220322)) 
    \AC[4]_i_1 
       (.I0(T1_OBUF[4]),
        .I1(reset_IBUF),
        .I2(\AC[4]_i_2_n_0 ),
        .I3(AC_E_OBUF),
        .I4(\AC[0]_i_3_n_0 ),
        .I5(MD0_out[4]),
        .O(\AC[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FFF0F550F3300F0)) 
    \AC[4]_i_2 
       (.I0(T10[4]),
        .I1(T100_in[4]),
        .I2(T1_OBUF[4]),
        .I3(ALU_C_OBUF[2]),
        .I4(ALU_C_OBUF[0]),
        .I5(ALU_C_OBUF[1]),
        .O(\AC[4]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \AC[4]_i_4 
       (.I0(T1_OBUF[7]),
        .I1(MD_OBUF[7]),
        .I2(MD_E_OBUF),
        .I3(MD0[7]),
        .O(\AC[4]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \AC[4]_i_5 
       (.I0(T1_OBUF[6]),
        .I1(MD_OBUF[6]),
        .I2(MD_E_OBUF),
        .I3(MD0[6]),
        .O(\AC[4]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \AC[4]_i_6 
       (.I0(T1_OBUF[5]),
        .I1(MD_OBUF[5]),
        .I2(MD_E_OBUF),
        .I3(MD0[5]),
        .O(\AC[4]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \AC[4]_i_7 
       (.I0(T1_OBUF[4]),
        .I1(MD_OBUF[4]),
        .I2(MD_E_OBUF),
        .I3(MD0[4]),
        .O(\AC[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0322032200220322)) 
    \AC[5]_i_1 
       (.I0(T1_OBUF[5]),
        .I1(reset_IBUF),
        .I2(\AC[5]_i_2_n_0 ),
        .I3(AC_E_OBUF),
        .I4(\AC[0]_i_3_n_0 ),
        .I5(MD0_out[5]),
        .O(\AC[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FFF0F550F3300F0)) 
    \AC[5]_i_2 
       (.I0(T10[5]),
        .I1(T100_in[5]),
        .I2(T1_OBUF[5]),
        .I3(ALU_C_OBUF[2]),
        .I4(ALU_C_OBUF[0]),
        .I5(ALU_C_OBUF[1]),
        .O(\AC[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0322032200220322)) 
    \AC[6]_i_1 
       (.I0(T1_OBUF[6]),
        .I1(reset_IBUF),
        .I2(\AC[6]_i_2_n_0 ),
        .I3(AC_E_OBUF),
        .I4(\AC[0]_i_3_n_0 ),
        .I5(MD0_out[6]),
        .O(\AC[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FFF0F550F3300F0)) 
    \AC[6]_i_2 
       (.I0(T10[6]),
        .I1(T100_in[6]),
        .I2(T1_OBUF[6]),
        .I3(ALU_C_OBUF[2]),
        .I4(ALU_C_OBUF[0]),
        .I5(ALU_C_OBUF[1]),
        .O(\AC[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0322032200220322)) 
    \AC[7]_i_1 
       (.I0(T1_OBUF[7]),
        .I1(reset_IBUF),
        .I2(\AC[7]_i_2_n_0 ),
        .I3(AC_E_OBUF),
        .I4(\AC[0]_i_3_n_0 ),
        .I5(MD0_out[7]),
        .O(\AC[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FFF0F550F3300F0)) 
    \AC[7]_i_2 
       (.I0(T10[7]),
        .I1(T100_in[7]),
        .I2(T1_OBUF[7]),
        .I3(ALU_C_OBUF[2]),
        .I4(ALU_C_OBUF[0]),
        .I5(ALU_C_OBUF[1]),
        .O(\AC[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0322032200220322)) 
    \AC[8]_i_1 
       (.I0(T1_OBUF[8]),
        .I1(reset_IBUF),
        .I2(\AC[8]_i_2_n_0 ),
        .I3(AC_E_OBUF),
        .I4(\AC[0]_i_3_n_0 ),
        .I5(MD0_out[8]),
        .O(\AC[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FFF0F550F3300F0)) 
    \AC[8]_i_2 
       (.I0(T10[8]),
        .I1(T100_in[8]),
        .I2(T1_OBUF[8]),
        .I3(ALU_C_OBUF[2]),
        .I4(ALU_C_OBUF[0]),
        .I5(ALU_C_OBUF[1]),
        .O(\AC[8]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \AC[8]_i_4 
       (.I0(T1_OBUF[11]),
        .I1(MD_OBUF[11]),
        .I2(MD_E_OBUF),
        .I3(MD0[11]),
        .O(\AC[8]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \AC[8]_i_5 
       (.I0(T1_OBUF[10]),
        .I1(MD_OBUF[10]),
        .I2(MD_E_OBUF),
        .I3(MD0[10]),
        .O(\AC[8]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \AC[8]_i_6 
       (.I0(T1_OBUF[9]),
        .I1(MD_OBUF[9]),
        .I2(MD_E_OBUF),
        .I3(MD0[9]),
        .O(\AC[8]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \AC[8]_i_7 
       (.I0(T1_OBUF[8]),
        .I1(MD_OBUF[8]),
        .I2(MD_E_OBUF),
        .I3(MD0[8]),
        .O(\AC[8]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0322032200220322)) 
    \AC[9]_i_1 
       (.I0(T1_OBUF[9]),
        .I1(reset_IBUF),
        .I2(\AC[9]_i_2_n_0 ),
        .I3(AC_E_OBUF),
        .I4(\AC[0]_i_3_n_0 ),
        .I5(MD0_out[9]),
        .O(\AC[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FFF0F550F3300F0)) 
    \AC[9]_i_2 
       (.I0(T10[9]),
        .I1(T100_in[9]),
        .I2(T1_OBUF[9]),
        .I3(ALU_C_OBUF[2]),
        .I4(ALU_C_OBUF[0]),
        .I5(ALU_C_OBUF[1]),
        .O(\AC[9]_i_2_n_0 ));
  OBUF AC_E_OBUF_inst
       (.I(AC_E_OBUF),
        .O(AC_E));
  LUT5 #(
    .INIT(32'h0080018A)) 
    AC_E_OBUF_inst_i_1
       (.I0(PRState_OBUF[1]),
        .I1(PRState_OBUF[0]),
        .I2(PRState_OBUF[3]),
        .I3(PRState_OBUF[4]),
        .I4(PRState_OBUF[2]),
        .O(AC_E_OBUF));
  OBUF \AC_OBUF[0]_inst 
       (.I(T1_OBUF[0]),
        .O(AC[0]));
  OBUF \AC_OBUF[10]_inst 
       (.I(T1_OBUF[10]),
        .O(AC[10]));
  OBUF \AC_OBUF[11]_inst 
       (.I(T1_OBUF[11]),
        .O(AC[11]));
  OBUF \AC_OBUF[12]_inst 
       (.I(T1_OBUF[12]),
        .O(AC[12]));
  OBUF \AC_OBUF[13]_inst 
       (.I(T1_OBUF[13]),
        .O(AC[13]));
  OBUF \AC_OBUF[14]_inst 
       (.I(T1_OBUF[14]),
        .O(AC[14]));
  OBUF \AC_OBUF[15]_inst 
       (.I(T1_OBUF[15]),
        .O(AC[15]));
  OBUF \AC_OBUF[1]_inst 
       (.I(T1_OBUF[1]),
        .O(AC[1]));
  OBUF \AC_OBUF[2]_inst 
       (.I(T1_OBUF[2]),
        .O(AC[2]));
  OBUF \AC_OBUF[3]_inst 
       (.I(T1_OBUF[3]),
        .O(AC[3]));
  OBUF \AC_OBUF[4]_inst 
       (.I(T1_OBUF[4]),
        .O(AC[4]));
  OBUF \AC_OBUF[5]_inst 
       (.I(T1_OBUF[5]),
        .O(AC[5]));
  OBUF \AC_OBUF[6]_inst 
       (.I(T1_OBUF[6]),
        .O(AC[6]));
  OBUF \AC_OBUF[7]_inst 
       (.I(T1_OBUF[7]),
        .O(AC[7]));
  OBUF \AC_OBUF[8]_inst 
       (.I(T1_OBUF[8]),
        .O(AC[8]));
  OBUF \AC_OBUF[9]_inst 
       (.I(T1_OBUF[9]),
        .O(AC[9]));
  FDRE #(
    .INIT(1'b0)) 
    \AC_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\AC[0]_i_1_n_0 ),
        .Q(T1_OBUF[0]),
        .R(1'b0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \AC_reg[0]_i_4 
       (.CI(1'b0),
        .CO({\AC_reg[0]_i_4_n_0 ,\NLW_AC_reg[0]_i_4_CO_UNCONNECTED [2:0]}),
        .CYINIT(MD0_out[0]),
        .DI(T1_OBUF[3:0]),
        .O(T100_in[3:0]),
        .S({\AC[0]_i_5_n_0 ,\AC[0]_i_6_n_0 ,\AC[0]_i_7_n_0 ,\AC[0]_i_8_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \AC_reg[10] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\AC[10]_i_1_n_0 ),
        .Q(T1_OBUF[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AC_reg[11] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\AC[11]_i_1_n_0 ),
        .Q(T1_OBUF[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AC_reg[12] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\AC[12]_i_1_n_0 ),
        .Q(T1_OBUF[12]),
        .R(1'b0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \AC_reg[12]_i_4 
       (.CI(\AC_reg[8]_i_3_n_0 ),
        .CO({\AC_reg[12]_i_4_n_0 ,\NLW_AC_reg[12]_i_4_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI(T1_OBUF[15:12]),
        .O(T100_in[15:12]),
        .S({\AC[12]_i_5_n_0 ,\AC[12]_i_6_n_0 ,\AC[12]_i_7_n_0 ,\AC[12]_i_8_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \AC_reg[13] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\AC[13]_i_1_n_0 ),
        .Q(T1_OBUF[13]),
        .R(1'b0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \AC_reg[13]_i_4 
       (.CI(\AC_reg[9]_i_3_n_0 ),
        .CO({T10[16],\NLW_AC_reg[13]_i_4_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_AC_reg[13]_i_4_O_UNCONNECTED [3],T10[15:13]}),
        .S({1'b1,T1_OBUF[15:13]}));
  FDRE #(
    .INIT(1'b0)) 
    \AC_reg[14] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\AC[14]_i_1_n_0 ),
        .Q(T1_OBUF[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AC_reg[15] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\AC[15]_i_1_n_0 ),
        .Q(T1_OBUF[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AC_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\AC[1]_i_1_n_0 ),
        .Q(T1_OBUF[1]),
        .R(1'b0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \AC_reg[1]_i_3 
       (.CI(1'b0),
        .CO({\AC_reg[1]_i_3_n_0 ,\NLW_AC_reg[1]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(T1_OBUF[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(T10[4:1]),
        .S(T1_OBUF[4:1]));
  FDRE #(
    .INIT(1'b0)) 
    \AC_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\AC[2]_i_1_n_0 ),
        .Q(T1_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AC_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\AC[3]_i_1_n_0 ),
        .Q(T1_OBUF[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AC_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\AC[4]_i_1_n_0 ),
        .Q(T1_OBUF[4]),
        .R(1'b0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \AC_reg[4]_i_3 
       (.CI(\AC_reg[0]_i_4_n_0 ),
        .CO({\AC_reg[4]_i_3_n_0 ,\NLW_AC_reg[4]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI(T1_OBUF[7:4]),
        .O(T100_in[7:4]),
        .S({\AC[4]_i_4_n_0 ,\AC[4]_i_5_n_0 ,\AC[4]_i_6_n_0 ,\AC[4]_i_7_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \AC_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\AC[5]_i_1_n_0 ),
        .Q(T1_OBUF[5]),
        .R(1'b0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \AC_reg[5]_i_3 
       (.CI(\AC_reg[1]_i_3_n_0 ),
        .CO({\AC_reg[5]_i_3_n_0 ,\NLW_AC_reg[5]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(T10[8:5]),
        .S(T1_OBUF[8:5]));
  FDRE #(
    .INIT(1'b0)) 
    \AC_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\AC[6]_i_1_n_0 ),
        .Q(T1_OBUF[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AC_reg[7] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\AC[7]_i_1_n_0 ),
        .Q(T1_OBUF[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AC_reg[8] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\AC[8]_i_1_n_0 ),
        .Q(T1_OBUF[8]),
        .R(1'b0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \AC_reg[8]_i_3 
       (.CI(\AC_reg[4]_i_3_n_0 ),
        .CO({\AC_reg[8]_i_3_n_0 ,\NLW_AC_reg[8]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI(T1_OBUF[11:8]),
        .O(T100_in[11:8]),
        .S({\AC[8]_i_4_n_0 ,\AC[8]_i_5_n_0 ,\AC[8]_i_6_n_0 ,\AC[8]_i_7_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \AC_reg[9] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\AC[9]_i_1_n_0 ),
        .Q(T1_OBUF[9]),
        .R(1'b0));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \AC_reg[9]_i_3 
       (.CI(\AC_reg[5]_i_3_n_0 ),
        .CO({\AC_reg[9]_i_3_n_0 ,\NLW_AC_reg[9]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(T10[12:9]),
        .S(T1_OBUF[12:9]));
  OBUF \ALU_C_OBUF[0]_inst 
       (.I(ALU_C_OBUF[0]),
        .O(ALU_C[0]));
  OBUF \ALU_C_OBUF[1]_inst 
       (.I(ALU_C_OBUF[1]),
        .O(ALU_C[1]));
  OBUF \ALU_C_OBUF[2]_inst 
       (.I(ALU_C_OBUF[2]),
        .O(ALU_C[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ALU_C_reg[0] 
       (.CLR(1'b0),
        .D(\ALU_C_reg[0]_i_1_n_0 ),
        .G(AC_E_OBUF),
        .GE(1'b1),
        .Q(ALU_C_OBUF[0]));
  LUT4 #(
    .INIT(16'h0080)) 
    \ALU_C_reg[0]_i_1 
       (.I0(PRState_OBUF[1]),
        .I1(PRState_OBUF[0]),
        .I2(PRState_OBUF[3]),
        .I3(PRState_OBUF[4]),
        .O(\ALU_C_reg[0]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ALU_C_reg[1] 
       (.CLR(1'b0),
        .D(\ALU_C_reg[1]_i_1_n_0 ),
        .G(AC_E_OBUF),
        .GE(1'b1),
        .Q(ALU_C_OBUF[1]));
  LUT4 #(
    .INIT(16'h0040)) 
    \ALU_C_reg[1]_i_1 
       (.I0(PRState_OBUF[4]),
        .I1(PRState_OBUF[0]),
        .I2(PRState_OBUF[1]),
        .I3(PRState_OBUF[2]),
        .O(\ALU_C_reg[1]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \ALU_C_reg[2] 
       (.CLR(1'b0),
        .D(\ALU_C_reg[2]_i_1_n_0 ),
        .G(AC_E_OBUF),
        .GE(1'b1),
        .Q(ALU_C_OBUF[2]));
  LUT5 #(
    .INIT(32'h00000004)) 
    \ALU_C_reg[2]_i_1 
       (.I0(PRState_OBUF[2]),
        .I1(PRState_OBUF[4]),
        .I2(PRState_OBUF[3]),
        .I3(PRState_OBUF[0]),
        .I4(PRState_OBUF[1]),
        .O(\ALU_C_reg[2]_i_1_n_0 ));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF AM_BIT_OBUF_inst
       (.I(\IR_reg[12]_lopt_replica_1 ),
        .O(AM_BIT));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \A[10]_i_1 
       (.I0(\MA[10]_i_1_n_0 ),
        .I1(A_C_OBUF),
        .I2(\PC[10]_i_1_n_0 ),
        .O(\A[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \A[11]_i_1 
       (.I0(\MA[11]_i_1_n_0 ),
        .I1(A_C_OBUF),
        .I2(\PC[11]_i_1_n_0 ),
        .O(\A[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \A[4]_i_1 
       (.I0(\MA[4]_i_1_n_0 ),
        .I1(A_C_OBUF),
        .I2(\PC[4]_i_1_n_0 ),
        .O(\A[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \A[5]_i_1 
       (.I0(\MA[5]_i_1_n_0 ),
        .I1(A_C_OBUF),
        .I2(\PC[5]_i_1_n_0 ),
        .O(\A[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \A[6]_i_1 
       (.I0(\MA[6]_i_1_n_0 ),
        .I1(A_C_OBUF),
        .I2(\PC[6]_i_1_n_0 ),
        .O(\A[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \A[7]_i_1 
       (.I0(\MA[7]_i_1_n_0 ),
        .I1(A_C_OBUF),
        .I2(\PC[7]_i_1_n_0 ),
        .O(\A[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \A[8]_i_1 
       (.I0(\MA[8]_i_1_n_0 ),
        .I1(A_C_OBUF),
        .I2(\PC[8]_i_1_n_0 ),
        .O(\A[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \A[9]_i_1 
       (.I0(\MA[9]_i_1_n_0 ),
        .I1(A_C_OBUF),
        .I2(\PC[9]_i_1_n_0 ),
        .O(\A[9]_i_1_n_0 ));
  OBUF A_C_OBUF_inst
       (.I(A_C_OBUF),
        .O(A_C));
  LUT5 #(
    .INIT(32'h10404454)) 
    A_C_OBUF_inst_i_1
       (.I0(PRState_OBUF[4]),
        .I1(PRState_OBUF[2]),
        .I2(PRState_OBUF[3]),
        .I3(PRState_OBUF[0]),
        .I4(PRState_OBUF[1]),
        .O(A_C_OBUF));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \A_OBUF[0]_inst 
       (.I(\A_reg[0]_lopt_replica_1 ),
        .O(A[0]));
  OBUF \A_OBUF[10]_inst 
       (.I(A_OBUF[10]),
        .O(A[10]));
  OBUF \A_OBUF[11]_inst 
       (.I(A_OBUF[11]),
        .O(A[11]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \A_OBUF[1]_inst 
       (.I(\A_reg[1]_lopt_replica_1 ),
        .O(A[1]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \A_OBUF[2]_inst 
       (.I(\A_reg[2]_lopt_replica_1 ),
        .O(A[2]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \A_OBUF[3]_inst 
       (.I(\A_reg[3]_lopt_replica_1 ),
        .O(A[3]));
  OBUF \A_OBUF[4]_inst 
       (.I(A_OBUF[4]),
        .O(A[4]));
  OBUF \A_OBUF[5]_inst 
       (.I(A_OBUF[5]),
        .O(A[5]));
  OBUF \A_OBUF[6]_inst 
       (.I(A_OBUF[6]),
        .O(A[6]));
  OBUF \A_OBUF[7]_inst 
       (.I(A_OBUF[7]),
        .O(A[7]));
  OBUF \A_OBUF[8]_inst 
       (.I(A_OBUF[8]),
        .O(A[8]));
  OBUF \A_OBUF[9]_inst 
       (.I(A_OBUF[9]),
        .O(A[9]));
  FDRE #(
    .INIT(1'b0)) 
    \A_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(memory_reg_0_15_0_5_i_5_n_0),
        .Q(A_OBUF[0]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \A_reg[0]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(memory_reg_0_15_0_5_i_5_n_0),
        .Q(\A_reg[0]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \A_reg[10] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\A[10]_i_1_n_0 ),
        .Q(A_OBUF[10]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \A_reg[11] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\A[11]_i_1_n_0 ),
        .Q(A_OBUF[11]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \A_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(memory_reg_0_15_0_5_i_4_n_0),
        .Q(A_OBUF[1]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \A_reg[1]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(memory_reg_0_15_0_5_i_4_n_0),
        .Q(\A_reg[1]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \A_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(memory_reg_0_15_0_5_i_3_n_0),
        .Q(A_OBUF[2]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \A_reg[2]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(memory_reg_0_15_0_5_i_3_n_0),
        .Q(\A_reg[2]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \A_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(memory_reg_0_15_0_5_i_2_n_0),
        .Q(A_OBUF[3]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \A_reg[3]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(memory_reg_0_15_0_5_i_2_n_0),
        .Q(\A_reg[3]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \A_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\A[4]_i_1_n_0 ),
        .Q(A_OBUF[4]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \A_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\A[5]_i_1_n_0 ),
        .Q(A_OBUF[5]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \A_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\A[6]_i_1_n_0 ),
        .Q(A_OBUF[6]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \A_reg[7] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\A[7]_i_1_n_0 ),
        .Q(A_OBUF[7]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \A_reg[8] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\A[8]_i_1_n_0 ),
        .Q(A_OBUF[8]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \A_reg[9] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\A[9]_i_1_n_0 ),
        .Q(A_OBUF[9]),
        .R(reset_IBUF));
  BUFG CLK_IBUF_BUFG_inst
       (.I(CLK_IBUF),
        .O(CLK_IBUF_BUFG));
  IBUF CLK_IBUF_inst
       (.I(CLK),
        .O(CLK_IBUF));
  OBUF C_OBUF_inst
       (.I(T1_OBUF[16]),
        .O(C));
  LUT6 #(
    .INIT(64'h0000A8FFAAAAAAAA)) 
    C_i_1
       (.I0(T1_OBUF[16]),
        .I1(ALU_C_OBUF[1]),
        .I2(ALU_C_OBUF[0]),
        .I3(ALU_C_OBUF[2]),
        .I4(C_i_2_n_0),
        .I5(AC_E_OBUF),
        .O(C_i_1_n_0));
  LUT5 #(
    .INIT(32'h51510050)) 
    C_i_2
       (.I0(ALU_C_OBUF[2]),
        .I1(T10[16]),
        .I2(ALU_C_OBUF[0]),
        .I3(T100_in[16]),
        .I4(ALU_C_OBUF[1]),
        .O(C_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    C_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(C_i_1_n_0),
        .Q(T1_OBUF[16]),
        .R(reset_IBUF));
  CARRY4 C_reg_i_3
       (.CI(\AC_reg[12]_i_4_n_0 ),
        .CO({NLW_C_reg_i_3_CO_UNCONNECTED[3:1],T100_in[16]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_C_reg_i_3_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  OBUF IR_E_OBUF_inst
       (.I(IR_E_OBUF),
        .O(IR_E));
  LUT4 #(
    .INIT(16'h0001)) 
    IR_E_OBUF_inst_i_1
       (.I0(PRState_OBUF[2]),
        .I1(PRState_OBUF[1]),
        .I2(PRState_OBUF[3]),
        .I3(PRState_OBUF[4]),
        .O(IR_E_OBUF));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \IR_OBUF[0]_inst 
       (.I(\IR_reg[0]_lopt_replica_1 ),
        .O(IR[0]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \IR_OBUF[10]_inst 
       (.I(\IR_reg[10]_lopt_replica_1 ),
        .O(IR[10]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \IR_OBUF[11]_inst 
       (.I(\IR_reg[11]_lopt_replica_1 ),
        .O(IR[11]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \IR_OBUF[12]_inst 
       (.I(\IR_reg[12]_lopt_replica_2_1 ),
        .O(IR[12]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \IR_OBUF[13]_inst 
       (.I(\OP_CODE_reg[0]_lopt_replica_1 ),
        .O(IR[13]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \IR_OBUF[14]_inst 
       (.I(\OP_CODE_reg[1]_lopt_replica_1 ),
        .O(IR[14]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \IR_OBUF[15]_inst 
       (.I(\OP_CODE_reg[2]_lopt_replica_1 ),
        .O(IR[15]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \IR_OBUF[1]_inst 
       (.I(\IR_reg[1]_lopt_replica_1 ),
        .O(IR[1]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \IR_OBUF[2]_inst 
       (.I(\IR_reg[2]_lopt_replica_1 ),
        .O(IR[2]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \IR_OBUF[3]_inst 
       (.I(\IR_reg[3]_lopt_replica_1 ),
        .O(IR[3]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \IR_OBUF[4]_inst 
       (.I(\IR_reg[4]_lopt_replica_1 ),
        .O(IR[4]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \IR_OBUF[5]_inst 
       (.I(\IR_reg[5]_lopt_replica_1 ),
        .O(IR[5]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \IR_OBUF[6]_inst 
       (.I(\IR_reg[6]_lopt_replica_1 ),
        .O(IR[6]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \IR_OBUF[7]_inst 
       (.I(\IR_reg[7]_lopt_replica_1 ),
        .O(IR[7]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \IR_OBUF[8]_inst 
       (.I(\IR_reg[8]_lopt_replica_1 ),
        .O(IR[8]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \IR_OBUF[9]_inst 
       (.I(\IR_reg[9]_lopt_replica_1 ),
        .O(IR[9]));
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[0]),
        .Q(IR_OBUF[0]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[0]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[0]),
        .Q(\IR_reg[0]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[10] 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[10]),
        .Q(IR_OBUF[10]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[10]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[10]),
        .Q(\IR_reg[10]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[11] 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[11]),
        .Q(IR_OBUF[11]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[11]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[11]),
        .Q(\IR_reg[11]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[12] 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[12]),
        .Q(AM_BIT_OBUF),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[12]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[12]),
        .Q(\IR_reg[12]_lopt_replica_1 ),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[12]_lopt_replica_2 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[12]),
        .Q(\IR_reg[12]_lopt_replica_2_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[1]),
        .Q(IR_OBUF[1]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[1]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[1]),
        .Q(\IR_reg[1]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[2]),
        .Q(IR_OBUF[2]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[2]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[2]),
        .Q(\IR_reg[2]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[3]),
        .Q(IR_OBUF[3]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[3]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[3]),
        .Q(\IR_reg[3]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[4]),
        .Q(IR_OBUF[4]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[4]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[4]),
        .Q(\IR_reg[4]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[5]),
        .Q(IR_OBUF[5]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[5]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[5]),
        .Q(\IR_reg[5]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[6]),
        .Q(IR_OBUF[6]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[6]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[6]),
        .Q(\IR_reg[6]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[7] 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[7]),
        .Q(IR_OBUF[7]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[7]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[7]),
        .Q(\IR_reg[7]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[8] 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[8]),
        .Q(IR_OBUF[8]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[8]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[8]),
        .Q(\IR_reg[8]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[9] 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[9]),
        .Q(IR_OBUF[9]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \IR_reg[9]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[9]),
        .Q(\IR_reg[9]_lopt_replica_1 ),
        .R(reset_IBUF));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \MA[0]_i_1 
       (.I0(MA_OBUF[0]),
        .I1(MA_E_OBUF),
        .I2(\MA[11]_i_2_n_0 ),
        .I3(\MA[0]_i_2_n_0 ),
        .I4(MD0_out[0]),
        .I5(\MA[11]_i_5_n_0 ),
        .O(\MA[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000002)) 
    \MA[0]_i_2 
       (.I0(MD0[0]),
        .I1(PRState_OBUF[2]),
        .I2(PRState_OBUF[1]),
        .I3(PRState_OBUF[3]),
        .I4(PRState_OBUF[4]),
        .I5(IR_OBUF[0]),
        .O(\MA[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \MA[0]_i_3 
       (.I0(MD0[0]),
        .I1(MD_E_OBUF),
        .I2(MD_OBUF[0]),
        .O(MD0_out[0]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \MA[10]_i_1 
       (.I0(MA_OBUF[10]),
        .I1(MA_E_OBUF),
        .I2(\MA[11]_i_2_n_0 ),
        .I3(\MA[10]_i_2_n_0 ),
        .I4(MD0_out[10]),
        .I5(\MA[11]_i_5_n_0 ),
        .O(\MA[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000002)) 
    \MA[10]_i_2 
       (.I0(MD0[10]),
        .I1(PRState_OBUF[2]),
        .I2(PRState_OBUF[1]),
        .I3(PRState_OBUF[3]),
        .I4(PRState_OBUF[4]),
        .I5(IR_OBUF[10]),
        .O(\MA[10]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \MA[10]_i_3 
       (.I0(MD0[10]),
        .I1(MD_E_OBUF),
        .I2(MD_OBUF[10]),
        .O(MD0_out[10]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \MA[11]_i_1 
       (.I0(MA_OBUF[11]),
        .I1(MA_E_OBUF),
        .I2(\MA[11]_i_2_n_0 ),
        .I3(\MA[11]_i_3_n_0 ),
        .I4(MD0_out[11]),
        .I5(\MA[11]_i_5_n_0 ),
        .O(\MA[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000104)) 
    \MA[11]_i_2 
       (.I0(PRState_OBUF[0]),
        .I1(PRState_OBUF[2]),
        .I2(PRState_OBUF[1]),
        .I3(PRState_OBUF[3]),
        .I4(PRState_OBUF[4]),
        .O(\MA[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000002)) 
    \MA[11]_i_3 
       (.I0(MD0[11]),
        .I1(PRState_OBUF[2]),
        .I2(PRState_OBUF[1]),
        .I3(PRState_OBUF[3]),
        .I4(PRState_OBUF[4]),
        .I5(IR_OBUF[11]),
        .O(\MA[11]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \MA[11]_i_4 
       (.I0(MD0[11]),
        .I1(MD_E_OBUF),
        .I2(MD_OBUF[11]),
        .O(MD0_out[11]));
  LUT5 #(
    .INIT(32'h00001800)) 
    \MA[11]_i_5 
       (.I0(PRState_OBUF[0]),
        .I1(PRState_OBUF[2]),
        .I2(PRState_OBUF[1]),
        .I3(PRState_OBUF[3]),
        .I4(PRState_OBUF[4]),
        .O(\MA[11]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \MA[1]_i_1 
       (.I0(MA_OBUF[1]),
        .I1(MA_E_OBUF),
        .I2(\MA[11]_i_2_n_0 ),
        .I3(\MA[1]_i_2_n_0 ),
        .I4(MD0_out[1]),
        .I5(\MA[11]_i_5_n_0 ),
        .O(\MA[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000002)) 
    \MA[1]_i_2 
       (.I0(MD0[1]),
        .I1(PRState_OBUF[2]),
        .I2(PRState_OBUF[1]),
        .I3(PRState_OBUF[3]),
        .I4(PRState_OBUF[4]),
        .I5(IR_OBUF[1]),
        .O(\MA[1]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \MA[1]_i_3 
       (.I0(MD0[1]),
        .I1(MD_E_OBUF),
        .I2(MD_OBUF[1]),
        .O(MD0_out[1]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \MA[2]_i_1 
       (.I0(MA_OBUF[2]),
        .I1(MA_E_OBUF),
        .I2(\MA[11]_i_2_n_0 ),
        .I3(\MA[2]_i_2_n_0 ),
        .I4(MD0_out[2]),
        .I5(\MA[11]_i_5_n_0 ),
        .O(\MA[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000002)) 
    \MA[2]_i_2 
       (.I0(MD0[2]),
        .I1(PRState_OBUF[2]),
        .I2(PRState_OBUF[1]),
        .I3(PRState_OBUF[3]),
        .I4(PRState_OBUF[4]),
        .I5(IR_OBUF[2]),
        .O(\MA[2]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \MA[2]_i_3 
       (.I0(MD0[2]),
        .I1(MD_E_OBUF),
        .I2(MD_OBUF[2]),
        .O(MD0_out[2]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \MA[3]_i_1 
       (.I0(MA_OBUF[3]),
        .I1(MA_E_OBUF),
        .I2(\MA[11]_i_2_n_0 ),
        .I3(\MA[3]_i_2_n_0 ),
        .I4(MD0_out[3]),
        .I5(\MA[11]_i_5_n_0 ),
        .O(\MA[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000002)) 
    \MA[3]_i_2 
       (.I0(MD0[3]),
        .I1(PRState_OBUF[2]),
        .I2(PRState_OBUF[1]),
        .I3(PRState_OBUF[3]),
        .I4(PRState_OBUF[4]),
        .I5(IR_OBUF[3]),
        .O(\MA[3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \MA[3]_i_3 
       (.I0(MD0[3]),
        .I1(MD_E_OBUF),
        .I2(MD_OBUF[3]),
        .O(MD0_out[3]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \MA[4]_i_1 
       (.I0(MA_OBUF[4]),
        .I1(MA_E_OBUF),
        .I2(\MA[11]_i_2_n_0 ),
        .I3(\MA[4]_i_2_n_0 ),
        .I4(MD0_out[4]),
        .I5(\MA[11]_i_5_n_0 ),
        .O(\MA[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000002)) 
    \MA[4]_i_2 
       (.I0(MD0[4]),
        .I1(PRState_OBUF[2]),
        .I2(PRState_OBUF[1]),
        .I3(PRState_OBUF[3]),
        .I4(PRState_OBUF[4]),
        .I5(IR_OBUF[4]),
        .O(\MA[4]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \MA[4]_i_3 
       (.I0(MD0[4]),
        .I1(MD_E_OBUF),
        .I2(MD_OBUF[4]),
        .O(MD0_out[4]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \MA[5]_i_1 
       (.I0(MA_OBUF[5]),
        .I1(MA_E_OBUF),
        .I2(\MA[11]_i_2_n_0 ),
        .I3(\MA[5]_i_2_n_0 ),
        .I4(MD0_out[5]),
        .I5(\MA[11]_i_5_n_0 ),
        .O(\MA[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000002)) 
    \MA[5]_i_2 
       (.I0(MD0[5]),
        .I1(PRState_OBUF[2]),
        .I2(PRState_OBUF[1]),
        .I3(PRState_OBUF[3]),
        .I4(PRState_OBUF[4]),
        .I5(IR_OBUF[5]),
        .O(\MA[5]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \MA[5]_i_3 
       (.I0(MD0[5]),
        .I1(MD_E_OBUF),
        .I2(MD_OBUF[5]),
        .O(MD0_out[5]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \MA[6]_i_1 
       (.I0(MA_OBUF[6]),
        .I1(MA_E_OBUF),
        .I2(\MA[11]_i_2_n_0 ),
        .I3(\MA[6]_i_2_n_0 ),
        .I4(MD0_out[6]),
        .I5(\MA[11]_i_5_n_0 ),
        .O(\MA[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000002)) 
    \MA[6]_i_2 
       (.I0(MD0[6]),
        .I1(PRState_OBUF[2]),
        .I2(PRState_OBUF[1]),
        .I3(PRState_OBUF[3]),
        .I4(PRState_OBUF[4]),
        .I5(IR_OBUF[6]),
        .O(\MA[6]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \MA[6]_i_3 
       (.I0(MD0[6]),
        .I1(MD_E_OBUF),
        .I2(MD_OBUF[6]),
        .O(MD0_out[6]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \MA[7]_i_1 
       (.I0(MA_OBUF[7]),
        .I1(MA_E_OBUF),
        .I2(\MA[11]_i_2_n_0 ),
        .I3(\MA[7]_i_2_n_0 ),
        .I4(MD0_out[7]),
        .I5(\MA[11]_i_5_n_0 ),
        .O(\MA[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000002)) 
    \MA[7]_i_2 
       (.I0(MD0[7]),
        .I1(PRState_OBUF[2]),
        .I2(PRState_OBUF[1]),
        .I3(PRState_OBUF[3]),
        .I4(PRState_OBUF[4]),
        .I5(IR_OBUF[7]),
        .O(\MA[7]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \MA[7]_i_3 
       (.I0(MD0[7]),
        .I1(MD_E_OBUF),
        .I2(MD_OBUF[7]),
        .O(MD0_out[7]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \MA[8]_i_1 
       (.I0(MA_OBUF[8]),
        .I1(MA_E_OBUF),
        .I2(\MA[11]_i_2_n_0 ),
        .I3(\MA[8]_i_2_n_0 ),
        .I4(MD0_out[8]),
        .I5(\MA[11]_i_5_n_0 ),
        .O(\MA[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000002)) 
    \MA[8]_i_2 
       (.I0(MD0[8]),
        .I1(PRState_OBUF[2]),
        .I2(PRState_OBUF[1]),
        .I3(PRState_OBUF[3]),
        .I4(PRState_OBUF[4]),
        .I5(IR_OBUF[8]),
        .O(\MA[8]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \MA[8]_i_3 
       (.I0(MD0[8]),
        .I1(MD_E_OBUF),
        .I2(MD_OBUF[8]),
        .O(MD0_out[8]));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \MA[9]_i_1 
       (.I0(MA_OBUF[9]),
        .I1(MA_E_OBUF),
        .I2(\MA[11]_i_2_n_0 ),
        .I3(\MA[9]_i_2_n_0 ),
        .I4(MD0_out[9]),
        .I5(\MA[11]_i_5_n_0 ),
        .O(\MA[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000002)) 
    \MA[9]_i_2 
       (.I0(MD0[9]),
        .I1(PRState_OBUF[2]),
        .I2(PRState_OBUF[1]),
        .I3(PRState_OBUF[3]),
        .I4(PRState_OBUF[4]),
        .I5(IR_OBUF[9]),
        .O(\MA[9]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \MA[9]_i_3 
       (.I0(MD0[9]),
        .I1(MD_E_OBUF),
        .I2(MD_OBUF[9]),
        .O(MD0_out[9]));
  OBUF MA_C_OBUF_inst
       (.I(MA_C_OBUF),
        .O(MA_C));
  LUT5 #(
    .INIT(32'h04000040)) 
    MA_C_OBUF_inst_i_1
       (.I0(PRState_OBUF[4]),
        .I1(PRState_OBUF[3]),
        .I2(PRState_OBUF[1]),
        .I3(PRState_OBUF[2]),
        .I4(PRState_OBUF[0]),
        .O(MA_C_OBUF));
  OBUF MA_E_OBUF_inst
       (.I(MA_E_OBUF),
        .O(MA_E));
  LUT5 #(
    .INIT(32'h04000144)) 
    MA_E_OBUF_inst_i_1
       (.I0(PRState_OBUF[4]),
        .I1(PRState_OBUF[3]),
        .I2(PRState_OBUF[1]),
        .I3(PRState_OBUF[2]),
        .I4(PRState_OBUF[0]),
        .O(MA_E_OBUF));
  OBUF \MA_OBUF[0]_inst 
       (.I(MA_OBUF[0]),
        .O(MA[0]));
  OBUF \MA_OBUF[10]_inst 
       (.I(MA_OBUF[10]),
        .O(MA[10]));
  OBUF \MA_OBUF[11]_inst 
       (.I(MA_OBUF[11]),
        .O(MA[11]));
  OBUF \MA_OBUF[1]_inst 
       (.I(MA_OBUF[1]),
        .O(MA[1]));
  OBUF \MA_OBUF[2]_inst 
       (.I(MA_OBUF[2]),
        .O(MA[2]));
  OBUF \MA_OBUF[3]_inst 
       (.I(MA_OBUF[3]),
        .O(MA[3]));
  OBUF \MA_OBUF[4]_inst 
       (.I(MA_OBUF[4]),
        .O(MA[4]));
  OBUF \MA_OBUF[5]_inst 
       (.I(MA_OBUF[5]),
        .O(MA[5]));
  OBUF \MA_OBUF[6]_inst 
       (.I(MA_OBUF[6]),
        .O(MA[6]));
  OBUF \MA_OBUF[7]_inst 
       (.I(MA_OBUF[7]),
        .O(MA[7]));
  OBUF \MA_OBUF[8]_inst 
       (.I(MA_OBUF[8]),
        .O(MA[8]));
  OBUF \MA_OBUF[9]_inst 
       (.I(MA_OBUF[9]),
        .O(MA[9]));
  FDRE #(
    .INIT(1'b0)) 
    \MA_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\MA[0]_i_1_n_0 ),
        .Q(MA_OBUF[0]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MA_reg[10] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\MA[10]_i_1_n_0 ),
        .Q(MA_OBUF[10]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MA_reg[11] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\MA[11]_i_1_n_0 ),
        .Q(MA_OBUF[11]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MA_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\MA[1]_i_1_n_0 ),
        .Q(MA_OBUF[1]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MA_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\MA[2]_i_1_n_0 ),
        .Q(MA_OBUF[2]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MA_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\MA[3]_i_1_n_0 ),
        .Q(MA_OBUF[3]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MA_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\MA[4]_i_1_n_0 ),
        .Q(MA_OBUF[4]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MA_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\MA[5]_i_1_n_0 ),
        .Q(MA_OBUF[5]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MA_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\MA[6]_i_1_n_0 ),
        .Q(MA_OBUF[6]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MA_reg[7] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\MA[7]_i_1_n_0 ),
        .Q(MA_OBUF[7]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MA_reg[8] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\MA[8]_i_1_n_0 ),
        .Q(MA_OBUF[8]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MA_reg[9] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\MA[9]_i_1_n_0 ),
        .Q(MA_OBUF[9]),
        .R(reset_IBUF));
  OBUF MD_E_OBUF_inst
       (.I(MD_E_OBUF),
        .O(MD_E));
  LUT5 #(
    .INIT(32'h00004068)) 
    MD_E_OBUF_inst_i_1
       (.I0(PRState_OBUF[0]),
        .I1(PRState_OBUF[2]),
        .I2(PRState_OBUF[3]),
        .I3(PRState_OBUF[1]),
        .I4(PRState_OBUF[4]),
        .O(MD_E_OBUF));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \MD_OBUF[0]_inst 
       (.I(\MD_reg[0]_lopt_replica_1 ),
        .O(MD[0]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \MD_OBUF[10]_inst 
       (.I(\MD_reg[10]_lopt_replica_1 ),
        .O(MD[10]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \MD_OBUF[11]_inst 
       (.I(\MD_reg[11]_lopt_replica_1 ),
        .O(MD[11]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \MD_OBUF[12]_inst 
       (.I(\MD_reg[12]_lopt_replica_1 ),
        .O(MD[12]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \MD_OBUF[13]_inst 
       (.I(\MD_reg[13]_lopt_replica_1 ),
        .O(MD[13]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \MD_OBUF[14]_inst 
       (.I(\MD_reg[14]_lopt_replica_1 ),
        .O(MD[14]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \MD_OBUF[15]_inst 
       (.I(\MD_reg[15]_lopt_replica_1 ),
        .O(MD[15]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \MD_OBUF[1]_inst 
       (.I(\MD_reg[1]_lopt_replica_1 ),
        .O(MD[1]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \MD_OBUF[2]_inst 
       (.I(\MD_reg[2]_lopt_replica_1 ),
        .O(MD[2]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \MD_OBUF[3]_inst 
       (.I(\MD_reg[3]_lopt_replica_1 ),
        .O(MD[3]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \MD_OBUF[4]_inst 
       (.I(\MD_reg[4]_lopt_replica_1 ),
        .O(MD[4]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \MD_OBUF[5]_inst 
       (.I(\MD_reg[5]_lopt_replica_1 ),
        .O(MD[5]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \MD_OBUF[6]_inst 
       (.I(\MD_reg[6]_lopt_replica_1 ),
        .O(MD[6]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \MD_OBUF[7]_inst 
       (.I(\MD_reg[7]_lopt_replica_1 ),
        .O(MD[7]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \MD_OBUF[8]_inst 
       (.I(\MD_reg[8]_lopt_replica_1 ),
        .O(MD[8]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \MD_OBUF[9]_inst 
       (.I(\MD_reg[9]_lopt_replica_1 ),
        .O(MD[9]));
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[0]),
        .Q(MD_OBUF[0]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[0]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[0]),
        .Q(\MD_reg[0]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[10] 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[10]),
        .Q(MD_OBUF[10]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[10]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[10]),
        .Q(\MD_reg[10]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[11] 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[11]),
        .Q(MD_OBUF[11]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[11]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[11]),
        .Q(\MD_reg[11]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[12] 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[12]),
        .Q(MD_OBUF[12]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[12]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[12]),
        .Q(\MD_reg[12]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[13] 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[13]),
        .Q(MD_OBUF[13]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[13]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[13]),
        .Q(\MD_reg[13]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[14] 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[14]),
        .Q(MD_OBUF[14]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[14]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[14]),
        .Q(\MD_reg[14]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[15] 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[15]),
        .Q(MD_OBUF[15]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[15]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[15]),
        .Q(\MD_reg[15]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[1]),
        .Q(MD_OBUF[1]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[1]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[1]),
        .Q(\MD_reg[1]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[2]),
        .Q(MD_OBUF[2]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[2]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[2]),
        .Q(\MD_reg[2]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[3]),
        .Q(MD_OBUF[3]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[3]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[3]),
        .Q(\MD_reg[3]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[4]),
        .Q(MD_OBUF[4]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[4]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[4]),
        .Q(\MD_reg[4]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[5]),
        .Q(MD_OBUF[5]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[5]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[5]),
        .Q(\MD_reg[5]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[6]),
        .Q(MD_OBUF[6]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[6]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[6]),
        .Q(\MD_reg[6]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[7] 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[7]),
        .Q(MD_OBUF[7]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[7]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[7]),
        .Q(\MD_reg[7]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[8] 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[8]),
        .Q(MD_OBUF[8]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[8]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[8]),
        .Q(\MD_reg[8]_lopt_replica_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[9] 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[9]),
        .Q(MD_OBUF[9]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \MD_reg[9]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(MD_E_OBUF),
        .D(MD0[9]),
        .Q(\MD_reg[9]_lopt_replica_1 ),
        .R(reset_IBUF));
  OBUF MEM_C_OBUF_inst
       (.I(MEM_C_OBUF),
        .O(MEM_C));
  LUT5 #(
    .INIT(32'h00004000)) 
    MEM_C_OBUF_inst_i_1
       (.I0(PRState_OBUF[2]),
        .I1(PRState_OBUF[1]),
        .I2(PRState_OBUF[0]),
        .I3(PRState_OBUF[3]),
        .I4(PRState_OBUF[4]),
        .O(MEM_C_OBUF));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAABA)) 
    \NXState[0]_i_1 
       (.I0(\NXState[0]_i_2_n_0 ),
        .I1(PRState_OBUF[4]),
        .I2(PRState_OBUF[2]),
        .I3(PRState_OBUF[3]),
        .I4(PRState_OBUF[1]),
        .I5(PRState_OBUF[0]),
        .O(\NXState[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FF000200000002)) 
    \NXState[0]_i_2 
       (.I0(\NXState[0]_i_3_n_0 ),
        .I1(PRState_OBUF[1]),
        .I2(PRState_OBUF[2]),
        .I3(PRState_OBUF[4]),
        .I4(PRState_OBUF[3]),
        .I5(\NXState[0]_i_4_n_0 ),
        .O(\NXState[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h75557755)) 
    \NXState[0]_i_3 
       (.I0(PRState_OBUF[0]),
        .I1(IR_OBUF[15]),
        .I2(IR_OBUF[13]),
        .I3(IR_OBUF[14]),
        .I4(AM_BIT_OBUF),
        .O(\NXState[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000FFF0000C5F5)) 
    \NXState[0]_i_4 
       (.I0(\NXState[2]_i_3_n_0 ),
        .I1(AM_BIT_OBUF),
        .I2(\NXState[4]_i_4_n_0 ),
        .I3(\NXState[4]_i_3_n_0 ),
        .I4(PRState_OBUF[0]),
        .I5(PRState_OBUF[1]),
        .O(\NXState[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000F0AACCCC)) 
    \NXState[1]_i_1 
       (.I0(\NXState[1]_i_2_n_0 ),
        .I1(\NXState[1]_i_3_n_0 ),
        .I2(\NXState[1]_i_4_n_0 ),
        .I3(PRState_OBUF[2]),
        .I4(PRState_OBUF[3]),
        .I5(PRState_OBUF[4]),
        .O(\NXState[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5555AAAA5555ABAA)) 
    \NXState[1]_i_2 
       (.I0(PRState_OBUF[0]),
        .I1(IR_OBUF[13]),
        .I2(IR_OBUF[14]),
        .I3(IR_OBUF[15]),
        .I4(PRState_OBUF[1]),
        .I5(AM_BIT_OBUF),
        .O(\NXState[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAFABF00000000)) 
    \NXState[1]_i_3 
       (.I0(PRState_OBUF[2]),
        .I1(AM_BIT_OBUF),
        .I2(IR_OBUF[14]),
        .I3(IR_OBUF[13]),
        .I4(IR_OBUF[15]),
        .I5(\NXState[1]_i_5_n_0 ),
        .O(\NXState[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0C0C0C0C0C0C3D0C)) 
    \NXState[1]_i_4 
       (.I0(AM_BIT_OBUF),
        .I1(PRState_OBUF[0]),
        .I2(PRState_OBUF[1]),
        .I3(IR_OBUF[13]),
        .I4(IR_OBUF[15]),
        .I5(IR_OBUF[14]),
        .O(\NXState[1]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \NXState[1]_i_5 
       (.I0(PRState_OBUF[0]),
        .I1(PRState_OBUF[1]),
        .O(\NXState[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000F0F0FF008888)) 
    \NXState[2]_i_1 
       (.I0(\NXState[2]_i_2_n_0 ),
        .I1(\NXState[2]_i_3_n_0 ),
        .I2(\NXState[2]_i_4_n_0 ),
        .I3(\NXState[3]_i_3_n_0 ),
        .I4(\NXState[4]_i_4_n_0 ),
        .I5(\NXState[4]_i_5_n_0 ),
        .O(\NXState[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \NXState[2]_i_2 
       (.I0(PRState_OBUF[0]),
        .I1(PRState_OBUF[1]),
        .O(\NXState[2]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hEF)) 
    \NXState[2]_i_3 
       (.I0(IR_OBUF[13]),
        .I1(IR_OBUF[14]),
        .I2(IR_OBUF[15]),
        .O(\NXState[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000AAAE0000AAAA)) 
    \NXState[2]_i_4 
       (.I0(PRState_OBUF[2]),
        .I1(IR_OBUF[14]),
        .I2(IR_OBUF[13]),
        .I3(IR_OBUF[15]),
        .I4(PRState_OBUF[1]),
        .I5(PRState_OBUF[0]),
        .O(\NXState[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h308830BB30BB30BB)) 
    \NXState[3]_i_1 
       (.I0(\NXState[3]_i_2_n_0 ),
        .I1(\NXState[4]_i_5_n_0 ),
        .I2(\NXState[3]_i_3_n_0 ),
        .I3(\NXState[4]_i_4_n_0 ),
        .I4(PRState_OBUF[0]),
        .I5(PRState_OBUF[1]),
        .O(\NXState[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0400040004040400)) 
    \NXState[3]_i_2 
       (.I0(PRState_OBUF[1]),
        .I1(PRState_OBUF[0]),
        .I2(PRState_OBUF[2]),
        .I3(IR_OBUF[15]),
        .I4(IR_OBUF[13]),
        .I5(IR_OBUF[14]),
        .O(\NXState[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0E0E0E0E0E0E3F0E)) 
    \NXState[3]_i_3 
       (.I0(AM_BIT_OBUF),
        .I1(PRState_OBUF[0]),
        .I2(PRState_OBUF[1]),
        .I3(IR_OBUF[13]),
        .I4(IR_OBUF[15]),
        .I5(IR_OBUF[14]),
        .O(\NXState[3]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0001FFFF)) 
    \NXState[4]_i_1 
       (.I0(PRState_OBUF[2]),
        .I1(PRState_OBUF[1]),
        .I2(PRState_OBUF[0]),
        .I3(PRState_OBUF[3]),
        .I4(PRState_OBUF[4]),
        .O(\NXState[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000008080008)) 
    \NXState[4]_i_2 
       (.I0(\NXState[4]_i_3_n_0 ),
        .I1(\NXState[4]_i_4_n_0 ),
        .I2(\NXState[4]_i_5_n_0 ),
        .I3(AM_BIT_OBUF),
        .I4(PRState_OBUF[1]),
        .I5(PRState_OBUF[0]),
        .O(\NXState[4]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hFD)) 
    \NXState[4]_i_3 
       (.I0(IR_OBUF[13]),
        .I1(IR_OBUF[15]),
        .I2(IR_OBUF[14]),
        .O(\NXState[4]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hF8)) 
    \NXState[4]_i_4 
       (.I0(PRState_OBUF[3]),
        .I1(PRState_OBUF[2]),
        .I2(PRState_OBUF[4]),
        .O(\NXState[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \NXState[4]_i_5 
       (.I0(PRState_OBUF[4]),
        .I1(PRState_OBUF[3]),
        .O(\NXState[4]_i_5_n_0 ));
  OBUF \NXState_OBUF[0]_inst 
       (.I(NXState_OBUF[0]),
        .O(NXState[0]));
  OBUF \NXState_OBUF[1]_inst 
       (.I(NXState_OBUF[1]),
        .O(NXState[1]));
  OBUF \NXState_OBUF[2]_inst 
       (.I(NXState_OBUF[2]),
        .O(NXState[2]));
  OBUF \NXState_OBUF[3]_inst 
       (.I(NXState_OBUF[3]),
        .O(NXState[3]));
  OBUF \NXState_OBUF[4]_inst 
       (.I(NXState_OBUF[4]),
        .O(NXState[4]));
  FDRE #(
    .INIT(1'b0)) 
    \NXState_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(\NXState[4]_i_1_n_0 ),
        .D(\NXState[0]_i_1_n_0 ),
        .Q(NXState_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \NXState_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(\NXState[4]_i_1_n_0 ),
        .D(\NXState[1]_i_1_n_0 ),
        .Q(NXState_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \NXState_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(\NXState[4]_i_1_n_0 ),
        .D(\NXState[2]_i_1_n_0 ),
        .Q(NXState_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \NXState_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(\NXState[4]_i_1_n_0 ),
        .D(\NXState[3]_i_1_n_0 ),
        .Q(NXState_OBUF[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \NXState_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(\NXState[4]_i_1_n_0 ),
        .D(\NXState[4]_i_2_n_0 ),
        .Q(NXState_OBUF[4]),
        .R(1'b0));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \OP_CODE_OBUF[0]_inst 
       (.I(\OP_CODE_reg[0]_lopt_replica_2_1 ),
        .O(OP_CODE[0]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \OP_CODE_OBUF[1]_inst 
       (.I(\OP_CODE_reg[1]_lopt_replica_2_1 ),
        .O(OP_CODE[1]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \OP_CODE_OBUF[2]_inst 
       (.I(\OP_CODE_reg[2]_lopt_replica_2_1 ),
        .O(OP_CODE[2]));
  FDRE #(
    .INIT(1'b0)) 
    \OP_CODE_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[13]),
        .Q(IR_OBUF[13]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \OP_CODE_reg[0]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[13]),
        .Q(\OP_CODE_reg[0]_lopt_replica_1 ),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \OP_CODE_reg[0]_lopt_replica_2 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[13]),
        .Q(\OP_CODE_reg[0]_lopt_replica_2_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \OP_CODE_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[14]),
        .Q(IR_OBUF[14]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \OP_CODE_reg[1]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[14]),
        .Q(\OP_CODE_reg[1]_lopt_replica_1 ),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \OP_CODE_reg[1]_lopt_replica_2 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[14]),
        .Q(\OP_CODE_reg[1]_lopt_replica_2_1 ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \OP_CODE_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[15]),
        .Q(IR_OBUF[15]),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \OP_CODE_reg[2]_lopt_replica 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[15]),
        .Q(\OP_CODE_reg[2]_lopt_replica_1 ),
        .R(reset_IBUF));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    \OP_CODE_reg[2]_lopt_replica_2 
       (.C(CLK_IBUF_BUFG),
        .CE(IR_E_OBUF),
        .D(MD0[15]),
        .Q(\OP_CODE_reg[2]_lopt_replica_2_1 ),
        .R(reset_IBUF));
  LUT6 #(
    .INIT(64'hF8C8FFFF3B0B0000)) 
    \PC[0]_i_1 
       (.I0(MD0_out[0]),
        .I1(PC_C_OBUF[1]),
        .I2(PC_C_OBUF[0]),
        .I3(\MA[0]_i_2_n_0 ),
        .I4(PC_E_OBUF),
        .I5(PC_OBUF[0]),
        .O(\PC[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAFFFFFFEA0000)) 
    \PC[10]_i_1 
       (.I0(\PC[10]_i_2_n_0 ),
        .I1(p_5_in[10]),
        .I2(\PC[11]_i_4_n_0 ),
        .I3(\PC[10]_i_3_n_0 ),
        .I4(PC_E_OBUF),
        .I5(PC_OBUF[10]),
        .O(\PC[10]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8A80)) 
    \PC[10]_i_2 
       (.I0(\PC[11]_i_6_n_0 ),
        .I1(MD0[10]),
        .I2(MD_E_OBUF),
        .I3(MD_OBUF[10]),
        .O(\PC[10]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hE200)) 
    \PC[10]_i_3 
       (.I0(IR_OBUF[10]),
        .I1(IR_E_OBUF),
        .I2(MD0[10]),
        .I3(\PC[11]_i_7_n_0 ),
        .O(\PC[10]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAFFFFFFEA0000)) 
    \PC[11]_i_1 
       (.I0(\PC[11]_i_2_n_0 ),
        .I1(p_5_in[11]),
        .I2(\PC[11]_i_4_n_0 ),
        .I3(\PC[11]_i_5_n_0 ),
        .I4(PC_E_OBUF),
        .I5(PC_OBUF[11]),
        .O(\PC[11]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8A80)) 
    \PC[11]_i_2 
       (.I0(\PC[11]_i_6_n_0 ),
        .I1(MD0[11]),
        .I2(MD_E_OBUF),
        .I3(MD_OBUF[11]),
        .O(\PC[11]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hEFFF)) 
    \PC[11]_i_4 
       (.I0(PRState_OBUF[4]),
        .I1(PRState_OBUF[3]),
        .I2(PRState_OBUF[2]),
        .I3(PRState_OBUF[1]),
        .O(\PC[11]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hE200)) 
    \PC[11]_i_5 
       (.I0(IR_OBUF[11]),
        .I1(IR_E_OBUF),
        .I2(MD0[11]),
        .I3(\PC[11]_i_7_n_0 ),
        .O(\PC[11]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h00001000)) 
    \PC[11]_i_6 
       (.I0(PRState_OBUF[4]),
        .I1(PRState_OBUF[3]),
        .I2(PRState_OBUF[2]),
        .I3(PRState_OBUF[1]),
        .I4(PRState_OBUF[0]),
        .O(\PC[11]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h02000000)) 
    \PC[11]_i_7 
       (.I0(PRState_OBUF[0]),
        .I1(PRState_OBUF[4]),
        .I2(PRState_OBUF[3]),
        .I3(PRState_OBUF[2]),
        .I4(PRState_OBUF[1]),
        .O(\PC[11]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAFFFFFFEA0000)) 
    \PC[1]_i_1 
       (.I0(\PC[1]_i_2_n_0 ),
        .I1(p_5_in[1]),
        .I2(\PC[11]_i_4_n_0 ),
        .I3(\PC[1]_i_3_n_0 ),
        .I4(PC_E_OBUF),
        .I5(PC_OBUF[1]),
        .O(\PC[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8A80)) 
    \PC[1]_i_2 
       (.I0(\PC[11]_i_6_n_0 ),
        .I1(MD0[1]),
        .I2(MD_E_OBUF),
        .I3(MD_OBUF[1]),
        .O(\PC[1]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hE200)) 
    \PC[1]_i_3 
       (.I0(IR_OBUF[1]),
        .I1(IR_E_OBUF),
        .I2(MD0[1]),
        .I3(\PC[11]_i_7_n_0 ),
        .O(\PC[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAFFFFFFEA0000)) 
    \PC[2]_i_1 
       (.I0(\PC[2]_i_2_n_0 ),
        .I1(p_5_in[2]),
        .I2(\PC[11]_i_4_n_0 ),
        .I3(\PC[2]_i_3_n_0 ),
        .I4(PC_E_OBUF),
        .I5(PC_OBUF[2]),
        .O(\PC[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8A80)) 
    \PC[2]_i_2 
       (.I0(\PC[11]_i_6_n_0 ),
        .I1(MD0[2]),
        .I2(MD_E_OBUF),
        .I3(MD_OBUF[2]),
        .O(\PC[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hE200)) 
    \PC[2]_i_3 
       (.I0(IR_OBUF[2]),
        .I1(IR_E_OBUF),
        .I2(MD0[2]),
        .I3(\PC[11]_i_7_n_0 ),
        .O(\PC[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAFFFFFFEA0000)) 
    \PC[3]_i_1 
       (.I0(\PC[3]_i_2_n_0 ),
        .I1(p_5_in[3]),
        .I2(\PC[11]_i_4_n_0 ),
        .I3(\PC[3]_i_3_n_0 ),
        .I4(PC_E_OBUF),
        .I5(PC_OBUF[3]),
        .O(\PC[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8A80)) 
    \PC[3]_i_2 
       (.I0(\PC[11]_i_6_n_0 ),
        .I1(MD0[3]),
        .I2(MD_E_OBUF),
        .I3(MD_OBUF[3]),
        .O(\PC[3]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hE200)) 
    \PC[3]_i_3 
       (.I0(IR_OBUF[3]),
        .I1(IR_E_OBUF),
        .I2(MD0[3]),
        .I3(\PC[11]_i_7_n_0 ),
        .O(\PC[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAFFFFFFEA0000)) 
    \PC[4]_i_1 
       (.I0(\PC[4]_i_2_n_0 ),
        .I1(p_5_in[4]),
        .I2(\PC[11]_i_4_n_0 ),
        .I3(\PC[4]_i_4_n_0 ),
        .I4(PC_E_OBUF),
        .I5(PC_OBUF[4]),
        .O(\PC[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8A80)) 
    \PC[4]_i_2 
       (.I0(\PC[11]_i_6_n_0 ),
        .I1(MD0[4]),
        .I2(MD_E_OBUF),
        .I3(MD_OBUF[4]),
        .O(\PC[4]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hE200)) 
    \PC[4]_i_4 
       (.I0(IR_OBUF[4]),
        .I1(IR_E_OBUF),
        .I2(MD0[4]),
        .I3(\PC[11]_i_7_n_0 ),
        .O(\PC[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAFFFFFFEA0000)) 
    \PC[5]_i_1 
       (.I0(\PC[5]_i_2_n_0 ),
        .I1(p_5_in[5]),
        .I2(\PC[11]_i_4_n_0 ),
        .I3(\PC[5]_i_3_n_0 ),
        .I4(PC_E_OBUF),
        .I5(PC_OBUF[5]),
        .O(\PC[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8A80)) 
    \PC[5]_i_2 
       (.I0(\PC[11]_i_6_n_0 ),
        .I1(MD0[5]),
        .I2(MD_E_OBUF),
        .I3(MD_OBUF[5]),
        .O(\PC[5]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hE200)) 
    \PC[5]_i_3 
       (.I0(IR_OBUF[5]),
        .I1(IR_E_OBUF),
        .I2(MD0[5]),
        .I3(\PC[11]_i_7_n_0 ),
        .O(\PC[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAFFFFFFEA0000)) 
    \PC[6]_i_1 
       (.I0(\PC[6]_i_2_n_0 ),
        .I1(p_5_in[6]),
        .I2(\PC[11]_i_4_n_0 ),
        .I3(\PC[6]_i_3_n_0 ),
        .I4(PC_E_OBUF),
        .I5(PC_OBUF[6]),
        .O(\PC[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8A80)) 
    \PC[6]_i_2 
       (.I0(\PC[11]_i_6_n_0 ),
        .I1(MD0[6]),
        .I2(MD_E_OBUF),
        .I3(MD_OBUF[6]),
        .O(\PC[6]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hE200)) 
    \PC[6]_i_3 
       (.I0(IR_OBUF[6]),
        .I1(IR_E_OBUF),
        .I2(MD0[6]),
        .I3(\PC[11]_i_7_n_0 ),
        .O(\PC[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAFFFFFFEA0000)) 
    \PC[7]_i_1 
       (.I0(\PC[7]_i_2_n_0 ),
        .I1(p_5_in[7]),
        .I2(\PC[11]_i_4_n_0 ),
        .I3(\PC[7]_i_3_n_0 ),
        .I4(PC_E_OBUF),
        .I5(PC_OBUF[7]),
        .O(\PC[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8A80)) 
    \PC[7]_i_2 
       (.I0(\PC[11]_i_6_n_0 ),
        .I1(MD0[7]),
        .I2(MD_E_OBUF),
        .I3(MD_OBUF[7]),
        .O(\PC[7]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hE200)) 
    \PC[7]_i_3 
       (.I0(IR_OBUF[7]),
        .I1(IR_E_OBUF),
        .I2(MD0[7]),
        .I3(\PC[11]_i_7_n_0 ),
        .O(\PC[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAFFFFFFEA0000)) 
    \PC[8]_i_1 
       (.I0(\PC[8]_i_2_n_0 ),
        .I1(p_5_in[8]),
        .I2(\PC[11]_i_4_n_0 ),
        .I3(\PC[8]_i_4_n_0 ),
        .I4(PC_E_OBUF),
        .I5(PC_OBUF[8]),
        .O(\PC[8]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8A80)) 
    \PC[8]_i_2 
       (.I0(\PC[11]_i_6_n_0 ),
        .I1(MD0[8]),
        .I2(MD_E_OBUF),
        .I3(MD_OBUF[8]),
        .O(\PC[8]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hE200)) 
    \PC[8]_i_4 
       (.I0(IR_OBUF[8]),
        .I1(IR_E_OBUF),
        .I2(MD0[8]),
        .I3(\PC[11]_i_7_n_0 ),
        .O(\PC[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFEAFFFFFFEA0000)) 
    \PC[9]_i_1 
       (.I0(\PC[9]_i_2_n_0 ),
        .I1(p_5_in[9]),
        .I2(\PC[11]_i_4_n_0 ),
        .I3(\PC[9]_i_3_n_0 ),
        .I4(PC_E_OBUF),
        .I5(PC_OBUF[9]),
        .O(\PC[9]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8A80)) 
    \PC[9]_i_2 
       (.I0(\PC[11]_i_6_n_0 ),
        .I1(MD0[9]),
        .I2(MD_E_OBUF),
        .I3(MD_OBUF[9]),
        .O(\PC[9]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hE200)) 
    \PC[9]_i_3 
       (.I0(IR_OBUF[9]),
        .I1(IR_E_OBUF),
        .I2(MD0[9]),
        .I3(\PC[11]_i_7_n_0 ),
        .O(\PC[9]_i_3_n_0 ));
  OBUF \PC_C_OBUF[0]_inst 
       (.I(PC_C_OBUF[0]),
        .O(PC_C[0]));
  LUT5 #(
    .INIT(32'h00000080)) 
    \PC_C_OBUF[0]_inst_i_1 
       (.I0(PRState_OBUF[0]),
        .I1(PRState_OBUF[1]),
        .I2(PRState_OBUF[2]),
        .I3(PRState_OBUF[3]),
        .I4(PRState_OBUF[4]),
        .O(PC_C_OBUF[0]));
  OBUF \PC_C_OBUF[1]_inst 
       (.I(PC_C_OBUF[1]),
        .O(PC_C[1]));
  LUT5 #(
    .INIT(32'h00000008)) 
    \PC_C_OBUF[1]_inst_i_1 
       (.I0(PRState_OBUF[1]),
        .I1(PRState_OBUF[2]),
        .I2(PRState_OBUF[3]),
        .I3(PRState_OBUF[4]),
        .I4(PRState_OBUF[0]),
        .O(PC_C_OBUF[1]));
  OBUF PC_E_OBUF_inst
       (.I(PC_E_OBUF),
        .O(PC_E));
  LUT5 #(
    .INIT(32'h10100100)) 
    PC_E_OBUF_inst_i_1
       (.I0(PRState_OBUF[4]),
        .I1(PRState_OBUF[3]),
        .I2(PRState_OBUF[1]),
        .I3(PRState_OBUF[0]),
        .I4(PRState_OBUF[2]),
        .O(PC_E_OBUF));
  OBUF \PC_OBUF[0]_inst 
       (.I(PC_OBUF[0]),
        .O(PC[0]));
  OBUF \PC_OBUF[10]_inst 
       (.I(PC_OBUF[10]),
        .O(PC[10]));
  OBUF \PC_OBUF[11]_inst 
       (.I(PC_OBUF[11]),
        .O(PC[11]));
  OBUF \PC_OBUF[1]_inst 
       (.I(PC_OBUF[1]),
        .O(PC[1]));
  OBUF \PC_OBUF[2]_inst 
       (.I(PC_OBUF[2]),
        .O(PC[2]));
  OBUF \PC_OBUF[3]_inst 
       (.I(PC_OBUF[3]),
        .O(PC[3]));
  OBUF \PC_OBUF[4]_inst 
       (.I(PC_OBUF[4]),
        .O(PC[4]));
  OBUF \PC_OBUF[5]_inst 
       (.I(PC_OBUF[5]),
        .O(PC[5]));
  OBUF \PC_OBUF[6]_inst 
       (.I(PC_OBUF[6]),
        .O(PC[6]));
  OBUF \PC_OBUF[7]_inst 
       (.I(PC_OBUF[7]),
        .O(PC[7]));
  OBUF \PC_OBUF[8]_inst 
       (.I(PC_OBUF[8]),
        .O(PC[8]));
  OBUF \PC_OBUF[9]_inst 
       (.I(PC_OBUF[9]),
        .O(PC[9]));
  FDRE #(
    .INIT(1'b0)) 
    \PC_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PC[0]_i_1_n_0 ),
        .Q(PC_OBUF[0]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PC_reg[10] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PC[10]_i_1_n_0 ),
        .Q(PC_OBUF[10]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PC_reg[11] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PC[11]_i_1_n_0 ),
        .Q(PC_OBUF[11]),
        .R(reset_IBUF));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \PC_reg[11]_i_3 
       (.CI(\PC_reg[8]_i_3_n_0 ),
        .CO(\NLW_PC_reg[11]_i_3_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_PC_reg[11]_i_3_O_UNCONNECTED [3],p_5_in[11:9]}),
        .S({1'b0,PC_OBUF[11:9]}));
  FDRE #(
    .INIT(1'b0)) 
    \PC_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PC[1]_i_1_n_0 ),
        .Q(PC_OBUF[1]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PC_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PC[2]_i_1_n_0 ),
        .Q(PC_OBUF[2]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PC_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PC[3]_i_1_n_0 ),
        .Q(PC_OBUF[3]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PC_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PC[4]_i_1_n_0 ),
        .Q(PC_OBUF[4]),
        .R(reset_IBUF));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \PC_reg[4]_i_3 
       (.CI(1'b0),
        .CO({\PC_reg[4]_i_3_n_0 ,\NLW_PC_reg[4]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(PC_OBUF[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_5_in[4:1]),
        .S(PC_OBUF[4:1]));
  FDRE #(
    .INIT(1'b0)) 
    \PC_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PC[5]_i_1_n_0 ),
        .Q(PC_OBUF[5]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PC_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PC[6]_i_1_n_0 ),
        .Q(PC_OBUF[6]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PC_reg[7] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PC[7]_i_1_n_0 ),
        .Q(PC_OBUF[7]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PC_reg[8] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PC[8]_i_1_n_0 ),
        .Q(PC_OBUF[8]),
        .R(reset_IBUF));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \PC_reg[8]_i_3 
       (.CI(\PC_reg[4]_i_3_n_0 ),
        .CO({\PC_reg[8]_i_3_n_0 ,\NLW_PC_reg[8]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_5_in[8:5]),
        .S(PC_OBUF[8:5]));
  FDRE #(
    .INIT(1'b0)) 
    \PC_reg[9] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\PC[9]_i_1_n_0 ),
        .Q(PC_OBUF[9]),
        .R(reset_IBUF));
  OBUF \PRState_OBUF[0]_inst 
       (.I(PRState_OBUF[0]),
        .O(PRState[0]));
  OBUF \PRState_OBUF[1]_inst 
       (.I(PRState_OBUF[1]),
        .O(PRState[1]));
  OBUF \PRState_OBUF[2]_inst 
       (.I(PRState_OBUF[2]),
        .O(PRState[2]));
  OBUF \PRState_OBUF[3]_inst 
       (.I(PRState_OBUF[3]),
        .O(PRState[3]));
  OBUF \PRState_OBUF[4]_inst 
       (.I(PRState_OBUF[4]),
        .O(PRState[4]));
  FDRE #(
    .INIT(1'b0)) 
    \PRState_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(NXState_OBUF[0]),
        .Q(PRState_OBUF[0]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PRState_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(NXState_OBUF[1]),
        .Q(PRState_OBUF[1]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PRState_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(NXState_OBUF[2]),
        .Q(PRState_OBUF[2]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PRState_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(NXState_OBUF[3]),
        .Q(PRState_OBUF[3]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \PRState_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(NXState_OBUF[4]),
        .Q(PRState_OBUF[4]),
        .R(reset_IBUF));
  OBUF \T1_OBUF[0]_inst 
       (.I(T1_OBUF[0]),
        .O(T1[0]));
  OBUF \T1_OBUF[10]_inst 
       (.I(T1_OBUF[10]),
        .O(T1[10]));
  OBUF \T1_OBUF[11]_inst 
       (.I(T1_OBUF[11]),
        .O(T1[11]));
  OBUF \T1_OBUF[12]_inst 
       (.I(T1_OBUF[12]),
        .O(T1[12]));
  OBUF \T1_OBUF[13]_inst 
       (.I(T1_OBUF[13]),
        .O(T1[13]));
  OBUF \T1_OBUF[14]_inst 
       (.I(T1_OBUF[14]),
        .O(T1[14]));
  OBUF \T1_OBUF[15]_inst 
       (.I(T1_OBUF[15]),
        .O(T1[15]));
  OBUF \T1_OBUF[16]_inst 
       (.I(T1_OBUF[16]),
        .O(T1[16]));
  OBUF \T1_OBUF[1]_inst 
       (.I(T1_OBUF[1]),
        .O(T1[1]));
  OBUF \T1_OBUF[2]_inst 
       (.I(T1_OBUF[2]),
        .O(T1[2]));
  OBUF \T1_OBUF[3]_inst 
       (.I(T1_OBUF[3]),
        .O(T1[3]));
  OBUF \T1_OBUF[4]_inst 
       (.I(T1_OBUF[4]),
        .O(T1[4]));
  OBUF \T1_OBUF[5]_inst 
       (.I(T1_OBUF[5]),
        .O(T1[5]));
  OBUF \T1_OBUF[6]_inst 
       (.I(T1_OBUF[6]),
        .O(T1[6]));
  OBUF \T1_OBUF[7]_inst 
       (.I(T1_OBUF[7]),
        .O(T1[7]));
  OBUF \T1_OBUF[8]_inst 
       (.I(T1_OBUF[8]),
        .O(T1[8]));
  OBUF \T1_OBUF[9]_inst 
       (.I(T1_OBUF[9]),
        .O(T1[9]));
  (* INIT_A = "64'h000000000000CE2E" *) 
  (* INIT_B = "64'h0000000000C08A2A" *) 
  (* INIT_C = "64'h0000000000000000" *) 
  (* INIT_D = "64'h0000000000000000" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "192" *) 
  (* RTL_RAM_NAME = "memory" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "11" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "5" *) 
  RAM32M_UNIQ_BASE_ memory_reg_0_15_0_5
       (.ADDRA({1'b0,A_OBUF[3:0]}),
        .ADDRB({1'b0,A_OBUF[3:0]}),
        .ADDRC({1'b0,A_OBUF[3:0]}),
        .ADDRD({1'b0,memory_reg_0_15_0_5_i_2_n_0,memory_reg_0_15_0_5_i_3_n_0,memory_reg_0_15_0_5_i_4_n_0,memory_reg_0_15_0_5_i_5_n_0}),
        .DIA(T1_OBUF[1:0]),
        .DIB(T1_OBUF[3:2]),
        .DIC(T1_OBUF[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(MD0[1:0]),
        .DOB(MD0[3:2]),
        .DOC(MD0[5:4]),
        .DOD(NLW_memory_reg_0_15_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK_IBUF_BUFG),
        .WE(p_0_in0_out));
  LUT6 #(
    .INIT(64'h0000000000004000)) 
    memory_reg_0_15_0_5_i_1
       (.I0(PRState_OBUF[4]),
        .I1(PRState_OBUF[3]),
        .I2(PRState_OBUF[0]),
        .I3(PRState_OBUF[1]),
        .I4(PRState_OBUF[2]),
        .I5(reset_IBUF),
        .O(p_0_in0_out));
  LUT3 #(
    .INIT(8'hB8)) 
    memory_reg_0_15_0_5_i_2
       (.I0(\MA[3]_i_1_n_0 ),
        .I1(A_C_OBUF),
        .I2(\PC[3]_i_1_n_0 ),
        .O(memory_reg_0_15_0_5_i_2_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    memory_reg_0_15_0_5_i_3
       (.I0(\MA[2]_i_1_n_0 ),
        .I1(A_C_OBUF),
        .I2(\PC[2]_i_1_n_0 ),
        .O(memory_reg_0_15_0_5_i_3_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    memory_reg_0_15_0_5_i_4
       (.I0(\MA[1]_i_1_n_0 ),
        .I1(A_C_OBUF),
        .I2(\PC[1]_i_1_n_0 ),
        .O(memory_reg_0_15_0_5_i_4_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    memory_reg_0_15_0_5_i_5
       (.I0(\MA[0]_i_1_n_0 ),
        .I1(A_C_OBUF),
        .I2(\PC[0]_i_1_n_0 ),
        .O(memory_reg_0_15_0_5_i_5_n_0));
  (* INIT_A = "64'h00000000000028A7" *) 
  (* INIT_B = "64'h0000000000049A6A" *) 
  (* INIT_C = "64'h0000000000000000" *) 
  (* INIT_D = "64'h0000000000000000" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "192" *) 
  (* RTL_RAM_NAME = "memory" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "11" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "15" *) 
  RAM32M_HD11 memory_reg_0_15_12_15
       (.ADDRA({1'b0,A_OBUF[3:0]}),
        .ADDRB({1'b0,A_OBUF[3:0]}),
        .ADDRC({1'b0,A_OBUF[3:0]}),
        .ADDRD({1'b0,memory_reg_0_15_0_5_i_2_n_0,memory_reg_0_15_0_5_i_3_n_0,memory_reg_0_15_0_5_i_4_n_0,memory_reg_0_15_0_5_i_5_n_0}),
        .DIA(T1_OBUF[13:12]),
        .DIB(T1_OBUF[15:14]),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DOA(MD0[13:12]),
        .DOB(MD0[15:14]),
        .DOC(NLW_memory_reg_0_15_12_15_DOC_UNCONNECTED[1:0]),
        .DOD(NLW_memory_reg_0_15_12_15_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK_IBUF_BUFG),
        .WE(p_0_in0_out));
  (* INIT_A = "64'h0000000000000000" *) 
  (* INIT_B = "64'h0000000000000000" *) 
  (* INIT_C = "64'h0000000000000000" *) 
  (* INIT_D = "64'h0000000000000000" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "192" *) 
  (* RTL_RAM_NAME = "memory" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "11" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "11" *) 
  RAM32M_HD12 memory_reg_0_15_6_11
       (.ADDRA({1'b0,A_OBUF[3:0]}),
        .ADDRB({1'b0,A_OBUF[3:0]}),
        .ADDRC({1'b0,A_OBUF[3:0]}),
        .ADDRD({1'b0,memory_reg_0_15_0_5_i_2_n_0,memory_reg_0_15_0_5_i_3_n_0,memory_reg_0_15_0_5_i_4_n_0,memory_reg_0_15_0_5_i_5_n_0}),
        .DIA(T1_OBUF[7:6]),
        .DIB(T1_OBUF[9:8]),
        .DIC(T1_OBUF[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(MD0[7:6]),
        .DOB(MD0[9:8]),
        .DOC(MD0[11:10]),
        .DOD(NLW_memory_reg_0_15_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK_IBUF_BUFG),
        .WE(p_0_in0_out));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  OBUF \state_OBUF[0]_inst 
       (.I(PRState_OBUF[0]),
        .O(state[0]));
  OBUF \state_OBUF[1]_inst 
       (.I(PRState_OBUF[1]),
        .O(state[1]));
  OBUF \state_OBUF[2]_inst 
       (.I(PRState_OBUF[2]),
        .O(state[2]));
  OBUF \state_OBUF[3]_inst 
       (.I(PRState_OBUF[3]),
        .O(state[3]));
  OBUF \state_OBUF[4]_inst 
       (.I(PRState_OBUF[4]),
        .O(state[4]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
