`timescale 1ns / 1ps


module Echo_tb();
//Delays for different reverb components
`define DELAYTIME (3000)
`define DELAYTIME2 (2000)
`define DELAYTIME3 (1000)
//`define ALPHA_STH (16'b0101_0011_0011_0011)
`define ALPHA_STH (16'b0111_1111_1111_1111)

////////////////////////////////////////////////////////////////////////    
// Clock & reset generator
//
reg     clk;
reg     rst_ = 0;
wire    reset;

integer reset_count = 0;
`define NUM_RESET_CYCLES (10)

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
end
////////////////////////////////////////////////////////////////////////    

////////////////////////////////////////////////////////////////////////    
// Open the file at simulation startup
// Also opens file for writing to
//
integer fd_in;
integer fd_out;

initial
begin
    fd_in = $fopen( "D:/Verilogprojects/scripts/Guitar_int.txt", "r" );
    fd_out = $fopen( "D:/Verilogprojects/scripts/Guitar_int_out_5.txt", "w" );
    if (fd_in == 0)
    begin
        $display( "Couldn't open file for read" );
        $finish;
    end
end
////////////////////////////////////////////////////////////////////////    
string  the_line;
integer num_items;
reg signed [15:0] In_put;
reg signed [15:0] Out_put;

integer In_data;

always @ (posedge clk)
begin
    num_items=$fgets( the_line, fd_in );
    
    if (num_items == 0)
            begin
                $display( "***** ----> PASS <---- ***** !!!\n" );
                #25 $finish;
            end
    else
    begin
         $sscanf(the_line, "%d",
         In_data);
    
         In_put = In_data[15:0];

        $fwrite(fd_out,"%d\n", Out_put);
    end
 end 
   //DUT of Reverb Moduel
 Reverb Reverb(
    
    .Reverb_DATA_IN(In_put),        
    .clk(clk),
    .rst(reset),
    .delay_time_1(`DELAYTIME),
    .delay_time_2(`DELAYTIME2),
    .delay_time_3(`DELAYTIME3),
    .alpha_sth(`ALPHA_STH),
    .Reverb_DATA_OUT(Out_put)          //final output
    
    ); 

endmodule
