`timescale 1ns / 1ps

module strategy_computer ( other_move, strategy, compute, strategy_move );
    input [1:0] other_move;
    input [1:0] strategy;
    input compute;
    output [1:0] strategy_move;
    
    reg [8:0] strategy_lookup_1 = 9'b011110101;
    reg [8:0] strategy_lookup_0 = 9'b110101011;
    assign strategy_move[1] = strategy_lookup_1[(other_move-1) + 3*(strategy-1)];
    assign strategy_move[0] = strategy_lookup_0[(other_move-1) + 3*(strategy-1)];
    
endmodule

module mux2_2 ( i0, i1, s, o );
    input [1:0] i0;
    input [1:0] i1;
    input s;
    output [1:0] o;
    
    assign o[1] = (i0[1] & ~s) | (i1[1] & s);
    assign o[0] = (i0[0] & ~s) | (i1[0] & s);
endmodule 

module day2_top( player1_input, player2_raw_input, play, player1_score, player2_score, sekrit_mode );
    input [1:0] player1_input;
    input [1:0] player2_raw_input;
    input play;
    output [15:0] player1_score;
    output [15:0] player2_score;
    input sekrit_mode;
    
    localparam INVALID = 2'b00, ROCK = 2'b01, PAPER = 2'b10, SCISSORS = 2'b11;
    
    reg [15:0] player1_score_sum = 16'b0;
    reg [15:0] player2_score_sum = 16'b0;
    reg game_valid = 1'b1;

    wire [1:0] player2_sekrit_input;
    strategy_computer ultra_top_secret_strategy_guide (
        .other_move(player1_input),
        .strategy(player2_raw_input),
        .compute(play),
        .strategy_move(player2_sekrit_input)
    );

    wire [1:0] player2_input;
    mux2_2 mode_selector (
        .i0(player2_raw_input),
        .i1(player2_sekrit_input),
        .s(sekrit_mode),
        .o(player2_input)
    );

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
