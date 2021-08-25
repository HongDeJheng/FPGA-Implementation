`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:14:47 05/04/2014 
// Design Name: 
// Module Name:    lab09_2 
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
module lab09_2(
  clk,
  rst_n,
  mode,
  s1,
  s2,
  s3,
  s4,
  s5,
  audio_appsel, 
  audio_sysclk, 
  audio_bck,
  audio_ws,
  audio_data,
  display,
  ftsd_ctl,
  out,
  col_n, // pressed column index
  row_n,  // scanned row index
  pause_ctl,
  menu_ctl,
  key,
  pressed
);

input clk;
input rst_n;
input s1, s2, s3, s4, s5, mode;

input [3:0] col_n; // pressed column index
output [3:0] row_n; // scanned row index
  
output audio_appsel; 
output audio_sysclk; 
output audio_bck;
output audio_ws;
output audio_data;
output [14:0] display;
output [3:0] ftsd_ctl;
output [15:0]out;
output pause_ctl;
output menu_ctl;
output [3:0]key;
output pressed;

wire clk_100;
wire s4_de, s5_de;
wire s4_ctl, s5_ctl;
wire [15:0] sound1;
wire [19:0] note_div1;
wire [3:0] level1;
wire [15:0]out1;
wire [15:0] sound2;
wire [19:0] note_div2;
wire [3:0] level2;
wire [15:0]out2;
wire [15:0] sound;
wire [19:0] note_div;
wire [3:0] level;
reg [4:0]q0,q1,q2,q3;
wire [4:0]q0_f,q1_f,q2_f,q3_f;
wire [4:0]q0_2_1,q1_2_1,q2_2_1,q3_2_1;
wire [4:0]q0_2_2,q1_2_2,q2_2_2,q3_2_2;
wire [4:0]q0_1_1,q1_1_1,q2_1_1,q3_1_1;
wire [4:0]q0_1_2,q1_1_2,q2_1_2,q3_1_2;

wire [1:0] ftsd_ctl_en;
wire [4:0] ftsd_in;

wire clk_out;
wire enn;
wire ennn;

wire clk_debounce, pressed;
wire [3:0] key; // pressed key
wire clk_1_sec;

wire ctl;

assign note_div = (enn)? note_div1:note_div2;
assign sound= (enn)? sound1:sound2;
assign level= (enn)? level1:level2;
assign level= (enn)? level1:level2;
assign out= (enn)? out1:out2;


assign clk_song = (s2)? clk_out:clk_debounce;

always@*
if(ennn && ~mode && ~enn)
begin
 q0 = q0_2_1;
 q1 = q1_2_1;
 q2 = q2_2_1;
 q3 = q3_2_1;
end
else if(ennn && mode && ~enn)
begin
 q0 = q0_2_2;
 q1 = q1_2_2;
 q2 = q2_2_2;
 q3 = q3_2_2;
end
else if(ennn && ~mode && enn)
begin
 q0 = q0_1_1;
 q1 = q1_1_1;
 q2 = q2_1_1;
 q3 = q3_1_1;
end
else if(ennn && mode && enn)
begin
 q0 = q0_1_2;
 q1 = q1_1_2;
 q2 = q2_1_2;
 q3 = q3_1_2;
end
else if(~ennn)
begin
 q0 = q0_f;
 q1 = q1_f;
 q2 = q2_f;
 q3 = q3_f;
end
else
begin
	q0=5'd1;
	q1=5'd1;
	q2=5'd1;
	q3=5'd1;
end


keypad_scan KS0(
  .clk(clk), // scan clock
  .clk_d(clk_debounce),
  .rst_n(rst_n), // active low reset
  .col_n(col_n), // pressed_detected col_numn index
  .row_n(row_n), // scanned row_n index
  .key(key),  // returned pressed_detected key
  .pressed(pressed)
);

FSM uf(
    .key(key),
	 .clk(clk_out),
	 .rst_n(rst_n),
	 .song_en(enn),
	 .play_en(ennn),
	 .pressed(pressed),
	 .ctl(pause_ctl),
	 .menu_ctl(menu_ctl)
    );
	 
freq_div U_FD(
  .clk(clk),
  .rst_n(rst_n),
  .clk_ctl(ftsd_ctl_en),
  .clk_out(clk_out),
  .clk_debounce(clk_debounce),
  .clk_1_sec(clk_1_sec)
);

clock_generator U_CG(
  .clk(clk),
  .rst_n(rst_n),
  .clk_100(clk_100)
);


debounce_circuit U_DBCs4(
  .clk(clk_100),
  .rst_n(rst_n),
  .pb_in(s4),
  .pb_debounced(s4_de)
);

debounce_circuit U_DBCs5(
  .clk(clk_100),
  .rst_n(rst_n),
  .pb_in(s5),
  .pb_debounced(s5_de)
);


one_pulse U_OPs4(
  .clk(clk_100),
  .rst_n(rst_n),
  .trig(s4_de),
  .pulse(s4_ctl)
);

one_pulse U_OPs5(
  .clk(clk_100),
  .rst_n(rst_n),
  .trig(s5_de),
  .pulse(s5_ctl)
);

sound_ctl U_sound_ctl(
  .clk(clk_100),
  .rst_n(rst_n*ennn),
 /* .s1(s1),
  .s2(s2),
  .s3(s3),*/
  .s4_ctl(s4_ctl),
  .s5_ctl(s5_ctl),
  .sound(sound1),
  .level(level1),
  .note_div(note_div1),
  .clk_in(clk_song),
  .out_LED(out1),
  .ctl(pause_ctl)
);

flashlight_sound_ctl U_flashlight(
  .clk(clk_100),
  .rst_n(rst_n*ennn),
  .s1(s1),
  .s2(s2),
  .s3(s3),
  .s4_ctl(s4_ctl),
  .s5_ctl(s5_ctl),
  .sound(sound2),
  .level(level2),
  .note_div(note_div2),
  .clk_in(clk_song),
  .out_LED(out2),
  .ctl(pause_ctl)
);

speaker U_speaker(
  .clk(clk),
  .rst_n(rst_n),
  .sound(sound),
  .note_div(note_div*ennn*pause_ctl),
  .audio_appsel(audio_appsel),
  .audio_sysclk(audio_sysclk),
  .audio_bck(audio_bck),
  .audio_ws(audio_ws),
  .audio_data(audio_data)
);


shiftreg_final U_reg_final(//final project
	.q0(q0_f),
	.q1(q1_f),
	.q2(q2_f),
	.q3(q3_f),// LED output
	.clk(clk_1_sec), // global clock
	.rst_n(rst_n), // active low reset
	.mode(mode)
);


shiftreg_1 U_reg1(//see you again
	.q0(q0_1_1),
	.q1(q1_1_1),
	.q2(q2_1_1),
	.q3(q3_1_1),// LED output
	.clk(clk_1_sec), // global clock
	.rst_n(rst_n*ennn), // active low reset
	.mode(mode)
);

shiftreg_1_2 U_reg1_2(//furious
	.q0(q0_1_2),
	.q1(q1_1_2),
	.q2(q2_1_2),
	.q3(q3_1_2),// LED output
	.clk(clk_1_sec), // global clock
	.rst_n(rst_n*ennn), // active low reset
	.mode(mode)
);

shiftreg_2 U_reg2(//flashlight
	.q0(q0_2_1),
	.q1(q1_2_1),
	.q2(q2_2_1),
	.q3(q3_2_1),// LED output
	.clk(clk_1_sec), // global clock
	.rst_n(rst_n*ennn), // active low reset
	.mode(mode)
);


shiftreg_2_2 U_reg2_2(//pitch perfect
	.q0(q0_2_2),
	.q1(q1_2_2),
	.q2(q2_2_2),
	.q3(q3_2_2),// LED output
	.clk(clk_1_sec), // global clock
	.rst_n(rst_n*ennn), // active low reset
	.mode(mode)
);

scan_ctl U_SC(
  .in0(q0),
  .in1(q1),
  .in2(q2),
  .in3(q3),
  .ftsd_ctl_en(ftsd_ctl_en),
  .ftsd_in(ftsd_in),
  .ftsd_ctl(ftsd_ctl)
);

display U_display(//song2 final project
  .display(display),
  .in(ftsd_in)
);

/*
decoder_song1 U_decoder(//song1
  .display(display),
  .in(ftsd_in1)
);*/

endmodule
