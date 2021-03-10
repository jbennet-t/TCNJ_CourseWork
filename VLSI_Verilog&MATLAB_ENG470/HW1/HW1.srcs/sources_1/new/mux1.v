`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TCNJ
// Engineer: Jordan Sinoway
// 
// Create Date: 08/29/2020 03:45:24 PM
// Design Name: 
// Module Name: mux1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////

//8x1 mux for HW1

module mux1(
d0, d1, d2, d3, d4, d5, d6, d7, //8 mux inputs
sel, //select line
y_out //out
);

input [3:0] d0,d1,d2,d3,d4,d5,d6,d7; //mux inputs
input [2:0] sel; //mux select
output [3:0] y_out; //mux output
reg [3:0] y_out;

always @ (*)
begin
    case(sel) //case statement for mux main section
    3'b000 : y_out = d0;
    3'b001 : y_out = d1;
    3'b010 : y_out = d2;
    3'b011 : y_out = d3;
    3'b100 : y_out = d4;
    3'b101 : y_out = d5;
    3'b110 : y_out = d6;
    3'b111 : y_out = d7;    
    endcase
end

endmodule
