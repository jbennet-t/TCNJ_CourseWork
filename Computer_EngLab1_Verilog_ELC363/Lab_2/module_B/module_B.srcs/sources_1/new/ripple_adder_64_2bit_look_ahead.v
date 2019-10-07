`timescale 1ns / 1ps

// Create Date: 09/19/2019 11:10:44 AM
// Module Name: ripple_adder_64_2bit_look_ahead
// Authors: Jordan Sinoway, Condor Gao


module ripple_adder_64_2bit_look_ahead
(
  input [63:0] A,
  input [63:0] B,
  output [63:0] SUM,
  output CARRY_OUT
);

  // Create wires to connect each full_adder module to another to create a ripple
  wire C_0, C_1, C_2, C_3, C_4, C_5, C_6, C_7, C_8, C_9, C_10;
  wire C_11, C_12, C_13, C_14, C_15, C_16, C_17, C_18, C_19, C_20;
  wire C_21, C_22, C_23, C_24, C_25, C_26, C_27, C_28, C_29, C_30, C_31;

  // The first carry is zero
  assign C_0 = 1'b0;

  two_bits_Carry_Look_Ahead iteration1 (A[1:0], B[1:0], C_0, SUM[1:0], C_1);
  two_bits_Carry_Look_Ahead iteration2 (A[3:2], B[3:2], C_1, SUM[3:2], C_2);
  two_bits_Carry_Look_Ahead iteration3 (A[5:4], B[5:4], C_2, SUM[5:4], C_3);
  two_bits_Carry_Look_Ahead iteration4 (A[7:6], B[7:6], C_3, SUM[7:6], C_4);
  two_bits_Carry_Look_Ahead iteration5 (A[9:8], B[9:8], C_4, SUM[9:8], C_5);
  two_bits_Carry_Look_Ahead iteration6 (A[11:10], B[11:10], C_5, SUM[11:10], C_6);
  two_bits_Carry_Look_Ahead iteration7 (A[13:12], B[13:12], C_6, SUM[13:12], C_7);
  two_bits_Carry_Look_Ahead iteration8 (A[15:14], B[15:14], C_7, SUM[15:14], C_8);
  two_bits_Carry_Look_Ahead iteration9 (A[17:16], B[17:16], C_8, SUM[17:16], C_9);
  two_bits_Carry_Look_Ahead iteration10 (A[19:18], B[19:18], C_9, SUM[19:18], C_10);
  two_bits_Carry_Look_Ahead iteration11 (A[21:20], B[21:20], C_10, SUM[21:20], C_11);
  two_bits_Carry_Look_Ahead iteration12 (A[23:22], B[23:22], C_11, SUM[23:22], C_12);
  two_bits_Carry_Look_Ahead iteration13 (A[25:24], B[25:24], C_12, SUM[25:24], C_13);
  two_bits_Carry_Look_Ahead iteration14 (A[27:26], B[27:26], C_13, SUM[27:26], C_14);
  two_bits_Carry_Look_Ahead iteration15 (A[29:28], B[29:28], C_14, SUM[29:28], C_15);
  two_bits_Carry_Look_Ahead iteration16 (A[31:30], B[31:30], C_15, SUM[31:30], C_16);
  two_bits_Carry_Look_Ahead iteration17 (A[33:32], B[33:32], C_16, SUM[33:32], C_17);
  two_bits_Carry_Look_Ahead iteration18 (A[35:34], B[35:34], C_17, SUM[35:34], C_18);
  two_bits_Carry_Look_Ahead iteration19 (A[37:36], B[37:36], C_18, SUM[37:36], C_19);
  two_bits_Carry_Look_Ahead iteration20 (A[39:38], B[39:38], C_19, SUM[39:38], C_20);
  two_bits_Carry_Look_Ahead iteration21 (A[41:40], B[41:40], C_20, SUM[41:40], C_21);
  two_bits_Carry_Look_Ahead iteration22 (A[43:42], B[43:42], C_21, SUM[43:42], C_22);
  two_bits_Carry_Look_Ahead iteration23 (A[45:44], B[45:44], C_22, SUM[45:44], C_23);
  two_bits_Carry_Look_Ahead iteration24 (A[47:46], B[47:46], C_23, SUM[47:46], C_24);
  two_bits_Carry_Look_Ahead iteration25 (A[49:48], B[49:48], C_24, SUM[49:48], C_25);
  two_bits_Carry_Look_Ahead iteration26 (A[51:50], B[51:50], C_25, SUM[51:50], C_26);
  two_bits_Carry_Look_Ahead iteration27 (A[53:52], B[53:52], C_26, SUM[53:52], C_27);
  two_bits_Carry_Look_Ahead iteration28 (A[55:54], B[55:54], C_27, SUM[55:54], C_28);
  two_bits_Carry_Look_Ahead iteration29 (A[57:56], B[57:56], C_28, SUM[57:56], C_29);
  two_bits_Carry_Look_Ahead iteration30 (A[59:58], B[59:58], C_29, SUM[59:58], C_30);
  two_bits_Carry_Look_Ahead iteration31 (A[61:60], B[61:60], C_30, SUM[61:60], C_31);
  two_bits_Carry_Look_Ahead iteration32 (A[63:62], B[63:62], C_31, SUM[63:62], CARRY_OUT);
endmodule

module two_bits_Carry_Look_Ahead(input [0:1] A, input [0:1] B, input carry_in, output [0:1] SUM, output carry_out);

wire P_0_and_carry_0, P_1_and_G0, P_1_and_P_0_and_c0, carry_1, carry_2, G_0, P_0, G_1, P_1; //create temp variables

//calculating C1
XOR_gate inst1(A[0] , B[0], P_0); // p0 = a+b
AND_gate inst2(P_0 , carry_in , P_0_and_carry_0); 
AND_gate inst3(A[0] , B[0], G_0);
OR_gate inst4(P_0_and_carry_0 , G_0 , carry_1);

//calculating C2
XOR_gate inst5(A[1] , B[1], P_1);
AND_gate inst6(A[1] , B[1], G_1);
ANND_gate inst7(carry_in , P_1 , P_0 ,P_1_and_P_0_and_c0); //p0+C0+p1
AND_gate inst8(P_1,G_0, P_1_and_G0); //p1+g0

ORR_gate inst9(P_1_and_P_0_and_c0 , P_1_and_G0, G_1, carry_2);
assign carry_out = carry_2;


//calculating sums
XOR_gate inst10(P_0 , carry_in, SUM[0]);
XOR_gate inst11(P_1, carry_1 , SUM[1]);


endmodule



//xor gate module
module XOR_gate(input x, input y, output z);

    assign #1 z = x ^ y;

endmodule

//and gate module
module AND_gate(input x, input y, output z);

   assign #1 z = x & y;

endmodule

//triple and gate module 
module ANND_gate(input x, input y, input w, output z);

   assign #1 z = x & y & w;

endmodule

//or gate module
module OR_gate(input x, input y, output z);

   assign #1 z = x | y;

endmodule

//triple or gate module
module ORR_gate(input x, input y, input w, output z);

   assign #1 z = x | y | w; 
 
endmodule