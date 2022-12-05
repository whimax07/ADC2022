`timescale 1ns / 1ps

module day2_top( player1_input, player2_input, play, player1_score, player2_score );
    input [1:0] player1_input;
    input [1:0] player2_input;
    input play;
    output [15:0] player1_score;
    output [15:0] player2_score;
    
    localparam INVALID = 2'b00, ROCK = 2'b01, PAPER = 2'b10, SCISSORS = 2'b11;
    
    reg [15:0] player1_score_sum = 16'b0;
    reg [15:0] player2_score_sum = 16'b0;
    reg game_valid = 1'b1;
    
    assign player1_score = player1_score_sum;
    assign player2_score = player2_score_sum;
    
    always @ (posedge play)
    begin
         if (player1_input == INVALID | player2_input == INVALID)
            game_valid <= 1'b0;
        if (~game_valid)
        begin
            player1_score_sum <= 16'bx;
            player2_score_sum <= 16'bx;
        end
        else
        begin
            if (player1_input == player2_input)
            begin
                player1_score_sum <= player1_score_sum + player1_input + 3;
                player2_score_sum <= player2_score_sum + player2_input + 3;
            end
            else
            begin
                if (player1_input > player2_input)
                begin
                    if (player2_input == ROCK & player1_input == SCISSORS)
                    begin
                        player2_score_sum <= player2_score_sum + player2_input + 6;
                        player1_score_sum <= player1_score_sum + player1_input;
                    end
                    else
                    begin
                        player1_score_sum <= player1_score_sum + player1_input + 6;
                        player2_score_sum <= player2_score_sum + player2_input;
                    end
                end
                else
                begin
                    if (player1_input == ROCK & player2_input == SCISSORS)
                    begin
                        player1_score_sum <= player1_score_sum + player1_input + 6;
                        player2_score_sum <= player2_score_sum + player2_input;
                    end
                    else
                    begin
                        player2_score_sum <= player2_score_sum + player2_input + 6;
                        player1_score_sum <= player1_score_sum + player1_input;
                    end
                end
            end
        end
    end
endmodule
