`timescale 1ns / 1ps

module day1_top( par_input, next_val, highest_val_index, highest_val_sum, top_three_val_sum, second_highest_val_index, third_highest_val_index );
    input [31:0] par_input;
    input next_val;
    output [15:0] highest_val_index;
    output [31:0] highest_val_sum;
    output [31:0] top_three_val_sum;
    output [15:0] second_highest_val_index;
    output [15:0] third_highest_val_index;
    
    reg [31:0] highest_sum = 32'b0;
    reg [31:0] second_highest_sum = 32'b0;
    reg [31:0] third_highest_sum = 32'b0;
    reg [31:0] current_sum = 32'b0;
    reg [15:0] highest_index = 16'b0;
    reg [15:0] second_highest_index = 16'b0;
    reg [15:0] third_highest_index = 16'b0;
    reg [15:0] current_index = 16'b0;
    
    assign highest_val_sum = highest_sum;
    assign highest_val_index = highest_index;
    assign top_three_val_sum = highest_sum + second_highest_sum + third_highest_sum;
    assign second_highest_val_index = second_highest_index;
    assign third_highest_val_index = third_highest_index;
    
    always @ (posedge next_val)
    begin
        if (par_input == 32'b0)
        begin
            current_index <= current_index + 1;
            current_sum <= 32'b0;
        end
        else
        begin
            current_sum <= current_sum + par_input;
            if (current_sum + par_input > highest_sum)
            begin
                highest_sum <= current_sum + par_input;
                highest_index <= current_index;
                if (highest_index != current_index)
                begin
                    second_highest_sum <= highest_sum;
                    second_highest_index <= highest_index;
                    third_highest_sum <= second_highest_sum;
                    third_highest_index <= second_highest_index;
                end
            end
            else
            begin
                if (current_sum + par_input > second_highest_sum)
                begin
                    second_highest_sum <= current_sum + par_input;
                    second_highest_index <= current_index;
                    if (second_highest_index != current_index)
                    begin
                        third_highest_sum <= second_highest_sum;
                        third_highest_index <= second_highest_index;
                    end
                end
                else
                begin
                    if (current_sum + par_input > third_highest_sum)
                    begin
                        third_highest_sum <= current_sum + par_input;
                        third_highest_index <= current_index;
                    end
                end
            end
        end
    end
endmodule
