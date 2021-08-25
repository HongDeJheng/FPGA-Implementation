`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:03:08 06/14/2015 
// Design Name: 
// Module Name:    shiftreg_1_2 
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

//////furious/////////////////
`define BIT_WIDTH 5
module shiftreg_1_2(
	q0,q1,q2,q3,// LED output
	clk, // global clock
	rst_n, // active low reset
	mode
);
output reg[`BIT_WIDTH-1:0] q0, q1,q2,q3; // LED output
input clk; // global clock
input rst_n; // active low reset
input mode;

reg [4:0]q4,q5,q6,q7,q8,q9,q10,q11,q12,q13;

// Insert frequency divider (freq_div.v)

always@(posedge clk or negedge rst_n)
	if(~rst_n )
	begin
		q0<=5'd3;//F
		q1<=5'd17;//U
		q2<=5'd9;//R
		q3<=5'd6;//I
		q4<=5'd12;//O
		q5<=5'd17;//U
		q6<=5'd10;//S
		q7<=5'd15;//NO
		q8<=5'd15;//
		q9<=5'd15;//
		q10<=5'd15;//
		q11<=5'd15;//
		q12<=5'd15;//
		q13<=5'd15;//
	end
	else
	begin
		q0<=q1;
		q1<=q2;
		q2<=q3;
		q3<=q4;
		q4<=q5;
		q5<=q6;
		q6<=q7;
		q7<=q0;
		
		q8<=q8;
		q9<=q9;
		q10<=q10;
		q11<=4'd15;
		q12<=4'd15;
		q13<=4'd15;
	end

endmodule
