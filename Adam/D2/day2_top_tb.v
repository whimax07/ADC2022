`timescale 1ns / 1ps

module day2_top_tb;

reg [1:0] player1_move = 2'bxx;
reg [1:0] player2_move = 2'bxx;
reg play = 1'b0;

wire [15:0] player1_score;
wire [15:0] player2_score;

day2_top UUT ( 
    .player1_input(player1_move), 
    .player2_input(player2_move), 
    .play(play), 
    .player1_score(player1_score),
    .player2_score(player2_score)
);

localparam INVALID = 2'b00, ROCK = 2'b01, PAPER = 2'b10, SCISSORS = 2'b11;

initial begin

player1_move = ROCK;
player2_move = PAPER;
play = 1'b1;
#10
play = 1'b0;
#10

player1_move = PAPER;
player2_move = ROCK;
play = 1'b1;
#10
play = 1'b0;
#10

player1_move = SCISSORS;
player2_move = SCISSORS;
play = 1'b1;
#10
play = 1'b0;

end
endmodule