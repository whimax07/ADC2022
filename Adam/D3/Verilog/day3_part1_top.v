`timescale 1ns / 1ps

module day3_part1_top( clk, sum, done, debug_rom_out, debug_rom_addr, debug_comparator, debug_half1, debug_half2 );
    input clk;
    output [31:0] sum;
    output done;
    output [7:0] debug_rom_out;
    output [13:0] debug_rom_addr;
    output [63:0] debug_comparator;
    output [63:0] debug_half1;
    output [63:0] debug_half2;
    
    reg [13:0] addr = 14'b0;
    reg [13:0] start_addr = 14'b0;
    reg [13:0] next_addr = 14'b0;
    wire [7:0] rom_out;
    
    reg [63:0] half1 = 64'b0;
    reg [63:0] half2 = 64'b0;
    reg [63:0] comparator = 64'b0;
    reg [15:0] num_elements = 16'b0;
    reg [15:0] element = 16'b0;
        
    reg [7:0] value = 8'b0;
    reg [31:0] sum_pairs = 32'b0;
        
    localparam GET_LEN = 3'b000, READ_1 = 3'b001, READ_2 = 3'b010, COMPARE = 3'b011, GET_VAL = 3'b100, CHECK = 3'b101, DONE = 3'b110;
    reg [2:0] state = GET_LEN;
    
    reg int_done = 1'b0;
        
    assign sum = sum_pairs;
    assign done = int_done;
    assign debug_rom_out = rom_out;
    assign debug_rom_addr = addr;
    assign debug_comparator = comparator;
    assign debug_half1 = half1;
    assign debug_half2 = half2;
        
    dist_mem_gen_0 rom (
        .a(addr),
        .spo(rom_out)
    );
        
    always @ (posedge clk)
    begin
    
    case (state)
    GET_LEN:
    begin
        if (rom_out == 8'b0)
        begin
            half1 <= 64'b0;
            half2 <= 64'b0;
            comparator <= 64'b0;
            state <= READ_1;
            addr <= start_addr;
            next_addr <= addr;
            num_elements <= num_elements >> 1;
            element <= 16'b0;
        end
        else
        begin
            addr <= addr + 1;
            num_elements <= num_elements + 1;
        end
    end
    READ_1:
    begin
        if (element == num_elements)
        begin
            element <= 16'b0;
            state <= READ_2;
        end
        else
        begin
            addr <= addr + 1;
            element <= element + 1;
            half1[rom_out] <= 1'b1;
        end
    end
    READ_2:
    begin
        if (element == num_elements)
        begin
            num_elements <= 16'b0;
            state <= COMPARE;
        end
        else
        begin
            addr <= addr + 1;
            element <= element + 1;
            half2[rom_out] <= 1'b1;
        end
    end
    COMPARE:
    begin
        comparator = half1 & half2;
        if (comparator != 64'b0)
        begin
            value <= 8'b0;
            state <= GET_VAL;
        end
        else
        begin
            addr <= next_addr + 1;
            state <= CHECK;
        end
    end
    GET_VAL:
    begin
        comparator <= comparator >> 1;
        value <= value + 1;
        if (comparator == 1'b1)
        begin
            state <= CHECK;
            addr <= next_addr + 1;
            start_addr <= next_addr + 1;
            sum_pairs <= sum_pairs + value;
        end
    end
    CHECK:
    begin
        if (rom_out == 8'b0)
            state <= DONE;
        else
            state <= GET_LEN;
    end
    DONE:
    begin
        int_done <= 1'b1;
    end
    endcase
    
    end
endmodule
