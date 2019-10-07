`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2019 11:50:22 AM
// Design Name: 
// Module Name: tutorial_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tutorial_tb();
        reg a;
        wire o;
                 
    tut1 tutorial(o,a);
        
      initial
        begin
            a = 1'b0;
            end
            always
                #1 a = ~a;

endmodule;
