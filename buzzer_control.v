`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:46:13 04/26/2014 
// Design Name: 
// Module Name:    buzzer_control 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module buzzer_control(
  clk,
  rst_n,
  note_div,
  sound,
  audio_left,
  audio_right
);


input clk;
input rst_n;
input [19:0] note_div;  // 20-bit
input [15:0] sound;
output [15:0] audio_left, audio_right;

reg [15:0] audio_left, audio_right;
reg [19:0] clk_cnt, clk_cnt_tmp;
reg b_clk, b_clk_tmp;

always @*
  if (clk_cnt == note_div)
  begin
    clk_cnt_tmp = 20'b0;
    b_clk_tmp = ~b_clk;
  end
  else
  begin
    clk_cnt_tmp = clk_cnt + 1'b1;
    b_clk_tmp = b_clk;
  end

always @(posedge clk or negedge rst_n)
  if (~rst_n)
  begin
    clk_cnt <= 20'b0;
    b_clk <= 1'b0;
  end
  else
  begin
    clk_cnt <= clk_cnt_tmp;
    b_clk <= b_clk_tmp;
  end

always @*
  if (b_clk == 1'b0)
  begin
    audio_left = sound;
    audio_right = sound;
  end
  else
  begin
    audio_left = 16'h0000;
    audio_right = 16'h0000;
  end

endmodule
