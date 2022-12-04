`timescale 1ns / 1ps

module day1_top_tb;

reg input_next_val = 1'b0;
reg [15:0] input_val = 16'bx;

wire [15:0] output_highest_sum;
wire [7:0] output_highest_index;

day1_top UUT ( 
    .par_input(input_val), 
    .next_val(input_next_val), 
    .highest_val_index(output_highest_index), 
    .highest_val_sum(output_highest_sum)
);

initial begin

#10
input_val = 16'h03E8;
#10
input_next_val = 1'b1;
#10
input_next_val = 1'b0;
#10
input_val = 16'h07D0;
#10
input_next_val = 1'b1;
#10
input_next_val = 1'b0;
#10
input_val = 16'h0BB8;
#10

input_next_val = 1'b1;
#10
input_next_val = 1'b0;
#10
input_val = 16'h0000;
#10

input_next_val = 1'b1;
#10
input_next_val = 1'b0;
#10
input_val = 16'h0FA0;
#10

input_next_val = 1'b1;
#10
input_next_val = 1'b0;
#10
input_val = 16'h0000;
#10

input_next_val = 1'b1;
#10
input_next_val = 1'b0;
#10
input_val = 16'h1388;
#10
input_next_val = 1'b1;
#10
input_next_val = 1'b0;
#10
input_val = 16'h1770;
#10

input_next_val = 1'b1;
#10
input_next_val = 1'b0;
#10
input_val = 16'h0000;
#10

input_next_val = 1'b1;
#10
input_next_val = 1'b0;
#10
input_val = 16'h1B58;
#10
input_next_val = 1'b1;
#10
input_next_val = 1'b0;
#10
input_val = 16'h1F40;
#10
input_next_val = 1'b1;
#10
input_next_val = 1'b0;
#10
input_val = 16'h2328;
#10

input_next_val = 1'b1;
#10
input_next_val = 1'b0;
#10
input_val = 16'h0000;
#10

input_next_val = 1'b1;
#10
input_next_val = 1'b0;
#10
input_val = 16'h2710;

end
endmodule