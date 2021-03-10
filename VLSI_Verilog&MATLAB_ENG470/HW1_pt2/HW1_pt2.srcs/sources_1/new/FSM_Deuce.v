`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TCNJ
// Engineer: Jordan Sinoway
// 
// Create Date: 08/31/2020 01:12:54 PM
// Design Name: 
// Module Name: FSM_Deuce

//////////////////////////////////////////////////////////////////////////////////

//Moore State machine implementation (kinda)

module FSM_Deuce(clk, rst, p1, p2, state_out);

input clk, rst, p1, p2; //clock, reset, point1, point2
output [3:0] state_out; //state output

parameter deuce = 3'h0, addin = 3'h1, addout = 3'h2, game1 = 3'h3, game2 = 3'h4; //different game states

reg [3:0] PRState, NXState; //present state, next state
reg [3:0] state_out;

always @ (posedge clk, posedge rst) //checking for resets
begin
    if(rst == 1'b1) 
        PRState <= deuce;
    else
        PRState <= NXState;
end

always @ (posedge clk) //outputting state
begin
    if(PRState == deuce)
        state_out <= PRState;
    else if(PRState == addin)
        state_out <= PRState;
    else if(PRState == addout)
        state_out <= PRState;
    else if(PRState == game1)
        state_out <= PRState;
    else if(PRState == game2)
        state_out <= PRState;
end
    
always @ (*) //main state machine section, based on bubble diagram from slides
begin
    if(rst)
        NXState <= deuce;
    else
        case(PRState)
            deuce : if(p2 == 1'b1)
                       NXState <= addin;
                    else if(p1 == 1'b1)
                       NXState <= addout;
                    else
                       NXState <= deuce;
            addin : if(p2 == 1'b1)
                       NXState <= game2;
                    else if(p1 == 1'b1)
                       NXState <= deuce;
                    else
                       NXState <= addin;
            addout : if(p1 == 1'b1)
                       NXState <= game1;
                    else if(p2 == 1'b1)
                       NXState <= deuce;
                    else
                       NXState <= addin;                
            game1 : NXState <= deuce;  
            game2 : NXState <= deuce;
            default NXState <= deuce;
        endcase
end
endmodule
