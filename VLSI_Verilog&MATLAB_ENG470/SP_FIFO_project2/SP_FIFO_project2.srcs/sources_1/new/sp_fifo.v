`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


// FIFO with Selvaggi-style input and output ports
// Width and depth are parameterized
// Depth = 2^LOG2_DEPTH
// Width = WORDLENGTH

module sp_fifo
#( parameter
	WORDLENGTH = 8,
	LOG2_DEPTH = 8
)
(
	input               	       IN_RTS,    // IN I/F: upstream is ready-to-send
	output reg             	       IN_RTR,    // IN I/F: FIFO is ready-to-receive
	input [WORDLENGTH-1:0]         IN_DAT, // IN I/F: data bits
    
	output reg                 	   OUT_RTS,    // OUT I/F: FIFO is ready-to-send 
	input               	       OUT_RTR,    // OUT I/F: downstream is ready-to-receive
	output reg [WORDLENGTH-1:0]    OUT_DAT, // OUT I/F: data bits
    
	input               	clk,
	input               	reset
);
                  
    reg                     in_xfc;
    reg                     out_xfc;
    reg [LOG2_DEPTH:0]    num_in_buf;
    reg [LOG2_DEPTH-1:0]      wptr;
    reg [LOG2_DEPTH-1:0]      rptr;


    
    always @ (posedge clk) //every clk pulse
    begin
        if(reset) //every reset, clear pointers and count for buffer
        begin
            num_in_buf <= 0;
            wptr <= 0;
            rptr <= 0;
        end
        else
        begin
            if(in_xfc != out_xfc) //when either writing or reading, but not both (always check)
            begin
                if(in_xfc == 1) //if writing 
                begin
                    num_in_buf  <= num_in_buf + 1'b1;
                end
               
                else if(out_xfc == 1) //if reading
                begin
                    num_in_buf  <= num_in_buf - 1;
                end
            end
            
            if(in_xfc == 1) //when writing, increment write pointer
                wptr <= wptr + 1;
            if(out_xfc == 1) //when reading incremet read pointer
                rptr <= rptr + 1;
            
         end
    end
    
    always @ (*)
    begin
        if(num_in_buf == (1<<LOG2_DEPTH))//if buffer is full
            begin
                IN_RTR <= 1'b0; //no longer write new data
            end
        else
            IN_RTR <= 1'b1; //otherwise write
        
        if(num_in_buf == 0) //if buffer is empty
            begin
                OUT_RTS <= 1'b0; //don't send anything
            end
        else
            OUT_RTS <= 1'b1;//otherwise ready to send
    
        assign in_xfc = (IN_RTS & IN_RTR); //xfc dependent on rts/rtr
        assign out_xfc = (OUT_RTS & OUT_RTR);
 
        
    end
    
    ram_model_1w1r run(wptr, in_xfc, IN_DAT, rptr, OUT_DAT, clk); //ram instantiation


endmodule
//================================================================================================

// Model of a 2-port RAM
//  1 Write Port
//      +
//  1 Read Port
//
// Number of storage elements = 2^(LOG2_DEPTH)
module ram_model_1w1r
#( parameter
    WORDLENGTH = 8,
    LOG2_DEPTH =  8
)
(
    input      [LOG2_DEPTH-1:0] IN_WADR,
    input                       IN_WEN,
    input      [WORDLENGTH-1:0] IN_WDAT,
    
    input      [LOG2_DEPTH-1:0] OUT_RADR,
    output     [WORDLENGTH-1:0] OUT_RDAT,
    
    input                       clk
);

reg [WORDLENGTH-1:0]        dbuf[(1<<LOG2_DEPTH)-1:0];    // storage array

assign OUT_RDAT = dbuf[OUT_RADR];      // retrieve read data

// num_in_buf
always @ (posedge clk)
begin
    if (IN_WEN)
        dbuf[IN_WADR]   <= IN_WDAT;             // store write data
end

endmodule