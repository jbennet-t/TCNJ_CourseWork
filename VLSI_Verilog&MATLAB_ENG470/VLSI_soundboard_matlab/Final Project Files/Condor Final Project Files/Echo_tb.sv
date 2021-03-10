`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/07 13:47:39
// Design Name: 
// Module Name: Echo_tb
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

module Echo_tb();
`define DELAYTIME (10000)
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
//
integer fd_in;
integer fd_out;

initial
begin
    fd_in = $fopen( "F:/Vivado/Vivado_file/scripts/Guitar_int.txt", "r" );                  //input  file addr
    fd_out = $fopen( "F:/Vivado/Vivado_file/scripts/Guitar_int_out_11.txt", "w" );          //output file addr
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
    num_items=$fgets( the_line, fd_in );                    // get all the line of the input in .txt
    
    if (num_items == 0)
            begin                                           // read all if to the end, pass
                $display( "***** ----> PASS <---- ***** !!!\n" );
                #25 $finish;
            end
    else
    begin
         $sscanf(the_line, "%d",                            //sscan each line and put as input each cycle  in ram
         In_data);
    
         In_put = In_data[15:0];                            // save as int16 from int32 

        $fwrite(fd_out,"%d\n", Out_put);                    // write the output to the .txt file if it's avaliable
    end
 end 
   
 Echo Echo(
    
    .Echo_DATA_IN(In_put),         //data from LPF2
    .clk(clk),
    .rst(reset),
    .delay_time(`DELAYTIME),
    .alpha_sth(`ALPHA_STH),
    .Echo_DARA_OUT(Out_put)          //final output
    
    ); 

endmodule

