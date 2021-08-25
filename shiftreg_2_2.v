`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:26:43 06/14/2015 
// Design Name: 
// Module Name:    shiftreg_2_2 
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

//////pitch perfect//////////

`define BIT_WIDTH 4
module shiftreg_2_2(
	q0,q1,q2,q3,// LED output
	clk, // global clock
	rst_n, // active low reset
	mode
);
output reg[`BIT_WIDTH-1:0] q0, q1,q2,q3; // LED output
input clk; // global clock
input rst_n; // active low reset
input mode;

reg [3:0]q4,q5,q6,q7,q8,q9,q10,q11,q12,q13;

// Insert frequency divider (freq_div.v)

always@(posedge clk or negedge rst_n)
	if(~rst_n )
	begin
		q0<=4'd8;//P
		q1<=4'd6;//I
		q2<=4'd11;//T
		q3<=4'd1;//C
		q4<=4'd5;//H
		q5<=4'd15;//NO
		q6<=4'd8;//P
		q7<=4'd2;//E
		q8<=4'd9;//R
		q9<=4'd3;//F
		q10<=4'd2;//E
		q11<=4'd1;//C
		q12<=4'd11;//T
		q13<=4'd15;//NO
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
		q7<=q8;
		q8<=q9;
		q9<=q10;
		q10<=q11;
		q11<=q12;
		q12<=q13;
		q13<=q0;
	end
	
endmodule


