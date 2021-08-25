`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:35:38 03/26/2014 
// Design Name: 
// Module Name:    display 
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
module display(
  in,      // binary input
  display  // 14-segment display output
);

input [4:0] in;         // binary input
output [14:0] display;  // 14-segment display out

reg [14:0] display;

// Combinatioanl Logic
always @*
  case (in)
    5'd0: display = 15'b0001_0000_1111_111;		//A
	 5'd1: display = 15'b0110_0011_1111_111;    // C
	 5'd2: display = 15'b0110_0000_1111_111;    // E
	 5'd3: display = 15'b0111_0000_1111_111;    // F
	 5'd4: display = 15'b0100_0010_1111_111;    // G
	 5'd5: display = 15'b1001_0000_1111_111;    // H
	 5'd6: display	= 15'b0110_1111_1011_011;    // I
	 5'd7: display = 15'b1110_0011_1111_111;     //L
	 5'd8: display = 15'b0011_0000_1111_111;    // P
	 5'd9: display = 15'b0011_0000_1111_101;		//R
	 5'd10:display = 15'b0100_1000_1111_111;		//S 	
	 5'd11:display = 15'b0111_1111_1011_011;		//T
	 5'd12:display = 15'b0000_0011_1111_111;		//O
	 5'd13:display = 15'b1001_0011_0111_101;		//N
	 5'd14:display = 15'b1000_0111_1111_111;		//J
	 5'd15:display=15'b1111_1111_1111_111;//no signal
	 5'd16:display = 15'b1111_1111_0101_011;    // Y
	 5'd17:display = 15'b1000_0011_1111_111;		//U
	 
	 default: display = 15'b1111_1111_1111_111;  // default
  endcase

endmodule
