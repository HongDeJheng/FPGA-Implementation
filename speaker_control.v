`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:33:17 04/27/2014 
// Design Name: 
// Module Name:    speaker_control 
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
module speaker_control(
  clk,
  rst_n,
  audio_left,
  audio_right,
  audio_appsel,
  audio_sysclk,
  audio_bck,
  audio_ws,
  audio_data
);

input clk;
input rst_n;
input [15:0] audio_left, audio_right;
output audio_appsel;
output audio_sysclk;
output audio_bck;
output audio_ws;
output audio_data;

reg audio_appsel;
reg audio_sysclk;
reg audio_bck;
reg audio_ws;
reg audio_data;
reg [7:0] clk_cnt, clk_cnt_tmp;
reg [31:0] data, data_tmp;
reg [4:0] data_cnt, data_cnt_tmp;

always @*
  audio_appsel = 1'b1;

always @*
  audio_sysclk = clk;

always @*
  clk_cnt_tmp = clk_cnt + 1'b1;

always @(posedge clk or negedge rst_n)
  if (~rst_n)
    clk_cnt <= 8'b0;
  else
    clk_cnt <= clk_cnt_tmp;

always @*
begin
  audio_bck = clk_cnt[2];
  audio_ws = clk_cnt[7];
end

always @*
  data_cnt_tmp = data_cnt + 1'b1;

always @(posedge audio_bck or negedge rst_n)
  if (~rst_n)
    data_cnt = 5'd0;
  else
    data_cnt = data_cnt_tmp;

always @*
  if (data_cnt == 5'd0)
    data_tmp = {audio_right, audio_left};
  else
    data_tmp = {data[30:0], 1'b0};

always @(posedge audio_bck or negedge rst_n)
  if (~rst_n)
    data = 32'd0;
  else
    data = data_tmp;

always @*
  audio_data = data[31];

endmodule
