`timescale 1ns / 1ps

module distortion_tb();

///////////////////////////////////////////////////////////////////////    
// Clock & reset generator

reg     clk;
reg     rst_ = 0;
wire    reset;

integer reset_count         = 0;

`define NUM_RESET_CYCLES    (10)

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
// Open the file at simulation startup
//
integer fd_in; 
integer fd_out;

initial
begin
    fd_in = $fopen( "C:/Users/sinow/Documents/VLSI/SoundEffectBoard_VLSI/Guitar_float.txt", "r" ); //input file
    fd_out = $fopen( "C:/Users/sinow/Documents/VLSI/SoundEffectBoard_VLSI/Guitar_int_out.txt", "w" ); //output file
    if (fd_in == 0)
    begin
        $display( "Couldn't open file for read" );
        $finish;
    end
end
////////////////////////////////////////////////////////////////////////    

////////////////////////////////////////////////////////////////////////    
// Stimulus generator
string  the_line; //string for reading file 
integer num_items;//num items
reg signed [15:0] In_put; //16 bit input
reg signed [15:0] Out_put; //16 bit output

integer In_data;

always @ (posedge clk)
begin
    num_items=$fgets( the_line, fd_in ); //gets total # of items in file
    
    if (num_items == 0)
            begin
                $display( "***** ----> PASS <---- ***** !!!\n" );
                #25 $finish;
            end
    else
    begin
         $sscanf(the_line, "%d",In_data); //scanning in data as integer
    
         In_put = In_data[15:0]; //set data to input

        $fwrite(fd_out,"%d\n", Out_put); //writing output data
    end
 end 

distortion UUT //unit under test
(
    .din(In_put),
    .clk(clk),
    .rst(reset),
    .dout(Out_put)
);

endmodule
