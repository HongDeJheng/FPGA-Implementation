`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:04:43 03/30/2015 
// Design Name: 
// Module Name:    freq_div 
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
`define FREQ_DIV_BIT 25
module freq_div(
	clk_out, // divided clock output
	clk_ctl, // divided clock output for scan freq
	clk, // global clock input
	rst_n, // active low reset
	clk_debounce,
	clk_1_sec
);
output clk_out, clk_debounce,clk_1_sec; // divided output
output [1:0] clk_ctl; // divided output for scan freq
input clk; // global clock input
input rst_n; // active low reset
reg clk_out; // clk output (in always block)
reg clk_1_sec;
reg [1:0] clk_ctl; // clk output (in always block)
reg [14:0] cnt_l; // temp buf of the counter
reg [2:0] cnt_h; // temp buf of the counter
reg [1:0] cnt_n; // temp buf of the counter

reg clk_debounce;
reg [`FREQ_DIV_BIT-1:0] cnt_tmp; // input to dff (in always block)
// Combinational logics: increment, neglecting overflow

always @*
	cnt_tmp = {clk_1_sec,cnt_n,clk_out,clk_debounce,cnt_h,clk_ctl,cnt_l} + 1'b1;
// Sequential logics: Flip flops
always @(posedge clk or negedge rst_n)
if (~rst_n) 
	{clk_1_sec,cnt_n,clk_out,clk_debounce,cnt_h, clk_ctl, cnt_l}<=`FREQ_DIV_BIT'd0;
else 
	{clk_1_sec,cnt_n,clk_out, clk_debounce, cnt_h, clk_ctl, cnt_l}<=cnt_tmp;
endmodule


