`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:51:55 04/27/2014 
// Design Name: 
// Module Name:    speaker 
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
module speaker(
  clk,
  rst_n,
  sound,
  note_div,
  audio_appsel,
  audio_sysclk,
  audio_bck,
  audio_ws,
  audio_data
);

input clk;
input rst_n;
input [15:0] sound;
input [19:0] note_div;
output audio_appsel;
output audio_sysclk;
output audio_bck;
output audio_ws;
output audio_data;

wire [15:0] audio_left, audio_right;

buzzer_control U_BC(
  .clk(clk),
  .rst_n(rst_n),
  .note_div(note_div),
  .sound(sound),
  .audio_left(audio_left),
  .audio_right(audio_right)
);

speaker_control U_SC(
  .clk(clk),
  .rst_n(rst_n),
  .audio_left(audio_left),
  .audio_right(audio_right),
  .audio_appsel(audio_appsel),
  .audio_sysclk(audio_sysclk),
  .audio_bck(audio_bck),
  .audio_ws(audio_ws),
  .audio_data(audio_data)
);

endmodule
