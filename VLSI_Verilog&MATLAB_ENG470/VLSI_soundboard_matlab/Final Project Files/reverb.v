`timescale 1ns / 1ps


// Summing junction
module sum_reverb
(
    input signed [15:0]     x, 
    input signed [15:0]     reverb, 
    output signed [15:0]    z
);
assign z = x + reverb;
endmodule
//---------------------------------------------------------------------------------------

//---------------------------------------------------------------------------------------
// Gain/multiplying block
module prod_reverb
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
module Reverb(
    
    input   signed [15:0]   Reverb_DATA_IN,         //data from LPF2
    input                   clk,                    //Clock
    input                   rst,                    //Reset
    input   int             delay_time_1,           //Delay for first part of reverb
    input   int             delay_time_2,           //Delay for second part of reverb
    input   int             delay_time_3,           //Delay for third part of reverb
    input   signed [15:0]   alpha_sth,              //Alpha value for multiplying by in to recreate distance from original sound
    output  signed [15:0]   Reverb_DATA_OUT          //final output
    
    );
    
    
    //Wire section for wiring together the rounding components with the gain/multiplying and summing parts 
    
    wire signed [31:0]  IN_delayed;
    wire signed [15:0]  IN_delayed_round;
    wire signed [31:0]  IN_delayed2;
    wire signed [15:0]  IN_delayed_round2;
    wire signed [31:0]  IN_delayed3;
    wire signed [15:0]  IN_delayed_round3;
    wire signed [15:0]  inner_reverb1;
    wire signed [15:0]  inner_reverb2;
    
    //Registers for ram write address, read addresses, and write enable
    //Also register for starting flags
    reg [19:0]          write_addr;
    reg [19:0]          read_addr;
    reg [19:0]          read_addr1;
    reg [19:0]          read_addr2;
    reg [1:0]           write_enable;
    reg                 start_Reverb_flag;
    reg                 start_Reverb_flag2;
    reg                 start_Reverb_flag3;
    
    //Ram outputs 
    wire signed [15:0]  ram_out;
    wire signed [15:0]  ram_out2;
    wire signed [15:0]  ram_out3;
 
    // Take 1 bit, make it 16 bits
    wire [15:0] start_reverb_flag_vec;
    wire [15:0] start_reverb_flag_vec2;
    wire [15:0] start_reverb_flag_vec3;
    
    //Used to start multiplication module
    assign start_reverb_flag_vec = {16{start_Reverb_flag}};
    assign start_reverb_flag_vec2 = {16{start_Reverb_flag2}};
    assign start_reverb_flag_vec3 = {16{start_Reverb_flag3}};
    
    //Resetting all values to 0 at the beginning
    //Except for write_enable which is set to always writing
    always @ (posedge clk)
    begin
        if(rst)
         begin
            read_addr   <= 0;
            read_addr1  <= 0;
            read_addr2  <= 0;
            write_addr  <= 0;
            write_enable <= 2'b11;
            start_Reverb_flag <= 0;
            start_Reverb_flag2 <= 0;
            start_Reverb_flag3 <= 0;
         end
    //If the write_address matches the delay, the flag begins which starts the reverb
        else if(write_addr == delay_time_1)
            start_Reverb_flag <= 1;
        else if(write_addr == delay_time_2)
            start_Reverb_flag2 <= 1;
        else if(write_addr == delay_time_3)
            start_Reverb_flag3 <= 1;
    end
    //Resetting all values to zero
    //Incrementing write address for every cycle
    always @ (posedge clk)
    begin
        if(rst)
         begin
            read_addr   <= 0;
            read_addr1  <= 0;
            read_addr2  <= 0;
            write_addr  <= 0;
            write_enable <= 2'b11;
         end
        else
        begin
            write_enable <= 2'b11;
            write_addr <= write_addr + 1;
        end
            
    end
    
    //Read addresses for all three components of the reverb
    assign read_addr  = write_addr - delay_time_1;
    assign read_addr1 = write_addr - delay_time_2;
    assign read_addr2 = write_addr - delay_time_3;
    
    //Instantiation of the various modules for the reverb to work
    //Ram Modules first for 3 different delays
    //3 Modules each for the gain, rounding, and summing blocks
    blk_mem_gen_0   ram1(clk, write_enable, write_addr, Reverb_DATA_IN, clk, 1, read_addr, ram_out);
    blk_mem_gen_0   ram2(clk, write_enable, write_addr, Reverb_DATA_IN, clk, 1, read_addr1, ram_out2);
    blk_mem_gen_0   ram3(clk, write_enable, write_addr, Reverb_DATA_IN, clk, 1, read_addr2, ram_out3);
    prod_reverb       prod(.din(ram_out&start_reverb_flag_vec),.alpha(alpha_sth), .dout(IN_delayed));//Q16.15
    prod_reverb       prod2(.din(ram_out2&start_reverb_flag_vec2),.alpha(alpha_sth), .dout(IN_delayed2));//Q16.15
    prod_reverb       prod3(.din(ram_out3&start_reverb_flag_vec3),.alpha(alpha_sth), .dout(IN_delayed3));//Q16.15
    round           round_reverb(.round_in(IN_delayed), .round_out(IN_delayed_round));
    round           round_reverb2(.round_in(IN_delayed2), .round_out(IN_delayed_round2));
    round           round_reverb3(.round_in(IN_delayed3), .round_out(IN_delayed_round3));
    sum_reverb      sum(.x(Reverb_DATA_IN), .reverb(IN_delayed_round), .z(inner_reverb1)); //Summing of input and first part of reverb
    sum_reverb      sum2(.x(inner_reverb1), .reverb(IN_delayed_round2), .z(inner_reverb2)); //Summing of first and second part of reverb
    sum_reverb      sum3(.x(inner_reverb2), .reverb(IN_delayed_round3), .z(Reverb_DATA_OUT)); //Summing of second and third part of reverb and output
    

endmodule