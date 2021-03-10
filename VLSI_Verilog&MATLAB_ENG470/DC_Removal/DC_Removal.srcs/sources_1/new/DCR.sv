`timescale 1ns / 1ps

//---------------------------------------------------------------------------------------

// Summing junction
module sum_A
(
    input signed [17:0] x, // Q17.0
    input signed [16:0] y, // Q16.0
    output signed [18:0] z // Q18.0
);
assign z = x + $signed(y);
endmodule
//---------------------------------------------------------------------------------------

//---------------------------------------------------------------------------------------
// Summing (or subtraction really) junction
module sum_B
(
    input signed [15:0] x, // Q15.0
    input signed [15:0] y, // Q15.0
    output signed [15:0] z // Q15.0
);
assign z = x - y;;
endmodule
//---------------------------------------------------------------------------------------

//---------------------------------------------------------------------------------------
// Gain/multiplying block
module prod
(
    input signed [15:0] coeff,   // coeff Q0.15
    input signed [15:0] din,     // data  Q15.0  
    output signed [31:0] dout    //       Q16.15
);
assign dout = coeff * din;
endmodule
//---------------------------------------------------------------------------------------


//---------------------------------------------------------------------------------------
// Unit delay block****
module unit_delay
(
    input signed [15:0]  din,
    output reg signed [15:0] dout,
    
    input clk,
    input reset,
    input clock_enable
);

always @ (posedge clk)
begin
    if(reset)
        dout <= 0;
    else if(clock_enable)
        dout <= din;
end

endmodule
//---------------------------------------------------------------------------------------

//---------------------------------------------------------------------------------------
module saturate(
    input signed        [18:0] sat_in, //Q18.0 - 19bits
    output  reg signed  [15:0] sat_out //Q15.0 - 16bits
    );

    parameter signed sat_high = 19'b011_1111_1111_1111_1111;
    parameter signed sat_low = 19'b100_0000_0000_0000_0000;

    always @(*)
        begin
            if (sat_in[18:16] == 3'b000 || sat_in[18:16] == 3'b111)                   //Passes last 32 bits of inputs if input has 0000 or 1111 in first 4 bits as this doesn't meet either saturation threshold
                sat_out <= sat_in[15:0];
            else if (sat_in[18] == 1'b0)
                sat_out <= sat_high;                                                     //Sets output to saturate high as input exceeds upper limit
            else
                sat_out <= sat_low;                                                      //Sets output to saturate low as input exceeds lower limit
        end

endmodule
//---------------------------------------------------------------------------------------

//---------------------------------------------------------------------------------------------
//****
module round(
    input signed        [31:0] round_in,                                                //input round
    output reg signed   [16:0] round_out                                                //output 16 bit
    );
        parameter signed round_high = 32'b0111_1111_1111_1111_1111_1111_1111_1111;
        parameter signed round_low = 32'b1000_0000_0000_0000_0000_0000_0000_0000;

    always @(*)
        begin
                                                                                                             //Alaso need consider the mix and min, cant add additinal bit ifit's already reached the max/min.
            if (round_in[15] == 1'b1 && round_in[31:0] != round_high[31:0] && round_in[31:0] != round_low[31:0] )    // while  the 15-bit is 1 which means the char is bigger than or equal to 8 [1000], if it's bigger add 1 after chopping the data to 16 bits
                round_out[16:0] <= (round_in[31:16]+ 1'b1);
            else
                round_out[16:0] <= round_in[31:16];                                                                // chop to 16 bits

        end

endmodule

//---------------------------------------------------------------------------------------------


//---------------------------------------------------------------------------------------
module DCR
(
    input   signed [17:0]   DCR_DATA_IN,         //data from LPF2  
    input                   clk,
    input                   rst,
    input                   DIN_RTS,    // IN I/F: upstream is ready-to-send
    output reg              DIN_RTR,    // IN I/F: FIFO is ready-to-receive
    
    output reg              DOUT_RTS,   // OUT I/F: FIFO is ready-to-send
    input                   DOUT_RTR,   // OUT I/F: downstream is ready-to-receive
    output  signed [15:0]   DCR_DATA_OUT       //final output 
);

    reg IN_XFC;
    wire signed [15:0] din_delayed;     // delay line
    wire signed [31:0] prod_1;          // product of coeffs and delayed data
    wire signed [18:0] sum_1;           //output first summer
    wire signed [15:0] sum_2;           //output 2nd summer (technically subtracting)
    wire signed [16:0] round_product;   //output round block
    wire signed [15:0] sat_sum_1_out;   //output of saturation block
    
    reg                clock_enable;
    
    reg signed [15:0] coeff = 16'b0111_1110_1011_1000; //0.99 .1111_1101_0111_0000_101000
    
    always @ (posedge clk)
    begin
        assign DIN_RTR  = DOUT_RTR;  // Pass through flow control, out to in
        assign DOUT_RTS = DIN_RTS;   // Pass through flow control, in to out
        assign IN_XFC = DIN_RTR & DIN_RTS;
        assign clock_enable = IN_XFC;

    end
    
    sum_A u_sum1( .x(DCR_DATA_IN), .y(round_product), .z(sum_1) ); //adding input and output from mult block
    //           in                in            out 
    
    saturate sat_1(.sat_in(sum_1), .sat_out(sat_sum_1_out)); //saturating output to 16 bit output
    
    
    unit_delay u_dm0( .din(sat_sum_1_out), .dout(din_delayed), .clk(clk), .reset(rst), .clock_enable(clock_enable) ); //delaying din line
    //                       in                out
    
    prod u_prod1( .din(din_delayed), .coeff(coeff), .dout(prod_1) ); //multiplying din by coeff
    //                    in                in             out 
    
    round round_1(.round_in(prod_1), .round_out(round_product)); //round from Q16.15 to Q16.0
    //                       in                out
    
    sum_B u_sum2( .x(sat_sum_1_out), .y(din_delayed), .z(sum_2) ); //adding initial sum signal with delayed signal
    //           in               in           out 
    
    assign DCR_DATA_OUT = sum_2;
   
endmodule
//---------------------------------------------------------------------------------------