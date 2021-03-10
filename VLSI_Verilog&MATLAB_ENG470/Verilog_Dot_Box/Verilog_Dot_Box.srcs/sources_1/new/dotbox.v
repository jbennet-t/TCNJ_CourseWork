`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/04 14:42:09
// Design Name: 
// Module Name: dot_box_top
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

`define STATE_idle  (0)
`define STATE_run   (1)
`define STATE_done  (2)


//---------------------------------------------------------------------------------------------

module mux (d,sel,mux_out);
   
    input signed [7:0][15:0] d;                   // 8-bit input
    input [31:0]  sel;                         // 3-bit instruction line
    
    
    output reg signed [15:0]  mux_out;                       // 8-bit output

// check the state of the input line 
    always @ (*)
        begin
            case(sel)       // 8 mux case 
                3'b000  :   mux_out = d[0];
                3'b001  :   mux_out = d[1];
                3'b010  :   mux_out = d[2];
                3'b011  :   mux_out = d[3];
                3'b100  :   mux_out = d[4];
                3'b101  :   mux_out = d[5];
                3'b110  :   mux_out = d[6];
                3'b111  :   mux_out = d[7];
                default :   mux_out = 0;
            endcase
        end
    
endmodule

//---------------------------------------------------------------------------------------------

module Adder_32b
(
    input   signed        [34:0] post_mul_Input,
    input   signed        [34:0] reg_Input,
    output  signed        [34:0] sum );
    

    assign sum[34:0] = (post_mul_Input[34:0] + reg_Input[34:0]);

endmodule

//---------------------------------------------------------------------------------------------


module Mult_16b
(
    input signed        [15:0] x_Input,
    input signed        [15:0] y_Input,
    output signed  [34:0] product );
    
    assign product[34:0] = (x_Input[15:0] * y_Input[15:0]);

endmodule

//---------------------------------------------------------------------------------------------

module saturate(
    input signed        [34:0] sat_in,
    output  reg signed  [31:0] sat_out
    );

    parameter signed sat_high = 32'b0111_1111_1111_1111_1111_1111_1111_1111;
    parameter signed sat_low = 32'b1000_0000_0000_0000_0000_0000_0000_0000;

    always @(*)
        begin

            if (sat_in[34:31] == 4'b0000 || sat_in[34:31] == 4'b1111)
                sat_out = sat_in[31:0];
                //sat_out = sat_in[34:3];
            else if (sat_in[34] == 1'b0)
                sat_out = sat_high;
            else
                sat_out = sat_low;

        end

endmodule


//module saturate_new(
//    input signed        [34:0] sat_in,
//    output  reg signed  [31:0] sat_out
//    );

//    parameter signed sat_high = 32'b0111_1111_1111_1111_1111_1111_1111_1111;
//    parameter signed sat_low = 32'b1000_0000_0000_0000_0000_0000_0000_0000;

//    always @(*)
//        begin

//            if (sat_in < sat_low)
//                sat_out <= sat_low;
//            else if (sat_in > sat_high)
//                sat_out <= sat_high;
//            else
//                sat_out <= sat_in[34:3];

//        end

//endmodule

//---------------------------------------------------------------------------------------------

module saturate_16(
    input signed        [34:0] sat_in,
    output reg signed   [15:0] sat_out
    );

    parameter signed sat_high = 16'b0111_1111_1111_1111;
    parameter signed sat_low = 16'b1000_0000_0000_0000;

    always @(*)
        begin

            if (sat_in[34:15] == 20'b00000000000000000000 || sat_in[34:15] == 20'b11111111111111111111)
                sat_out = sat_in[15:0];
            else if (sat_in[34] == 1'b0)
                sat_out = sat_high;
            else
                sat_out = sat_low;

        end

endmodule

//---------------------------------------------------------------------------------------------

module dotbox
(
    input                       clk,
    input                       reset,
    
    input signed [7:0][15:0]    IN_X,
    input signed [7:0][15:0]    IN_Y,
    input                       IN_START,
    
    output reg  signed [31:0]    OUT_DAT,
    output reg  signed [15:0]    OUT_DAT16,
    output reg                   OUT_XFC

    
);

    reg signed     [15:0]    Current_IN_X;
    reg signed     [15:0]    Current_IN_Y;
    reg signed     [34:0]    Current_35_product;
    reg signed     [34:0]    Current_Sum;
    reg signed     [34:0]    Pass_Sum;
    
    reg            [2:0]     state;
    reg                      count_start;
    integer                  counter;    
    


    //state machine            
     always @ (posedge clk)
        begin
            if (reset)
            begin
                state   <= `STATE_idle;
                OUT_XFC <= 1'b0;
            end
            else
                case (state)
                    `STATE_idle:
                    
                        if (IN_START)
                            begin
                                count_start <= 1'b1; 
                                counter     <= -1;
                                Current_Sum <= 1'b0;
                                state       <= `STATE_run;
                            end

                    `STATE_run:
                    

                        if(counter == 6)
                            begin
                                OUT_XFC     <= 1;
                                count_start <= 1'b0;
                                //counter     <= 1'bx;
                                state       <= `STATE_done;                                   
                            end
                        
                    `STATE_done:
                        
                        if(OUT_XFC)
                            begin
                                OUT_XFC     <= 0;
                                state       <= `STATE_idle;
                            end
                     
                     default:
                            state   <= `STATE_idle;
                            
                endcase
                
            if(count_start == 1'b1 && counter < 7)
                begin
                    if (counter == -1) 
                        counter <= counter + 1;
                    else
                        begin 
                            Current_Sum <= Pass_Sum;
                            counter     <= counter + 1;
                        end
                end
        end  

        mux         mux_x   (IN_X, counter, Current_IN_X);
        mux         mux_y   (IN_Y, counter, Current_IN_Y);
        Mult_16b    Mul     (Current_IN_X,Current_IN_Y,Current_35_product);
        Adder_32b   add     (Current_35_product,Current_Sum,Pass_Sum);  
        saturate    Satu    (Pass_Sum,OUT_DAT);
        saturate_16 Satu_16 (Pass_Sum,OUT_DAT16);
                   

endmodule
