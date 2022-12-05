`timescale 1ns / 1ps

module day3_top_tb;

reg clk = 1'b0;

wire [31:0] sum;
wire done;
wire [7:0] debug_rom_out;
wire [11:0] debug_rom_addr;
wire [63:0] debug_comparator;
wire [63:0] debug_half1;
wire [63:0] debug_half2;

day3_top UUT ( 
    .clk(clk), 
    .sum(sum), 
    .done(done), 
    .debug_rom_out(debug_rom_out), 
    .debug_rom_addr(debug_rom_addr),
    .debug_comparator(debug_comparator), 
    .debug_half1(debug_half1),
    .debug_half2(debug_half2) 
);

initial begin
#100;

while (done == 1'b0)
begin
    #10
    clk = ~clk;
end

end
endmodule
