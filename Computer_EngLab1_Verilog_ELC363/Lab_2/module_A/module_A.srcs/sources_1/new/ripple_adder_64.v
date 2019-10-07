`timescale 1ns / 1ps

// Create Date: 09/12/2019 01:24:26 PM
// Module Name: ripple_adder_64
// Authors: Jordan Sinoway, Condor Gao


module ripple_adder_64(input [63:0] a, input [63:0] b, output [63:0] sum, output c);

  // Create wires to connect each full_adder module to another to create a ripple
  wire c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15;
  wire c16, c17, c18, c19, c20, c21, c22, c23, c24, c25, c26, c27, c28, c29, c30, c31;
  wire c32, c33, c34, c35, c36, c37, c38, c39, c40, c41, c42, c43, c44, c45, c46, c47;
  wire c48, c49, c50, c51, c52, c53, c54, c55, c56, c57, c58, c59, c60, c61, c62, c63;

  // The first carry is zero
  assign c0 = 1'b0;

  // Sixty-Four separate full adders are combined together to perform as one 64-bit adder
  full_adder block1 (a[0], b[0], c0, sum[0], c1);
  full_adder block2 (a[1], b[1], c1, sum[1], c2);
  full_adder block3 (a[2], b[2], c2, sum[2], c3);
  full_adder block4 (a[3], b[3], c3, sum[3], c4);
  full_adder block5 (a[4], b[4], c4, sum[4], c5);
  full_adder block6 (a[5], b[5], c5, sum[5], c6);
  full_adder block7 (a[6], b[6], c6, sum[6], c7);
  full_adder block8 (a[7], b[7], c7, sum[7], c8);
  full_adder block9 (a[8], b[8], c8, sum[8], c9);
  full_adder block10 (a[9], b[9], c9, sum[9], c10);
  full_adder block11 (a[10], b[10], c10, sum[10], c11);
  full_adder block12 (a[11], b[11], c11, sum[11], c12);
  full_adder block13 (a[12], b[12], c12, sum[12], c13);
  full_adder block14 (a[13], b[13], c13, sum[13], c14);
  full_adder block15 (a[14], b[14], c14, sum[14], c15);
  full_adder block16 (a[15], b[15], c15, sum[15], c16);
  full_adder block17 (a[16], b[16], c16, sum[16], c17);
  full_adder block18 (a[17], b[17], c17, sum[17], c18);
  full_adder block19 (a[18], b[18], c18, sum[18], c19);
  full_adder block20 (a[19], b[19], c19, sum[19], c20);
  full_adder block21 (a[20], b[20], c20, sum[20], c21);
  full_adder block22 (a[21], b[21], c21, sum[21], c22);
  full_adder block23 (a[22], b[22], c22, sum[22], c23);
  full_adder block24 (a[23], b[23], c23, sum[23], c24);
  full_adder block25 (a[24], b[24], c24, sum[24], c25);
  full_adder block26 (a[25], b[25], c25, sum[25], c26);
  full_adder block27 (a[26], b[26], c26, sum[26], c27);
  full_adder block28 (a[27], b[27], c27, sum[27], c28);
  full_adder block29 (a[28], b[28], c28, sum[28], c29);
  full_adder block30 (a[29], b[29], c29, sum[29], c30);
  full_adder block31 (a[30], b[30], c30, sum[30], c31);
  full_adder block32 (a[31], b[31], c31, sum[31], c32);
  full_adder block33 (a[32], b[32], c32, sum[32], c33);
  full_adder block34 (a[33], b[33], c33, sum[33], c34);
  full_adder block35 (a[34], b[34], c34, sum[34], c35);
  full_adder block36 (a[35], b[35], c35, sum[35], c36);
  full_adder block37 (a[36], b[36], c36, sum[36], c37);
  full_adder block38 (a[37], b[37], c37, sum[37], c38);
  full_adder block39 (a[38], b[38], c38, sum[38], c39);
  full_adder block40 (a[39], b[39], c39, sum[39], c40);
  full_adder block41 (a[40], b[40], c40, sum[40], c41);
  full_adder block42 (a[41], b[41], c41, sum[41], c42);
  full_adder block43 (a[42], b[42], c42, sum[42], c43);
  full_adder block44 (a[43], b[43], c43, sum[43], c44);
  full_adder block45 (a[44], b[44], c44, sum[44], c45);
  full_adder block46 (a[45], b[45], c45, sum[45], c46);
  full_adder block47 (a[46], b[46], c46, sum[46], c47);
  full_adder block48 (a[47], b[47], c47, sum[47], c48);
  full_adder block49 (a[48], b[48], c48, sum[48], c49);
  full_adder block50 (a[49], b[49], c49, sum[49], c50);
  full_adder block51 (a[50], b[50], c50, sum[50], c51);
  full_adder block52 (a[51], b[51], c51, sum[51], c52);
  full_adder block53 (a[52], b[52], c52, sum[52], c53);
  full_adder block54 (a[53], b[53], c53, sum[53], c54);
  full_adder block55 (a[54], b[54], c54, sum[54], c55);
  full_adder block56 (a[55], b[55], c55, sum[55], c56);
  full_adder block57 (a[56], b[56], c56, sum[56], c57);
  full_adder block58 (a[57], b[57], c57, sum[57], c58);
  full_adder block59 (a[58], b[58], c58, sum[58], c59);
  full_adder block60 (a[59], b[59], c59, sum[59], c60);
  full_adder block61 (a[60], b[60], c60, sum[60], c61);
  full_adder block62 (a[61], b[61], c61, sum[61], c62);
  full_adder block63 (a[62], b[62], c62, sum[62], c63);
  full_adder block64 (a[63], b[63], c63, sum[63], c);
endmodule

module full_adder(input a, input b, input carry_in, output sum, output carry_out);

  // wires for gate outputs
  wire temp1, temp2, temp3;


  // using 2 xor gates, 2 and gates, and 1 or gate to create full_adder
  XOR_gate inst1(a, b, temp1);
  AND_gate inst2(carry_in, temp1, temp2);
  AND_gate inst3(a, b, temp3);
  XOR_gate inst4(temp1, carry_in, sum);
  OR_gate inst5(temp2, temp3, carry_out);
  
endmodule

//xor gate module
module XOR_gate(input x, input y, output z); 
    
    assign #1 z = x ^ y;

endmodule

//and gate module
module AND_gate(input x, input y, output z);

   assign #1 z = x & y;

endmodule

//module or gate
module OR_gate(input x, input y, output z);

   assign #1 z = x | y;

endmodule

