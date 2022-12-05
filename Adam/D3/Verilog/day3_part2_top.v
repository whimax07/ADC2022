`timescale 1ns / 1ps

module day3_part2_top( clk, sum, done, debug_rom_out, debug_rom_addr, debug_comparator );
    input clk;
    output [31:0] sum;
    output done;
    output [7:0] debug_rom_out;
    output [13:0] debug_rom_addr;
    output [63:0] debug_comparator;
    
    reg [13:0] addr = 14'b0;
    wire [7:0] rom_out;
    
    reg [63:0] sub_group1 = 64'b0;
    reg [63:0] sub_group2 = 64'b0;
    reg [63:0] sub_group3 = 64'b0;
    reg [63:0] comparator = 64'b0;
        
    reg [7:0] value = 8'b0;
    reg [31:0] sum_triples = 32'b0;
        
    localparam READ_1 = 3'b000, READ_2 = 3'b001, READ_3 = 3'b010, COMPARE = 3'b011, GET_VAL = 3'b100, CHECK = 3'b101, DONE = 3'b110;
    reg [2:0] state = READ_1;
    
    reg int_done = 1'b0;
        
    assign sum = sum_triples;
    assign done = int_done;
    assign debug_rom_out = rom_out;
    assign debug_rom_addr = addr;
    assign debug_comparator = comparator;
        
    dist_mem_gen_0 rom (
        .a(addr),
        .spo(rom_out)
    );
        
    always @ (posedge clk)
    begin
    
    case (state)
    READ_1:
    begin
        addr <= addr + 1;
        if (rom_out == 8'b0)
            state <= READ_2;
        else
            sub_group1[rom_out] <= 1'b1;
    end
    READ_2:
    begin
        addr <= addr + 1;
        if (rom_out == 8'b0)
            state <= READ_3;
        else
            sub_group2[rom_out] <= 1'b1;
    end
    READ_3:
    begin
        addr <= addr + 1;
        if (rom_out == 8'b0)
            state <= COMPARE;
        else
            sub_group3[rom_out] <= 1'b1;
    end
    COMPARE:
    begin
        comparator = sub_group1 & sub_group2 & sub_group3;
        if (comparator != 64'b0)
        begin
            value <= 8'b0;
            state <= GET_VAL;
        end
        else
        begin
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
            sum_triples <= sum_triples + value;
        end
    end
    CHECK:
    begin
        if (rom_out == 8'b0)
            state <= DONE;
        else
        begin
            state <= READ_1;
            sub_group1 <= 64'b0;
            sub_group2 <= 64'b0;
            sub_group3 <= 64'b0;
            comparator <= 64'b0;
        end
    end
    DONE:
    begin
        int_done <= 1'b1;
    end
    endcase
    
    end
endmodule
