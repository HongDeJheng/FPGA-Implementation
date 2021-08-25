`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:21:27 03/26/2014 
// Design Name: 
// Module Name:    scan_ctl 
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
module scan_ctl(
  in0,          // 1st input
  in1,          // 2nd input
  in2,          // 3rd input
  in3,          // 4th input
  ftsd_ctl_en,  // divided clock for scan control
  ftsd_in,      // output to ftsd display
  ftsd_ctl      // ftsd display control signal
);

input [4:0] in0,in1,in2,in3;  // binary input control for the four digits 
input [1:0] ftsd_ctl_en;      // divided clock for scan control
output [4:0] ftsd_in;         // binary data 
output [3:0] ftsd_ctl;        // scan control for 14-segment display

reg [4:0] ftsd_in;  // 14 segment display control
reg [3:0] ftsd_ctl; // scan control for 14-segment display

always @*
  case (ftsd_ctl_en)
    2'b00: 
    begin
      ftsd_ctl = 4'b0111;
      ftsd_in = in0;
    end

    2'b01: 
    begin
      ftsd_ctl = 4'b1011;
      ftsd_in = in1;
    end

    2'b10: 
    begin
      ftsd_ctl = 4'b1101;
      ftsd_in = in2;
    end

    2'b11:	 
    begin
      ftsd_ctl = 4'b1110;
      ftsd_in = in3;
    end

    default: 
    begin
      ftsd_ctl = 4'b1111;
      ftsd_in = in0;
    end
  endcase

endmodule
