`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:40:20 03/28/2014 
// Design Name: 
// Module Name:    clock_generator 
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
module clock_generator(
  clk,
  rst_n,
  clk_100
);

input clk;
input rst_n;
output clk_100;

reg clk_100;
reg clk_100_next;
reg [17:0] count_200K;
reg [17:0] count_200K_next;

always @*
  if (count_200K == 199_999)
  begin
    count_200K_next = 18'd0;
	 clk_100_next = ~clk_100;
  end
  else
  begin
    count_200K_next = count_200K + 1'b1;
	 clk_100_next = clk_100;
  end

always @(posedge clk or negedge rst_n)
  if (~rst_n)
  begin
    count_200K <= 18'd0;
    clk_100 <= 1'b0;
  end
  else
  begin
    count_200K <= count_200K_next;
    clk_100 <= clk_100_next;
  end

endmodule
