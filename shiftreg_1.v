`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:51:53 06/14/2015 
// Design Name: 
// Module Name:    shiftreg_1 
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
///////////see you again////////////////
`define BIT_WIDTH 5
module shiftreg_1(
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
		q0<=5'd10;//S
		q1<=5'd2;//E
		q2<=5'd2;//E
		q3<=5'd15;//NO
		q4<=5'd16;//Y
		q5<=5'd12;//O
		q6<=5'd17;//U
		q7<=5'd15;//NO
		q8<=5'd0;//A
		q9<=5'd4;//G
		q10<=5'd0;//A
		q11<=5'd6;//I
		q12<=5'd13;//N
		q13<=5'd15;//NO
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

