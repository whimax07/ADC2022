`timescale 1ns / 1ps

module day1_top( par_input, next_val, highest_val_index, highest_val_sum );
    input [15:0] par_input;
    input next_val;
    output [7:0] highest_val_index;
    output [15:0] highest_val_sum;
    
    reg [15:0] highest_sum = 16'b0;
    reg [15:0] current_sum = 16'b0;
    reg [7:0] highest_index = 8'b0;
    reg [7:0] current_index = 8'b0;
    
    assign highest_val_sum = highest_sum;
    assign highest_val_index = highest_index;
    
    always @ (posedge next_val)
    begin
        if (par_input == 16'b0)
        begin
            current_index <= current_index + 1;
            current_sum <= 16'b0;
        end
        else
        begin
            current_sum <= current_sum + par_input;
            if (current_sum + par_input > highest_sum)
            begin
                highest_sum <= current_sum + par_input;
                highest_index <=  current_index;
            end
        end
    end
endmodule
