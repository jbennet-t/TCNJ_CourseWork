`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2020 04:06:58 PM
// Design Name: 
// Module Name: mux_testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////


module mux_testbench();
    reg [3:0] d0, d1, d2, d3, d4, d5, d6, d7; //mux inputs
    reg [2:0] sel; //mux select
    reg [2:0] count; //counter variable for running counter
    wire [3:0] y_out; //output
    
    
    mux1 dut(
    .d0(d0), .d1(d1), .d2(d2), .d3(d3), .d4(d4), .d5(d5), .d6(d6), .d7(d7),
    .sel(sel),
    .y_out(y_out)
    );
    
    initial begin
        d0 = 4'h0; //initial set to 0
        d1 = 4'h0;
        d2 = 4'h0;
        d3 = 4'h0;
        d4 = 4'h0;
        d5 = 4'h0;
        d6 = 4'h0;
        d7 = 4'h0;
        sel = 3'b000;
        #50
    
        d0 = 4'h9; //setting values for readout
        d1 = 4'h0;
        d2 = 4'hA;
        d3 = 4'hB;
        d4 = 4'hC;
        d5 = 4'hD;
        d6 = 4'hE;
        d7 = 4'hF;
        
        for(count = 0; count < 8; count = count + 1'b1)
        begin
            sel = count; //counting loop for toggling mux inputs
            #50;
        end
     end

    
    
endmodule

