`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:02:55 06/14/2015 
// Design Name: 
// Module Name:    FSM 
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
`define MENU 3'b000
`define SONG1 3'b001
`define SONG2 3'b010
`define PAUSE 3'b011
`define SPEED 3'b100

module FSM(
    key,
	 menu_ctl,
	 clk,
	 rst_n,
	 song_en,
	 play_en,
	 pressed,
	 ctl
    );
    
	 input pressed;
	 input [3:0] key;
	 input clk;
	 input rst_n;
	 
	 output reg menu_ctl;
	 output reg ctl;
	 output reg song_en;
	 output reg play_en;
	 
    reg [2:0] state, next_state;
	 reg song_en_tmp, play_en_tmp, ctl_tmp, menu_ctl_tmp;
	 
	 
always @(posedge clk or negedge rst_n)
  if (~rst_n)
   begin
    state <= `MENU;
	 song_en<=1'b1;
	 play_en<=1'b0;
	 ctl <=1'b1;
	// menu_ctl <=1'b1;
   end
  else
   begin
    state <= next_state;	 
	 song_en<=song_en_tmp;
	 play_en<=play_en_tmp;
	 ctl<=ctl_tmp;
	// menu_ctl <= menu_ctl_tmp;
	end
	 
always @*

case (state)

`MENU:
	if (pressed && key==4'd1) 
		begin
			next_state = `SONG1;
			song_en_tmp = 1'b1;
			play_en_tmp = 1'b1;
			ctl_tmp = 1'b1;
		//	menu_ctl_tmp = 1'b0;
		end
		
	else if(pressed && key==4'd2)
		begin
			next_state = `SONG2;
			song_en_tmp= 1'b0;
			play_en_tmp= 1'b1;
			ctl_tmp = 1'b1;
		//	menu_ctl_tmp = 1'b0;
		end
	else
      begin
			next_state = `MENU;
			song_en_tmp = 1'b1;
			play_en_tmp = 1'b0;
			ctl_tmp = 1'b1;
		//	menu_ctl_tmp = 1'b1;
		end	
		
`SONG1:
	if (pressed && key==4'd2) 
      begin
			next_state = `SONG2;
			song_en_tmp = 1'b0;
			play_en_tmp = 1'b0;
			ctl_tmp = 1'b1;
			//menu_ctl_tmp = 1'b1;
		end	
		
	else if(pressed && key==4'd11)
      begin
			next_state = `MENU;
			song_en_tmp = 1'b1;
			play_en_tmp = 1'b0;
			ctl_tmp = 1'b1;
			//menu_ctl_tmp = 1'b0;
		end
	else if(pressed && key==4'd12)
      begin
			next_state = `PAUSE;
			song_en_tmp = 1'b1;
			play_en_tmp = 1'b1;
			ctl_tmp = 1'b0;
			//menu_ctl_tmp = 1'b1;
		end	
	else
      begin
			next_state = `SONG1;
			song_en_tmp = 1'b1;
			play_en_tmp = 1'b1;
			ctl_tmp = 1'b1;
			//menu_ctl_tmp = 1'b1;
		end		

`SONG2:
	if (pressed && key==4'd1) 
      begin
			next_state = `SONG1;
			song_en_tmp = 1'b1;
			play_en_tmp = 1'b0;
			ctl_tmp = 1'b1;
			//menu_ctl_tmp = 1'b1;
		end	
		
	else if(pressed && key==4'd11)
      begin
			next_state = `MENU;
			song_en_tmp = 1'b1;
			play_en_tmp = 1'b0;
			ctl_tmp = 1'b1;
			//menu_ctl_tmp = 1'b0;
		end	
	else if(pressed && key==4'd12)
      begin
			next_state = `PAUSE;
			song_en_tmp = 1'b0;
			play_en_tmp = 1'b1;
			ctl_tmp = 1'b0;
			//menu_ctl_tmp = 1'b1;
		end	
	else
      begin
			next_state = `SONG2;
			song_en_tmp = 1'b0;
			play_en_tmp = 1'b1;
			ctl_tmp = 1'b1;
		//	menu_ctl_tmp = 1'b1;
		end
		
`PAUSE:
	if (pressed && key==4'd12 && song_en==1'b1) 
      begin
			next_state = `SONG1;
			song_en_tmp = 1'b1;
			play_en_tmp = 1'b1;
			ctl_tmp = 1'b1;
			//menu_ctl_tmp = 1'b1;
		end	
		
	else if (pressed && key==4'd12 && song_en==1'b0) 
      begin
			next_state = `SONG2;
			song_en_tmp = 1'b0;
			play_en_tmp = 1'b1;
			ctl_tmp = 1'b1;
			//menu_ctl_tmp = 1'b1;
		end	
	else
      begin
			next_state = `PAUSE;
			song_en_tmp = song_en;
			play_en_tmp = 1'b1;
			ctl_tmp = 1'b0;
			//menu_ctl_tmp = 1'b1;
		end
		
default: 
		begin
			next_state = `MENU;
			song_en_tmp = 1'b0;
			play_en_tmp = 1'b0;
			ctl_tmp = 1'b1;
			//menu_ctl_tmp = 1'b1;
		end	
	
	endcase
	

endmodule
