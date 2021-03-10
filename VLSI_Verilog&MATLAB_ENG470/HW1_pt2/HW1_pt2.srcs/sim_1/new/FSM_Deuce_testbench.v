`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2020 09:36:44 PM
// Design Name: 
// Module Name: FSM_Deuce_testbench
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


module FSM_Deuce_testbench();

    reg clk, rst, p1, p2;
    wire [3:0] state_out;
        
        FSM_Deuce dut(.clk(clk), .rst(rst), .p1(p1), .p2(p2), .state_out(state_out));
    
        initial begin
        
            clk = 0; 
            rst = 1; //toggling reset to start
            #10
            rst = 0;
            
            
            
            //-----------Deuce->addout->game1->Deuce
            p1 = 0;
            p2 = 0;
            rst = 0;
            #15
            
            p1 = 1;
            p2 = 0;
            rst = 0;
            #15
            
            p1 = 1;
            p2 = 0;
            rst = 0;
            #15
            
            p1 = 0; p2 = 0; rst = 0; //resetting variables
            #15
            
            //----------Deuce->addin->game2->Deuce
            p1 = 0;
            p2 = 1;
            rst = 0;
            #15
            
            p1 = 0;
            p2 = 1;
            rst = 0;
            #15
            
            p1 = 0; p2 = 0; rst = 0; //resetting variables
            #15
            
            //----------Deuce->addout->deuce
            p1 = 1;
            p2 = 0;
            rst = 0;
            #15
            
            p1 = 0;
            p2 = 1;
            rst = 1;
            #15
            
            p1 = 0; p2 = 0; rst = 0; //resetting variables
            #15
            
            //----------Deuce->addout->deuce
            p1 = 0;
            p2 = 1;
            rst = 0;
            #15
            
            p1 = 1;
            p2 = 0;
            rst = 1;
            #15
            
            p1 = 0; p2 = 0; rst = 0; //resetting variables
            
            //----------Deuce->addout->deuce
        
        end
    
    always @(clk) //running clock
    begin
        #5
        clk <= ~clk;
    end

endmodule
