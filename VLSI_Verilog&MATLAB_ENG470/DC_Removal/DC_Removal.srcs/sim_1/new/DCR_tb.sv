`timescale 1ns / 1ps

// Needed for sin() function
package math_pkg;
//  //import dpi task      C Name = SV function name
//  import "DPI-C" pure function real cos (input real rTheta);
     import "DPI-C" pure function real sin (input real rTheta);
//  import "DPI-C" pure function real log (input real rVal);
//  import "DPI-C" pure function real log10 (input real rVal);

endpackage : math_pkg


module DCR_tb();

import math_pkg::*;

const real pi = 3.1416;

`define SIN_INPUT ($rtoi(2000*(sin((2*pi*n)/ 10)))+ 4000)
//`define STIM (`SIN_INPUT)
///////////////////////////////////////////////////////////////////////    
// Clock & reset generator
//
reg     clk;
reg     rst_ = 0;
wire    reset;

integer reset_count         = 0;

`define NUM_RESET_CYCLES    (10)
`define MAX_CYCLES          (1000)

assign reset = ~rst_;

initial
begin
    clk = 0;
    while (1)
        #5 clk = ~clk;  // toggle clk each 5 ns (100 MHz clock frequency)
end

always @ (posedge clk)
begin
    reset_count <= reset_count + 1;     // always use non-blocking assignment, '<=',
                                        // in sequential processes
    if (reset_count == `NUM_RESET_CYCLES)
        rst_ <= 1;
        
    if (reset_count == `MAX_CYCLES)
        $finish;
end
////////////////////////////////////////////////////////////////////////    

////////////////////////////////////////////////////////////////////////    
// Stimulus generator


reg signed [17:0] DCR_DATA_IN;
reg DIN_RTR;
reg DOUT_RTS;
reg DIN_RTS;
reg DOUT_RTR;
integer din;
integer n;                      // n is the discrete-time index

assign din = reset ? 0 : `SIN_INPUT; // `STIM is a macro that can produce delta, step, ramp or chirp signals
//assign DCR_DATA_IN = $signed(din);

always @ (posedge clk)
begin
    if(DIN_RTR == 1 && DIN_RTS == 1)
        begin
            DCR_DATA_IN = $signed(din); 
        end
end

always @ (posedge clk)
begin
    if (reset)
    begin
        n <= 0;
    end
    else
    begin
        n <= n + 1;
    end
end

initial begin
#10
DIN_RTS = 0;
DOUT_RTR = 0;
#30
DIN_RTS = 1;
DOUT_RTR = 1;

end


reg signed [15:0] dout;

DCR
out_put
(  
    .DCR_DATA_IN(din),     // data in
    .clk(clk),
    .rst(reset),
    .DIN_RTS(DIN_RTS),
    .DOUT_RTR(DOUT_RTR),
    .DIN_RTR(DIN_RTR),
    .DOUT_RTS(DOUT_RTS),
    .DCR_DATA_OUT(dout)   // data out
);
endmodule
////////////////////////////////////////////////////////////////////////    