`timescale 1ns / 1ps

module day2_top_tb;

reg [1:0] player1_move = 2'bxx;
reg [1:0] player2_move = 2'bxx;
reg play = 1'b0;
reg mode = 1'b0;

wire [15:0] player1_score;
wire [15:0] player2_score;

day2_top UUT ( 
    .player1_input(player1_move), 
    .player2_raw_input(player2_move), 
    .play(play), 
    .player1_score(player1_score),
    .player2_score(player2_score),
    .sekrit_mode(mode)
);

localparam X = 2'b01, Y = 2'b10, Z = 2'b11;
localparam A = 2'b01, B = 2'b10, C = 2'b11;


initial begin
/*
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
*/

player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Z;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = X;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = C;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = B;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;
#10
player1_move = A;
player2_move = Y;
#10
play = 1'b1;
#10
play = 1'b0;

end
endmodule