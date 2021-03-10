`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/04 14:49:14
// Design Name: 
// Module Name: Echo
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
//---------------------------------------------------------------------------------------

// Summing junction
module sum_echo
(
    input signed [15:0]     x, 
    input signed [15:0]     echo, 
    output signed [15:0]    z
);
assign z = x + echo;
endmodule
//---------------------------------------------------------------------------------------

//---------------------------------------------------------------------------------------
// Gain/multiplying block
module prod_echo
(
    input   signed    [15:0]    din,        
    input   signed    [15:0]    alpha,      
    output  signed    [31:0]    dout
);
    assign dout = alpha * din;
endmodule
//---------------------------------------------------------------------------------------

//---------------------------------------------------------------------------------------------
//****
module round(
    input signed        [31:0] round_in,                                                //input round
    output reg signed   [15:0] round_out                                                //output 16 bit
    );
        parameter signed round_high = 32'b0111_1111_1111_1111_1111_1111_1111_1111;
        parameter signed round_low = 32'b1000_0000_0000_0000_0000_0000_0000_0000;

    always @(*)
        begin
                                                                                                             //Alaso need consider the mix and min, cant add additinal bit ifit's already reached the max/min.
            if (round_in[15] == 1'b1 && round_in[31:0] != round_high[31:0] && round_in[31:0] != round_low[31:0] )    // while  the 15-bit is 1 which means the char is bigger than or equal to 8 [1000], if it's bigger add 1 after chopping the data to 16 bits
                round_out[15:0] <= (round_in[31:16]+ 1'b1);
            else
                round_out[15:0] <= round_in[31:16];                                                                // chop to 16 bits

        end

endmodule

//---------------------------------------------------------------------------------------------
module Echo(
    
    input   signed [15:0]   Echo_DATA_IN,         //data from LPF2
    input                   clk,
    input                   rst,
    input   int             delay_time,
    input   signed [15:0]   alpha_sth,
    output  signed [15:0]   Echo_DARA_OUT          //final output
    
    );
    
    wire signed [31:0]  IN_delayed;
    wire signed [15:0]  IN_delayed_round;
    reg [19:0]          write_addr;
    reg [19:0]          read_addr;
    reg [1:0]           write_enable;
    reg                 start_Echo_flag;
    
//    reg         [1:0]   state;
//    parameter  idle =   2'b00;
//    parameter  done =   2'b10; 

    wire signed [15:0]  ram_out;                    //output of ram
 
    // Take 1 bit, make it 16 bits
    wire [15:0] start_echo_flag_vec;                // start echo flag
    
    assign start_echo_flag_vec = {16{start_Echo_flag}};
    
    always @ (posedge clk)
    begin
        if(rst)                                      // reset all the val to 0 at beginning
         begin
            read_addr   <= 0;
            write_addr  <= 0;
            write_enable <= 2'b11;
            start_Echo_flag <= 0;
         end
        else if(write_addr == delay_time)              // if there is val back to delaytime enable echoing 
            start_Echo_flag <= 1;
    end
 
    always @ (posedge clk)
    begin
        if(rst)
         begin                                          // rereset all the val to 0 at beginning
            read_addr   <= 0;
            write_addr  <= 0;
            write_enable <= 2'b11;
         end
        else
        begin
            write_enable <= 2'b11;                       // update w addr evey cycle running it & w_e 
            write_addr <= write_addr + 1;
        end
            
    end
    
    assign read_addr  = write_addr - delay_time;          // read addr will be the w_addr - delay_time 
    
    prod_echo       prod(.din(ram_out&start_echo_flag_vec),.alpha(alpha_sth), .dout(IN_delayed));//Q16.15 
    round           round_echo(.round_in(IN_delayed), .round_out(IN_delayed_round));
    blk_mem_gen_0   ram(clk, write_enable, write_addr, Echo_DATA_IN, clk, 1, read_addr, ram_out); // get ram and save the input inside
    sum_echo        sum(.x(Echo_DATA_IN), .echo(IN_delayed_round), .z(Echo_DARA_OUT));            // sum the output
    

endmodule
