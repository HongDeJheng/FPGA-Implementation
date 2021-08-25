`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:59:22 03/27/2014 
// Design Name: 
// Module Name:    one_pulse 
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
module one_pulse(
  clk,    // clock input
  rst_n,  // active low reset
  trig,   // input trigger
  pulse   // output one pulse
);

input clk;     // clock input
input rst_n;   // active low reset
input trig;    // input trigger
output pulse;  // output one pulse 

wire pulse_next;
reg pulse; 
reg trig_delay;

assign pulse_next = trig & (~trig_delay);

always @(posedge clk or negedge rst_n)
  if (~rst_n)
    trig_delay <= 1'b0; 
  else
    trig_delay <= trig;

always @(posedge clk or negedge rst_n)
  if (~rst_n)
    pulse <= 1'b0;
  else
    pulse <= pulse_next;

endmodule
