`timescale 1ns / 1ps

module day4_top( clk, sum_overlap, sum_contain, done );
    input clk;
    output [15:0] sum_contain;
    output [15:0] sum_overlap;
    output done;
    
    localparam LVAL_L = 3'b000, LVAL_R = 3'b001, BUILD_LVAL = 3'b010, RVAL_L = 3'b011, RVAL_R = 3'b100, BUILD_RVAL = 3'b101, COMPARE = 3'b110, DONE = 3'b111;
    reg [2:0] state = LVAL_L;
    
    reg [13:0] addr = 14'b0;
    wire [7:0] rom_out;
    
    reg [15:0] sum_containers = 16'b0;
    reg [15:0] sum_overlaps = 16'b0;
    reg [99:0] lval = 100'b0;
    reg [99:0] rval = 100'b0;
    reg [7:0] index = 8'b0;
    reg [7:0] end_index = 8'b0;
    
    reg int_done = 1'b0;
    
    dist_mem_gen_0 rom_block (
        .a(addr),
        .spo(rom_out)
    );
    
    assign sum_overlap = sum_overlaps;
    assign sum_contain = sum_containers;
    assign done = int_done;
     
    always @ (posedge clk)
    begin
    
    case (state)
    LVAL_L:
    begin
        addr <= addr + 1;
        index <= rom_out;
        state <= LVAL_R;
    end
    LVAL_R:
    begin
        addr <= addr + 1;
        end_index <= rom_out;
        state <= BUILD_LVAL;
        lval <= 100'b0;
    end
    BUILD_LVAL:
    begin
        lval[index] <= 1'b1;
        if (index == end_index)
            state <= RVAL_L;
        else
            index <= index + 1;
    end
    RVAL_L:
    begin
        addr <= addr + 1;
        index <= rom_out;
        state <= RVAL_R;
    end
    RVAL_R:
    begin
        addr <= addr + 1;
        end_index <= rom_out;
        state <= BUILD_RVAL;
        rval <= 100'b0;
    end
    BUILD_RVAL:
    begin
        rval[index] <= 1'b1;
        if (index == end_index)
            state <= COMPARE;
        else
            index <= index + 1;
    end
    COMPARE:
    begin
        if ((lval & rval) == lval | (lval & rval) == rval)
            sum_containers <= sum_containers + 1;
        if ((lval & rval) != 0)
            sum_overlaps <= sum_overlaps + 1;
        if (rom_out == 8'b0)
            state <= DONE;
        else
            state <= LVAL_L;
    end
    DONE:
    begin
        int_done <= 1'b1;
    end
    endcase
    
    end
    
endmodule
