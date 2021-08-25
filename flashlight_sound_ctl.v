`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:32:59 06/13/2015 
// Design Name: 
// Module Name:    flashlight_sound_ctl 
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
`define Do_L 20'd152672
`define Re_L 20'd136054
`define Mi_L 20'd128617/////////////////////////
`define Fa_L 20'd114943//20'd114286
`define So_L 20'd102041
`define La_L 20'd90909
`define Si_L 20'd85837//////////////////
`define Do_M 20'd76628
`define Re_M 20'd68259
`define Mi_M 20'd60606//20'd64309////////////////////
`define Fa_M 20'd57307
`define So_M 20'd51020
`define La_M 20'd45455
`define Si_M 20'd42920///////////////////
`define Do_H 20'd38168
`define Re_H 20'd34014
`define Mi_H 20'd30303//20'd32154///////////////////
`define Fa_H 20'd28653
`define So_H 20'd25510
`define La_H 20'd22727
`define Si_H 20'd21459///////////////////
`define Do_HH 20'd19120
`define Re_HH 20'd17036

module flashlight_sound_ctl(
  clk,
  rst_n,
  s1,
  s2,
  s3,
  s4_ctl,
  s5_ctl,
  sound,
  level,
  note_div,
  clk_in,
  out_LED,
  ctl
);

input clk;
input rst_n;
input clk_in;
input s1, s2, s3;
input s4_ctl, s5_ctl;
input ctl;
output sound;
output [3:0] level;
output [19:0] note_div;
output [15:0]out_LED;

reg [15:0] sound;
reg [3:0] level, level_tmp;
reg [19:0] note_div;
reg [15:0] sound_level, sound_level_tmp;

reg [19:0]q1;
reg [19:0]q1_tmp;

reg [15:0]out_LED;



always @*
 if (q1==20'd0 ) //La
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
  else if (q1==20'd2 ) //Si
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
  else if (q1==20'd4 ) //Si
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
  else if (q1==20'd6 ) //Si
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1>=20'd8 && q1<=20'd15) //Me
  begin
    note_div = `Mi_M;
	 sound = sound_level;
  end
  /////////////////////////////
   else if (q1==20'd16 ) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q1==20'd18 ) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q1==20'd20 ) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1==20'd22 ) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1>=20'd24 && q1<=20'd31) //Fa
  begin
    note_div = `Mi_M;
	 sound = sound_level;
  end
  ////////////////////////////
   else if (q1==20'd32 ) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q1==20'd34 ) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q1==20'd36 ) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1==20'd38 ) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1>=20'd40 && q1<=20'd47) //Fa
  begin
    note_div = `Mi_M;
	 sound = sound_level;
  end
  ////////////////////////////////
   else if (q1==20'd48 ) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q1==20'd50 ) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q1==20'd52 ) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q1==20'd54) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1>=20'd56 && q1<=20'd59) //Fa
  begin
    note_div = `Mi_M;
	 sound = sound_level;
  end
   else if (q1>=20'd60 && q1<=20'd63) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
  /////////////////////////////////////
    else if (q1==20'd66 ) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1==20'd68 ) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1==20'd70) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1>=20'd72 && q1<=20'd75) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1>=20'd76 && q1<=20'd79) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   /////////////////////////////////////
    else if (q1==20'd82 ) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1==20'd84 ) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1==20'd86) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1>=20'd88 && q1<=20'd91) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1>=20'd92 && q1<=20'd95) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   /////////////////////////////////////
    else if (q1==20'd98 ) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1==20'd100 ) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1==20'd102) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1>=20'd104 && q1<=20'd107) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1>=20'd108 && q1<=20'd123) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
  /////////////////////////////////////
  ////////////////////////////////////////
  else if (q1==20'd126 ) //La
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
  else if (q1==20'd128 ) //Si
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
  else if (q1==20'd130 ) //Si
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
  else if (q1==20'd132 ) //Si
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1>=20'd134 && q1<=20'd141) //Me
  begin
    note_div = `Mi_M;
	 sound = sound_level;
  end
  /////////////////////////////
   else if (q1==20'd142 ) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q1==20'd144 ) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q1==20'd146) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1==20'd148) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1>=20'd150&& q1<=20'd157) //Fa
  begin
    note_div = `Mi_M;
	 sound = sound_level;
  end
  ////////////////////////////
   else if (q1==20'd158) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q1==20'd160) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q1==20'd162) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1==20'd164) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1>=20'd166&& q1<=20'd173) //Fa
  begin
    note_div = `Mi_M;
	 sound = sound_level;
  end
  ////////////////////////////////
   else if (q1==20'd174) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q1==20'd176) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q1==20'd178) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q1==20'd180) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1>=20'd182 && q1<=20'd185) //Fa
  begin
    note_div = `Mi_M;
	 sound = sound_level;
  end
   else if (q1>=20'd186&& q1<=20'd189) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
  /////////////////////////////////////
    else if (q1==20'd192) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1==20'd194) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1==20'd196) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1>=20'd198&& q1<=20'd201) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1>=20'd202&& q1<=20'd205) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   /////////////////////////////////////
    else if (q1==20'd208 ) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1==20'd210) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1==20'd212) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1>=20'd214&& q1<=20'd217) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1>=20'd218&& q1<=20'd221) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   /////////////////////////////////////
    else if (q1==20'd224) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1==20'd226) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1==20'd228) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1>=20'd230 && q1<=20'd233) //Fa
  begin
    note_div = `Do_H;
	 sound = sound_level;
  end
   else if (q1>=20'd234&& q1<=20'd249) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
////////////////////////////////////
 else if (q1==20'd252 ) //La
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
  else if (q1==20'd254 ) //Si
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
  else if (q1==20'd256 ) //Si
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
  else if (q1==20'd258 ) //Si
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
  else if (q1==20'd260 ) //Si
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1==20'd262 ) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1==20'd264 ) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1==20'd266) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1==20'd268) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1==20'd270) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
    else if (q1==20'd272 ) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1>=20'd274 && q1<=20'd279) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
  ////////////////////////////////////
 else if (q1==20'd282) //La
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
  else if (q1==20'd284) //Si
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
  else if (q1==20'd286) //Si
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
  else if (q1==20'd288) //Si
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
  else if (q1==20'd290) //Si
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1==20'd292) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q1==20'd294) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q1==20'd296) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q1==20'd298) //Fa
  begin
    note_div = `Si_M;
	 sound = sound_level;
  end
  else if (q1>=20'd300&& q1<=20'd301) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1>=20'd304&& q1<=20'd309) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
  //////////////////////////////////
  else if (q1==20'd312) //La
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
  else if (q1==20'd314) //Si
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
  else if (q1==20'd316) //Si
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
  else if (q1==20'd318) //Si
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
  else if (q1==20'd320) //Si
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1==20'd322) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1==20'd324) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1==20'd326) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1==20'd328) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
  else if (q1>=20'd330&& q1<=20'd331) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1>=20'd334&& q1<=20'd339) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
  /////////////////////////////////////
   else if (q1>=20'd342&& q1<=20'd343) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1>=20'd344&& q1<=20'd345) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1>=20'd346&& q1<=20'd349) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1>=20'd350&& q1<=20'd351) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1>=20'd352&& q1<=20'd353) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1>=20'd354&& q1<=20'd355) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1>=20'd358&& q1<=20'd359) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1>=20'd360&& q1<=20'd361) //Fa
  begin
    note_div = `Do_H;
	 sound = sound_level;
  end
   else if (q1>=20'd362&& q1<=20'd363) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1>=20'd364&& q1<=20'd365) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1>=20'd366&& q1<=20'd373) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
  ///////////////////////////////////
   else if (q1>=20'd374 && q1<=20'd375 ) //La
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1>=20'd378 && q1<=20'd379 ) //La
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1==20'd382) //La
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
  else if (q1==20'd384) //Si
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
  else if (q1==20'd386) //Si
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
  else if (q1==20'd388) //Si
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
  else if (q1==20'd390) //Si
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1==20'd392) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1==20'd394) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1==20'd396) //Fa
  begin
    note_div = `Si_M;
	 sound = sound_level;
  end
   else if (q1>=20'd398 && q1<=20'd403) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
  ///////////////////////////////////
   else if (q1>=20'd406&& q1<=20'd407) //La
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1>=20'd410&& q1<=20'd411) //La
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1==20'd414) //La
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
  else if (q1==20'd416) //Si
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
  else if (q1==20'd418) //Si
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
  else if (q1==20'd420) //Si
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
  else if (q1==20'd422) //Si
  begin
    note_div = `Si_M;
	 sound = sound_level;
  end
   else if (q1==20'd424) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1==20'd426) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1==20'd428) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1>=20'd430&& q1<=20'd435) //Fa
  begin
    note_div = `Re_M;
	 sound = sound_level;
  end
  //////////////////////////////
    else if (q1==20'd438) //La
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
  else if (q1==20'd440) //Si
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1==20'd442) //La
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
  else if (q1==20'd444) //Si
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1==20'd446) //La
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
  else if (q1==20'd448) //Si
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
  else if (q1==20'd450) //Si
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
  else if (q1==20'd452) //Si
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
  else if (q1==20'd454) //Si
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1>=20'd456 && q1<=20'd457) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1>=20'd460 && q1<=20'd465) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
  /////////////////////////////////////
   else if (q1>=20'd468&& q1<=20'd469) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1>=20'd470&& q1<=20'd471) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1>=20'd472 && q1<=20'd475) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1>=20'd476 && q1<=20'd477) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q1>=20'd478&& q1<=20'd479) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1>=20'd480&& q1<=20'd481) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1>=20'd484 && q1<=20'd485) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1>=20'd486 && q1<=20'd487) //Fa
  begin
    note_div = `Do_H;
	 sound = sound_level;
  end
   else if (q1>=20'd488 && q1<=20'd489) //Fa
  begin
    note_div = `La_M;
	 sound = sound_level;
  end
   else if (q1>=20'd490 && q1<=20'd491) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q1>=20'd492 && q1<=20'd515) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
  /////////////////////////////////////
  else
  begin
    note_div = 20'd90909;
	 sound = 16'h0000;
  end

 
always@*
	if(q1==20'd9999)
	begin
		q1_tmp=20'd0;
		//ctl=1'b1;
	end
	else if(ctl==1'b0)
		q1_tmp = q1;
	else
	begin
		q1_tmp = q1 + 20'd1;
		//ctl=1'b0;
	end
		
always@(posedge clk_in or negedge rst_n)
	if(~rst_n)
		q1<=20'd0;
	else 
		q1<=q1_tmp;


always @*
  if ((sound_level != 16'h7FF0) && (s4_ctl == 1'b1))
    sound_level_tmp = sound_level + 16'h07FF;
  else if ((sound_level != 16'h0000) && (s5_ctl == 1'b1))
    sound_level_tmp = sound_level - 16'h07FF;
  else if ((sound_level == 16'h7FF0) && (s4_ctl == 1'b1))
    sound_level_tmp = 16'h7FF0;
  else if ((sound_level == 16'h0000) && (s5_ctl == 1'b1))
    sound_level_tmp = 16'h0000;
  else
    sound_level_tmp = sound_level;

always @(posedge clk or negedge rst_n)
  if (~rst_n)
    sound_level <= 16'h07FF;
  else
    sound_level <= sound_level_tmp;

always @*
  if ((level != 4'd15) && (s4_ctl == 1'b1))
    level_tmp = level + 1'd1;
  else if ((level != 4'd0) && (s5_ctl == 1'b1))
    level_tmp = level - 1'd1;
  else if ((level == 4'd15) && (s4_ctl == 1'b1))
    level_tmp = 4'd15;
  else if ((sound == 4'd0) && (s5_ctl == 1'b1))
    level_tmp = 4'd0;
  else
    level_tmp = level;

always @(posedge clk or negedge rst_n)
  if (~rst_n)
    level <= 4'd1;
  else
    level <= level_tmp;

always@*
begin
	if(level==4'd0)
	begin
	out_LED[15]=1'b0;
	out_LED[14]=1'b0;
	out_LED[13]=1'b0;
	out_LED[12]=1'b0;
	out_LED[11]=1'b0;
	out_LED[10]=1'b0;
	out_LED[9]=1'b0;
	out_LED[8]=1'b0;
	out_LED[7]=1'b0;
	out_LED[6]=1'b0;
	out_LED[5]=1'b0;
	out_LED[4]=1'b0;
	out_LED[3]=1'b0;
	out_LED[2]=1'b0;
	out_LED[1]=1'b0;
	out_LED[0]=1'b0;
	end
	else if(level==4'd1)
	begin
	out_LED[15]=1'b1;
	out_LED[14]=1'b0;
	out_LED[13]=1'b0;
	out_LED[12]=1'b0;
	out_LED[11]=1'b0;
	out_LED[10]=1'b0;
	out_LED[9]=1'b0;
	out_LED[8]=1'b0;
	out_LED[7]=1'b0;
	out_LED[6]=1'b0;
	out_LED[5]=1'b0;
	out_LED[4]=1'b0;
	out_LED[3]=1'b0;
	out_LED[2]=1'b0;
	out_LED[1]=1'b0;
	out_LED[0]=1'b0;
	end
	else if(level==4'd2)
	begin
	out_LED[15]=1'b1;
	out_LED[14]=1'b1;
	out_LED[13]=1'b0;
	out_LED[12]=1'b0;
	out_LED[11]=1'b0;
	out_LED[10]=1'b0;
	out_LED[9]=1'b0;
	out_LED[8]=1'b0;
	out_LED[7]=1'b0;
	out_LED[6]=1'b0;
	out_LED[5]=1'b0;
	out_LED[4]=1'b0;
	out_LED[3]=1'b0;
	out_LED[2]=1'b0;
	out_LED[1]=1'b0;
	out_LED[0]=1'b0;
	end
	else if(level==4'd3)
	begin
	out_LED[15]=1'b1;
	out_LED[14]=1'b1;
	out_LED[13]=1'b1;
	out_LED[12]=1'b0;
	out_LED[11]=1'b0;
	out_LED[10]=1'b0;
	out_LED[9]=1'b0;
	out_LED[8]=1'b0;
	out_LED[7]=1'b0;
	out_LED[6]=1'b0;
	out_LED[5]=1'b0;
	out_LED[4]=1'b0;
	out_LED[3]=1'b0;
	out_LED[2]=1'b0;
	out_LED[1]=1'b0;
	out_LED[0]=1'b0;
	end
	else if(level==4'd4)
	begin
	out_LED[15]=1'b1;
	out_LED[14]=1'b1;
	out_LED[13]=1'b1;
	out_LED[12]=1'b1;
	out_LED[11]=1'b0;
	out_LED[10]=1'b0;
	out_LED[9]=1'b0;
	out_LED[8]=1'b0;
	out_LED[7]=1'b0;
	out_LED[6]=1'b0;
	out_LED[5]=1'b0;
	out_LED[4]=1'b0;
	out_LED[3]=1'b0;
	out_LED[2]=1'b0;
	out_LED[1]=1'b0;
	out_LED[0]=1'b0;
	end
	else if(level==4'd5)
	begin
	out_LED[15]=1'b1;
	out_LED[14]=1'b1;
	out_LED[13]=1'b1;
	out_LED[12]=1'b1;
	out_LED[11]=1'b1;
	out_LED[10]=1'b0;
	out_LED[9]=1'b0;
	out_LED[8]=1'b0;
	out_LED[7]=1'b0;
	out_LED[6]=1'b0;
	out_LED[5]=1'b0;
	out_LED[4]=1'b0;
	out_LED[3]=1'b0;
	out_LED[2]=1'b0;
	out_LED[1]=1'b0;
	out_LED[0]=1'b0;
	end
	else if(level==4'd6)
	begin
	out_LED[15]=1'b1;
	out_LED[14]=1'b1;
	out_LED[13]=1'b1;
	out_LED[12]=1'b1;
	out_LED[11]=1'b1;
	out_LED[10]=1'b1;
	out_LED[9]=1'b0;
	out_LED[8]=1'b0;
	out_LED[7]=1'b0;
	out_LED[6]=1'b0;
	out_LED[5]=1'b0;
	out_LED[4]=1'b0;
	out_LED[3]=1'b0;
	out_LED[2]=1'b0;
	out_LED[1]=1'b0;
	out_LED[0]=1'b0;
	end
	else if(level==4'd7)
	begin
	out_LED[15]=1'b1;
	out_LED[14]=1'b1;
	out_LED[13]=1'b1;
	out_LED[12]=1'b1;
	out_LED[11]=1'b1;
	out_LED[10]=1'b1;
	out_LED[9]=1'b1;
	out_LED[8]=1'b0;
	out_LED[7]=1'b0;
	out_LED[6]=1'b0;
	out_LED[5]=1'b0;
	out_LED[4]=1'b0;
	out_LED[3]=1'b0;
	out_LED[2]=1'b0;
	out_LED[1]=1'b0;
	out_LED[0]=1'b0;
	end
	else if(level==4'd8)
	begin
	out_LED[15]=1'b1;
	out_LED[14]=1'b1;
	out_LED[13]=1'b1;
	out_LED[12]=1'b1;
	out_LED[11]=1'b1;
	out_LED[10]=1'b1;
	out_LED[9]=1'b1;
	out_LED[8]=1'b1;
	out_LED[7]=1'b0;
	out_LED[6]=1'b0;
	out_LED[5]=1'b0;
	out_LED[4]=1'b0;
	out_LED[3]=1'b0;
	out_LED[2]=1'b0;
	out_LED[1]=1'b0;
	out_LED[0]=1'b0;
	end
	else if(level==4'd9)
	begin
	out_LED[15]=1'b1;
	out_LED[14]=1'b1;
	out_LED[13]=1'b1;
	out_LED[12]=1'b1;
	out_LED[11]=1'b1;
	out_LED[10]=1'b1;
	out_LED[9]=1'b1;
	out_LED[8]=1'b1;
	out_LED[7]=1'b1;
	out_LED[6]=1'b0;
	out_LED[5]=1'b0;
	out_LED[4]=1'b0;
	out_LED[3]=1'b0;
	out_LED[2]=1'b0;
	out_LED[1]=1'b0;
	out_LED[0]=1'b0;
	end
	else if(level==4'd10)
	begin
	out_LED[15]=1'b1;
	out_LED[14]=1'b1;
	out_LED[13]=1'b1;
	out_LED[12]=1'b1;
	out_LED[11]=1'b1;
	out_LED[10]=1'b1;
	out_LED[9]=1'b1;
	out_LED[8]=1'b1;
	out_LED[7]=1'b1;
	out_LED[6]=1'b1;
	out_LED[5]=1'b0;
	out_LED[4]=1'b0;
	out_LED[3]=1'b0;
	out_LED[2]=1'b0;
	out_LED[1]=1'b0;
	out_LED[0]=1'b0;
	end
	else if(level==4'd11)
	begin
	out_LED[15]=1'b1;
	out_LED[14]=1'b1;
	out_LED[13]=1'b1;
	out_LED[12]=1'b1;
	out_LED[11]=1'b1;
	out_LED[10]=1'b1;
	out_LED[9]=1'b1;
	out_LED[8]=1'b1;
	out_LED[7]=1'b1;
	out_LED[6]=1'b1;
	out_LED[5]=1'b1;
	out_LED[4]=1'b0;
	out_LED[3]=1'b0;
	out_LED[2]=1'b0;
	out_LED[1]=1'b0;
	out_LED[0]=1'b0;
	end
	else if(level==4'd12)
	begin
	out_LED[15]=1'b1;
	out_LED[14]=1'b1;
	out_LED[13]=1'b1;
	out_LED[12]=1'b1;
	out_LED[11]=1'b1;
	out_LED[10]=1'b1;
	out_LED[9]=1'b1;
	out_LED[8]=1'b1;
	out_LED[7]=1'b1;
	out_LED[6]=1'b1;
	out_LED[5]=1'b1;
	out_LED[4]=1'b1;
	out_LED[3]=1'b0;
	out_LED[2]=1'b0;
	out_LED[1]=1'b0;
	out_LED[0]=1'b0;
	end
	else if(level==4'd13)
	begin
	out_LED[15]=1'b1;
	out_LED[14]=1'b1;
	out_LED[13]=1'b1;
	out_LED[12]=1'b1;
	out_LED[11]=1'b1;
	out_LED[10]=1'b1;
	out_LED[9]=1'b1;
	out_LED[8]=1'b1;
	out_LED[7]=1'b1;
	out_LED[6]=1'b1;
	out_LED[5]=1'b1;
	out_LED[4]=1'b1;
	out_LED[3]=1'b1;
	out_LED[2]=1'b0;
	out_LED[1]=1'b0;
	out_LED[0]=1'b0;
	end
	else if(level==4'd14)
	begin
	out_LED[15]=1'b1;
	out_LED[14]=1'b1;
	out_LED[13]=1'b1;
	out_LED[12]=1'b1;
	out_LED[11]=1'b1;
	out_LED[10]=1'b1;
	out_LED[9]=1'b1;
	out_LED[8]=1'b1;
	out_LED[7]=1'b1;
	out_LED[6]=1'b1;
	out_LED[5]=1'b1;
	out_LED[4]=1'b1;
	out_LED[3]=1'b1;
	out_LED[2]=1'b1;
	out_LED[1]=1'b0;
	out_LED[0]=1'b0;
	end
	else if(level==4'd15)
	begin
	out_LED[15]=1'b1;
	out_LED[14]=1'b1;
	out_LED[13]=1'b1;
	out_LED[12]=1'b1;
	out_LED[11]=1'b1;
	out_LED[10]=1'b1;
	out_LED[9]=1'b1;
	out_LED[8]=1'b1;
	out_LED[7]=1'b1;
	out_LED[6]=1'b1;
	out_LED[5]=1'b1;
	out_LED[4]=1'b1;
	out_LED[3]=1'b1;
	out_LED[2]=1'b1;
	out_LED[1]=1'b1;
	out_LED[0]=1'b0;
	end
end

endmodule


