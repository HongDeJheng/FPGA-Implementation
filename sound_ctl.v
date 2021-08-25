`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:34:21 05/04/2014 
// Design Name: 
// Module Name:    sound_ctl 
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

module sound_ctl(//see you again
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
output [15:0]sound;
output [3:0] level;
output [19:0] note_div;
output [15:0]out_LED;

reg [15:0] sound;
reg [3:0] level, level_tmp;
reg [19:0] note_div;
reg [15:0] sound_level, sound_level_tmp;

reg [19:0]q;
reg [19:0]q_tmp;

reg [15:0]out_LED;

//////////////////////see you again//////////////////////////////
always @*
 if (q>=20'd0 && q<=20'd3) //La
  begin
    note_div = `Fa_H;
	 sound = sound_level;
  end
  else if (q>=20'd4 && q<=20'd7) //Si
  begin
    note_div = `Do_HH;
	 sound = sound_level;
  end
  else if (q>=20'd8 && q<=20'd11) //Do
  begin
    note_div = `Si_H;
	 sound = sound_level;
  end
   else if (q>=20'd12 && q<=20'd19) //Re
  begin
    note_div = `Re_H;
	 sound = sound_level;
  end
   else if (q>=20'd20 && q<=20'd21) //Me
  begin
    note_div = `Si_H;
	 sound = sound_level;
  end
   else if (q>=20'd22 && q<=20'd23) //Fa
  begin
    note_div = `Do_HH;
	 sound = sound_level;
  end
   else if (q>=20'd24 && q<=20'd25) //Fa
  begin
    note_div = `Re_HH;
	 sound = sound_level;
  end
   else if (q>=20'd26 && q<=20'd27) //Fa
  begin
    note_div = `Do_HH;
	 sound = sound_level;
  end
   else if (q>=20'd28 && q<=20'd29) //Fa
  begin
    note_div = `Si_H;
	 sound = sound_level;
  end
   else if (q>=20'd30 && q<=20'd31) //Fa
  begin
    note_div = `Do_HH;
	 sound = sound_level;
  end
  ////////////////////////////////
   else if (q>=20'd32 && q<=20'd35) //Fa
  begin
    note_div = `Fa_H;
	 sound = sound_level;
  end
   else if (q>=20'd36 && q<=20'd39) //Fa
  begin
    note_div = `Do_HH;
	 sound = sound_level;
  end
   else if (q>=20'd40 && q<=20'd43) //Fa
  begin
    note_div = `Si_H;
	 sound = sound_level;
  end
   else if (q>=20'd44 && q<=20'd51) //Fa
  begin
    note_div =  `Re_H;
	 sound = sound_level;
  end
   else if (q>=20'd52 && q<=20'd53) //Fa
  begin
    note_div = `Si_H;
	 sound = sound_level;
  end
   else if (q>=20'd54 && q<=20'd55) //Fa
  begin
    note_div = `Do_HH;
	 sound = sound_level;
  end
   else if (q>=20'd56 && q<=20'd57) //Fa
  begin
    note_div = `Re_HH;
	 sound = sound_level;
  end
   else if (q>=20'd58 && q<=20'd59) //Fa
  begin
    note_div = `Do_HH;
	 sound = sound_level;
  end
   else if (q>=20'd60 && q<=20'd61) //Fa
  begin
    note_div = `Si_H;
	 sound = sound_level;
  end
   else if (q>=20'd62 && q<=20'd63) //Fa
  begin
    note_div = `Do_HH;
	 sound = sound_level;
  end
 /////////////////////////////////////////////////////////////////////////////////////////
   else if (q>=20'd64 && q<=20'd67) //Fa
  begin
    note_div = `Fa_H;
	 sound = sound_level;
  end
   else if (q>=20'd68 && q<=20'd71) //Fa
  begin
    note_div = `Do_HH;
	 sound = sound_level;
  end
   else if (q>=20'd72 && q<=20'd75) //Fa
  begin
    note_div = `Si_H;
	 sound = sound_level;
  end
   else if (q>=20'd76 && q<=20'd83) //Fa
  begin
    note_div =  `Re_H;
	 sound = sound_level;
  end
   else if (q>=20'd84 && q<=20'd85) //Fa
  begin
    note_div = `Si_H;
	 sound = sound_level;
  end
   else if (q>=20'd86 && q<=20'd87) //Fa
  begin
    note_div = `Do_HH;
	 sound = sound_level;
  end
   else if (q>=20'd88 && q<=20'd89) //Fa
  begin
    note_div = `Re_HH;
	 sound = sound_level;
  end
   else if (q>=20'd90 && q<=20'd91) //Fa
  begin
    note_div = `Do_HH;
	 sound = sound_level;
  end
   else if (q>=20'd92 && q<=20'd93) //Fa
  begin
    note_div = `Si_H;
	 sound = sound_level;
  end
   else if (q>=20'd94 && q<=20'd95) //Fa
  begin
    note_div = `Do_HH;
	 sound = sound_level;
  end
 ///////////////////////////////////////////
   else if (q>=20'd96 && q<=20'd99) //Fa
  begin
    note_div = `Fa_H;
	 sound = sound_level;
  end
   else if (q>=20'd100 && q<=20'd103) //Fa
  begin
    note_div = `Do_HH;
	 sound = sound_level;
  end
   else if (q>=20'd104 && q<=20'd107) //Fa
  begin
    note_div = `Si_H;
	 sound = sound_level;
  end
   else if (q>=20'd108 && q<=20'd115) //Fa
  begin
    note_div =  `Re_H;
	 sound = sound_level;
  end
  ///////////////////////////////////////////////
   else if (q>=20'd116 && q<=20'd119) //Fa
  begin
    note_div = `Si_L;
	 sound = sound_level;
  end
   else if (q>=20'd120 && q<=20'd123) //Fa
  begin
    note_div = `Re_M;
	 sound = sound_level;
  end
   else if (q>=20'd124 && q<=20'd127) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q>=20'd128 && q<=20'd141) //Fa
  begin
    note_div =  `So_M;
	 sound = sound_level;
  end
   else if (q>=20'd142 && q<=20'd157) //Fa
  begin
    note_div =  `Fa_M;
	 sound = sound_level;
  end
   else if (q>=20'd158 && q<=20'd159) //Fa
  begin
    note_div = `Si_L;
	 sound = sound_level;
  end
   else if (q>=20'd160 && q<=20'd161) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q>=20'd164 && q<=20'd165) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q>=20'd168 && q<=20'd169) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
   else if (q>=20'd170 && q<=20'd171) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
   else if (q>=20'd172 && q<=20'd179) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
  /////////////////////////////////////////////////////////
   else if (q>=20'd188 && q<=20'd189) //Fa
  begin
    note_div = `Re_M;
	 sound = sound_level;
  end
   else if (q>=20'd190 && q<=20'd191) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q>=20'd192 && q<=20'd195) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q>=20'd196 && q<=20'd199) //Fa
  begin
    note_div =  `La_M;
	 sound = sound_level;
  end
   else if (q>=20'd200 && q<=20'd203) //Fa
  begin
    note_div =  `So_M;
	 sound = sound_level;
  end
   else if (q>=20'd204 && q<=20'd207) //Fa
  begin
    note_div =  `Fa_M;
	 sound = sound_level;
  end
   else if (q>=20'd208 && q<=20'd211) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
   else if (q>=20'd212 && q<=20'd213) //Fa
  begin
    note_div =  `Do_M;
	 sound = sound_level;
  end
   else if (q>=20'd216 && q<=20'd219) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q>=20'd220 && q<=20'd223) //Fa
  begin
    note_div = `Si_L;
	 sound = sound_level;
  end
   else if (q>=20'd224 && q<=20'd225) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q>=20'd228 && q<=20'd229) //Fa
  begin
    note_div =  `Do_M;
	 sound = sound_level;
  end
   else if (q>=20'd232 && q<=20'd235) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
   else if (q>=20'd236 && q<=20'd251) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  ///////////////////////////////////////////////////////////////////////////////
   else if (q>=20'd252 && q<=20'd253) //Fa
  begin
    note_div = `Re_M;
	 sound = sound_level;
  end
   else if (q>=20'd254 && q<=20'd255) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q>=20'd256 && q<=20'd269) //Fa
  begin
    note_div =  `So_M;
	 sound = sound_level;
  end
   else if (q>=20'd270 && q<=20'd285) //Fa
  begin
    note_div =  `Fa_M;
	 sound = sound_level;
  end
   else if (q>=20'd286 && q<=20'd287) //Fa
  begin
    note_div = `Si_L;
	 sound = sound_level;
  end
   else if (q>=20'd288 && q<=20'd289) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q>=20'd292 && q<=20'd293) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q>=20'd296 && q<=20'd299) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
   else if (q>=20'd300 && q<=20'd309) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
  /////////////////////////////////////////////////////////
   else if (q>=20'd312&& q<=20'd313) //Fa
  begin
    note_div = `Re_M;
	 sound = sound_level;
  end
   else if (q>=20'd314&& q<=20'd315) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q>=20'd316&& q<=20'd319) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q>=20'd320&& q<=20'd323) //Fa
  begin
    note_div =  `Si_M;
	 sound = sound_level;
  end
   else if (q>=20'd324&& q<=20'd327) //Fa
  begin
    note_div =  `Do_H;
	 sound = sound_level;
  end
   else if (q>=20'd328&& q<=20'd331) //Fa
  begin
    note_div =  `Re_H;
	 sound = sound_level;
  end
   else if (q>=20'd332&& q<=20'd335) //Fa
  begin
    note_div =  `Do_H;
	 sound = sound_level;
  end
   else if (q>=20'd336&& q<=20'd339) //Fa
  begin
    note_div =  `Si_M;
	 sound = sound_level;
  end
   else if (q>=20'd340 && q<=20'd343) //Fa
  begin
    note_div =  `So_M;
	 sound = sound_level;
  end
   else if (q>=20'd344&& q<=20'd347) //Fa
  begin
    note_div = `Si_M;
	 sound = sound_level;
  end
   else if (q>=20'd348&& q<=20'd349) //Fa
  begin
    note_div = `Do_H;
	 sound = sound_level;
  end
   else if (q>=20'd352&& q<=20'd353) //Fa
  begin
    note_div = `Do_H;
	 sound = sound_level;
  end
   else if (q>=20'd356&& q<=20'd357) //Fa
  begin
    note_div =  `Si_M;
	 sound = sound_level;
  end
   else if (q>=20'd360&& q<=20'd371) //Fa
  begin
    note_div =  `Si_M;
	 sound = sound_level;
  end
  /////////////////////////////////////////////////////////////////////
  else if (q>=20'd372&& q<=20'd375) //Fa
  begin
    note_div =  `So_M;
	 sound = sound_level;
  end
   else if (q>=20'd376&& q<=20'd379) //Fa
  begin
    note_div = `Si_M;
	 sound = sound_level;
  end
   else if (q>=20'd380&& q<=20'd381) //Fa
  begin
    note_div = `Do_H;
	 sound = sound_level;
  end
   else if (q>=20'd384&& q<=20'd385) //Fa
  begin
    note_div = `Do_H;
	 sound = sound_level;
  end
   else if (q>=20'd388&& q<=20'd389) //Fa
  begin
    note_div =  `Si_M;
	 sound = sound_level;
  end
   else if (q>=20'd392&& q<=20'd411) //Fa
  begin
    note_div =  `Si_M;
	 sound = sound_level;
  end
  ////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////
  else if (q>=20'd412 && q<=20'd417) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
  else if (q>=20'd418 && q<=20'd419) //Fa
  begin
    note_div =  `Do_M;
	 sound = sound_level;
  end
  else if (q>=20'd420&& q<=20'd425) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
  else if (q>=20'd426&& q<=20'd427) //Fa
  begin
    note_div =  `Do_M;
	 sound = sound_level;
  end
  else if (q>=20'd428&& q<=20'd433) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
  else if (q>=20'd434&& q<=20'd435) //Fa
  begin
    note_div =  `Do_M;
	 sound = sound_level;
  end
  else if (q>=20'd436&& q<=20'd437) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
  else if (q>=20'd438&& q<=20'd439) //Fa
  begin
    note_div =  `Fa_M;
	 sound = sound_level;
  end
  else if (q>=20'd440&& q<=20'd441) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
  else if (q>=20'd442&& q<=20'd443) //Fa
  begin
    note_div =  `Do_M;
	 sound = sound_level;
  end
  else if (q>=20'd444&& q<=20'd449) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q>=20'd450&& q<=20'd451) //Fa
  begin
    note_div =  `So_L;
	 sound = sound_level;
  end
  else if (q>=20'd452&& q<=20'd457) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q>=20'd458&& q<=20'd459) //Fa
  begin
    note_div =  `Do_M;
	 sound = sound_level;
  end
  else if (q>=20'd460&& q<=20'd469) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
  /////////////////////////////////////////////////
  else if (q>=20'd470&& q<=20'd471) //Fa
  begin
    note_div =  `So_L;
	 sound = sound_level;
  end
  else if (q>=20'd472&& q<=20'd473) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q>=20'd474&& q<=20'd475) //Fa
  begin
    note_div =  `So_L;
	 sound = sound_level;
  end
  else if (q>=20'd476&& q<=20'd479) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q>=20'd480&& q<=20'd481) //Fa
  begin
    note_div =  `So_L;
	 sound = sound_level;
  end
  else if (q>=20'd482&& q<=20'd487) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q>=20'd488&& q<=20'd489) //Fa
  begin
    note_div =  `Do_M;
	 sound = sound_level;
  end
  else if (q>=20'd490&& q<=20'd499) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
  /////////////////////////////////////////
   else if (q>=20'd500&& q<=20'd501) //Fa
  begin
    note_div =  `So_L;
	 sound = sound_level;
  end
  else if (q>=20'd502&& q<=20'd503) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q>=20'd504&& q<=20'd505) //Fa
  begin
    note_div =  `So_L;
	 sound = sound_level;
  end
  else if (q>=20'd506&& q<=20'd509) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q>=20'd510&& q<=20'd511) //Fa
  begin
    note_div =  `So_L;
	 sound = sound_level;
  end
  else if (q>=20'd512&& q<=20'd517) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q>=20'd518&& q<=20'd519) //Fa
  begin
    note_div =  `Do_M;
	 sound = sound_level;
  end
  else if (q>=20'd520&& q<=20'd535) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  /////////////////////////////////////////
  /////////////////////////////////////
   else if (q>=20'd536&& q<=20'd541 ) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
  else if (q>=20'd542&& q<=20'd543) //Fa
  begin
    note_div =  `Do_M;
	 sound = sound_level;
  end
  else if (q>=20'd544&& q<=20'd549) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
  else if (q>=20'd550&& q<=20'd551) //Fa
  begin
    note_div =  `Do_M;
	 sound = sound_level;
  end
  else if (q>=20'd552&& q<=20'd557) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
  else if (q>=20'd558&& q<=20'd559) //Fa
  begin
    note_div =  `Do_M;
	 sound = sound_level;
  end
  else if (q>=20'd560&& q<=20'd561) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
  else if (q>=20'd562&& q<=20'd563) //Fa
  begin
    note_div =  `Fa_M;
	 sound = sound_level;
  end
  else if (q>=20'd564&& q<=20'd565) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
  else if (q>=20'd566&& q<=20'd567) //Fa
  begin
    note_div =  `Do_M;
	 sound = sound_level;
  end
  else if (q>=20'd568&& q<=20'd573) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q>=20'd574&& q<=20'd575) //Fa
  begin
    note_div =  `So_L;
	 sound = sound_level;
  end
  else if (q>=20'd576&& q<=20'd581) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q>=20'd582&& q<=20'd583) //Fa
  begin
    note_div =  `Do_M;
	 sound = sound_level;
  end
  else if (q>=20'd584&& q<=20'd593) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
  /////////////////////////////////////////////////
  else if (q>=20'd594&& q<=20'd595) //Fa
  begin
    note_div =  `So_L;
	 sound = sound_level;
  end
  else if (q>=20'd596&& q<=20'd597) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q>=20'd598&& q<=20'd599) //Fa
  begin
    note_div =  `So_L;
	 sound = sound_level;
  end
  else if (q>=20'd600&& q<=20'd603) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q>=20'd604&& q<=20'd605) //Fa
  begin
    note_div =  `So_L;
	 sound = sound_level;
  end
  else if (q>=20'd606&& q<=20'd611) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q>=20'd612&& q<=20'd613) //Fa
  begin
    note_div =  `Do_M;
	 sound = sound_level;
  end
  else if (q>=20'd614&& q<=20'd623) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
  /////////////////////////////////////////
   else if (q>=20'd624&& q<=20'd625) //Fa
  begin
    note_div =  `So_L;
	 sound = sound_level;
  end
  else if (q>=20'd626&& q<=20'd627) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q>=20'd628&& q<=20'd629) //Fa
  begin
    note_div =  `So_L;
	 sound = sound_level;
  end
  else if (q>=20'd630&& q<=20'd633) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q>=20'd634&& q<=20'd635) //Fa
  begin
    note_div =  `So_L;
	 sound = sound_level;
  end
  else if (q>=20'd636&& q<=20'd641) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q>=20'd642&& q<=20'd643) //Fa
  begin
    note_div =  `Do_M;
	 sound = sound_level;
  end
  else if (q>=20'd644&& q<=20'd659) //Fa//660~683
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  /////////////////////////////////////////
  ////////////////////////////////////////
  else if (q==20'd684) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd686) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd688) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
   else if (q>=20'd690 && q<=20'd693 ) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
  else if (q==20'd694) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd696) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd698) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd700) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd702) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd704) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd706) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd708) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd710) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd712) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd714) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q>=20'd716 && q<=20'd721 ) //Fa
  begin
    note_div =  `So_L;
	 sound = sound_level;
  end
  /////////////////////////////////////
  else if (q==20'd722) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
  else if (q==20'd724) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd726) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd728) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd730) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd732) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd734) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd736) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd738) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd740) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd742) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd744) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd746) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q>=20'd748 && q<=20'd751 ) //Fa
  begin
    note_div =  `So_L;
	 sound = sound_level;
  end
  //////////////////////////////////////////////////
  else if (q==20'd754) //Fa
  begin
    note_div =  `So_L;
	 sound = sound_level;
  end
   else if (q==20'd756) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
  else if (q==20'd758) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd760) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd762) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd764) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd766) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd768) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd770) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  else if (q==20'd772) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
   else if (q>=20'd774&& q<=20'd777) //Fa
  begin
    note_div = `Si_L;
	 sound = sound_level;
  end
   else if (q>=20'd778&& q<=20'd781) //Fa
  begin
    note_div = `Re_M;
	 sound = sound_level;
  end
   else if (q>=20'd782&& q<=20'd785) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
  ////////////////////////////////////////////////////
  //////////////////////////////////////////////////
  //////////////////////////////////////////////////////
 
   else if (q>=20'd786&& q<=20'd799) //Fa
  begin
    note_div =  `So_M;
	 sound = sound_level;
  end
   else if (q>=20'd800 && q<=20'd815) //Fa
  begin
    note_div =  `Fa_M;
	 sound = sound_level;
  end
   else if (q>=20'd816&& q<=20'd817) //Fa
  begin
    note_div = `Si_L;
	 sound = sound_level;
  end
   else if (q>=20'd818&& q<=20'd819) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q>=20'd822&& q<=20'd823) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q>=20'd826&& q<=20'd827) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
   else if (q>=20'd828&& q<=20'd829) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
   else if (q>=20'd830&& q<=20'd837) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
  /////////////////////////////////////////////////////////
   else if (q>=20'd846&& q<=20'd847) //Fa
  begin
    note_div = `Re_M;
	 sound = sound_level;
  end
   else if (q>=20'd848&& q<=20'd849) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q>=20'd850&& q<=20'd853) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q>=20'd854&& q<=20'd857) //Fa
  begin
    note_div =  `La_M;
	 sound = sound_level;
  end
   else if (q>=20'd858&& q<=20'd861) //Fa
  begin
    note_div =  `So_M;
	 sound = sound_level;
  end
   else if (q>=20'd862&& q<=20'd865) //Fa
  begin
    note_div =  `Fa_M;
	 sound = sound_level;
  end
   else if (q>=20'd866&& q<=20'd869) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
   else if (q>=20'd870&& q<=20'd871) //Fa
  begin
    note_div =  `Do_M;
	 sound = sound_level;
  end
   else if (q>=20'd874&& q<=20'd877) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q>=20'd878&& q<=20'd881) //Fa
  begin
    note_div = `Si_L;
	 sound = sound_level;
  end
   else if (q>=20'd882&& q<=20'd883) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q>=20'd886&& q<=20'd887) //Fa
  begin
    note_div =  `Do_M;
	 sound = sound_level;
  end
   else if (q>=20'd890&& q<=20'd893) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
   else if (q>=20'd894&& q<=20'd909) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
  ///////////////////////////////////////////////////////////////////////////////
   else if (q>=20'd910&& q<=20'd911) //Fa
  begin
    note_div = `Re_M;
	 sound = sound_level;
  end
   else if (q>=20'd912&& q<=20'd913) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q>=20'd914&& q<=20'd927) //Fa
  begin
    note_div =  `So_M;
	 sound = sound_level;
  end
   else if (q>=20'd928&& q<=20'd943) //Fa
  begin
    note_div =  `Fa_M;
	 sound = sound_level;
  end
   else if (q>=20'd944&& q<=20'd945) //Fa
  begin
    note_div = `Si_L;
	 sound = sound_level;
  end
   else if (q>=20'd946&& q<=20'd947) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q>=20'd950&& q<=20'd951) //Fa
  begin
    note_div = `Do_M;
	 sound = sound_level;
  end
   else if (q>=20'd954&& q<=20'd957) //Fa
  begin
    note_div =  `Si_L;
	 sound = sound_level;
  end
   else if (q>=20'd958&& q<=20'd967) //Fa
  begin
    note_div =  `Re_M;
	 sound = sound_level;
  end
  /////////////////////////////////////////////////////////
   else if (q>=20'd970&& q<=20'd971) //Fa
  begin
    note_div = `Re_M;
	 sound = sound_level;
  end
   else if (q>=20'd972&& q<=20'd973) //Fa
  begin
    note_div = `Fa_M;
	 sound = sound_level;
  end
   else if (q>=20'd974&& q<=20'd977) //Fa
  begin
    note_div = `So_M;
	 sound = sound_level;
  end
   else if (q>=20'd978&& q<=20'd981) //Fa
  begin
    note_div =  `Si_M;
	 sound = sound_level;
  end
   else if (q>=20'd982&& q<=20'd985) //Fa
  begin
    note_div =  `Do_H;
	 sound = sound_level;
  end
   else if (q>=20'd986&& q<=20'd989) //Fa
  begin
    note_div =  `Re_H;
	 sound = sound_level;
  end
   else if (q>=20'd990&& q<=20'd993) //Fa
  begin
    note_div =  `Do_H;
	 sound = sound_level;
  end
   else if (q>=20'd994&& q<=20'd997) //Fa
  begin
    note_div =  `Si_M;
	 sound = sound_level;
  end
   else if (q>=20'd998&& q<=20'd1001) //Fa
  begin
    note_div =  `So_M;
	 sound = sound_level;
  end
   else if (q>=20'd1002&& q<=20'd1005) //Fa
  begin
    note_div = `Si_M;
	 sound = sound_level;
  end
   else if (q>=20'd1006&& q<=20'd1007) //Fa
  begin
    note_div = `Do_H;
	 sound = sound_level;
  end
   else if (q>=20'd1010&& q<=20'd1011) //Fa
  begin
    note_div = `Do_H;
	 sound = sound_level;
  end
   else if (q>=20'd1014&& q<=20'd1015) //Fa
  begin
    note_div =  `Si_M;
	 sound = sound_level;
  end
   else if (q>=20'd1018&& q<=20'd1029)  //Fa
  begin
    note_div =  `Si_M;
	 sound = sound_level;
  end
  /////////////////////////////////////////////////////////////////////
  else if (q>=20'd1030&& q<=20'd1033) //Fa
  begin
    note_div =  `So_M;
	 sound = sound_level;
  end
   else if (q>=20'd1034&& q<=20'd1037) //Fa
  begin
    note_div = `Si_M;
	 sound = sound_level;
  end
   else if (q>=20'd1038&& q<=20'd1039) //Fa
  begin
    note_div = `Do_H;
	 sound = sound_level;
  end
   else if (q>=20'd1042&& q<=20'd1043) //Fa
  begin
    note_div = `Do_H;
	 sound = sound_level;
  end
   else if (q>=20'd1046&& q<=20'd1047) //Fa
  begin
    note_div =  `Si_M;
	 sound = sound_level;
  end
   else if (q>=20'd1050&& q<=20'd1069) //Fa
  begin
    note_div =  `Si_M;
	 sound = sound_level;
  end
  /////////////////////////////////////////////////////////////////
  else
  begin
    note_div = 20'd90909;
	 sound = 16'h0000;
  end
   
 
always@*
	if(q==20'd9999)
	begin
		q_tmp=20'd0;
		//ctl=1'b1;
	end
	else if(ctl==1'b0)
		q_tmp = q;
	else
	begin
		q_tmp = q + 20'd1;
		//ctl=1'b0;
	end
		
always@(posedge clk_in or negedge rst_n)
	if(~rst_n)
		q<=20'd0;
	else 
		q<=q_tmp;


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
