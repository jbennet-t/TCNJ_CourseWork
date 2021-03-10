`timescale 1ns / 1ps

//transposed form of direct_form_1

module direct_form_2
#
(
    M = 4                       // Parameter, overridden by testbench
)
(
    input integer coeffs[M:0],  // Input array of filter coefficients
    
    input integer din,          // Data in, one data point per clock cycle
    output integer dout,        // Data out, one data point per clock cycle
    
    input clk,
    input reset
);

integer din_delayed[M-1:0];     // delay line
integer prods[M:0];             // products of coeffs and delayed data
integer sums[M-1:0];            // sum terms


// Instantiate the delay line
z_minus_1 u_dm0( .din(prods[M]), .dout(din_delayed[0]), .clk(clk), .reset(reset) );
z_minus_1 u_dm1( .din(sums[0]), .dout(din_delayed[1]), .clk(clk), .reset(reset) );
z_minus_1 u_dm2( .din(sums[1]), .dout(din_delayed[2]), .clk(clk), .reset(reset) );
z_minus_1 u_dm3( .din(sums[2]), .dout(din_delayed[3]), .clk(clk), .reset(reset) );
//                       in                     out

// Instantiate the gain blocks
prod u_prod0(   .din(din),   .coeff(coeffs[0]), .dout(prods[0]) );
prod u_prod1(   .din(din),   .coeff(coeffs[1]), .dout(prods[1]) );
prod u_prod2(   .din(din),   .coeff(coeffs[2]), .dout(prods[2]) );
prod u_prod3(   .din(din),   .coeff(coeffs[3]), .dout(prods[3]) );
prod u_prodNM1( .din(din), .coeff(coeffs[M]), .dout(prods[M]) );
//                      in              in               out 

// Instantiate the summing junctions
sum u_sum1( .x(din_delayed[0]),  .y(prods[3]),  .z(sums[0]) );
sum u_sum2( .x(din_delayed[1]),  .y(prods[2]),  .z(sums[1]) );
sum u_sum3( .x(din_delayed[2]),   .y(prods[1]),  .z(sums[2]) );
sum u_sum4( .x(din_delayed[3]), .y(prods[0]), .z(sums[M-1]) );
//            in          in         out

// Last sum is the output signal
assign dout = sums[M-1];

endmodule

