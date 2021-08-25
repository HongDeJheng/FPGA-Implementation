`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:02:08 05/30/2012 
// Design Name: 
// Module Name:    lcd_display 
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
module lcd_display(
  clk, // system clock
  rst_n, // active low reset
  data_request,
  data_ack,
  lcd_rst, // LCD reset
  lcd_cs, // LCD frame selection
  lcd_rw, // LCD read/write control
  lcd_di, // LCD data/instruction
  lcd_d, // LCD data
  lcd_e, // LCD enable
  in,
  in2,
  in3,
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
  row_n
);

input clk; // system clock
input rst_n; // active low reset
input in;
input in2;
input in3;

output lcd_rst; // LCD reset
output [1:0] lcd_cs; // LCD frame selection
output lcd_rw; // LCD read/write control
output lcd_di; // LCD data/instruction
output [7:0] lcd_d; // LCD data
output lcd_e; // LCD enable

wire ctl;
wire en;
wire clk_1_sec;
wire clk_50k; // Divided 50k clock
//wire data_ack; //data re-arrangement buffer ready indicator
output data_ack; //data re-arrangement buffer ready indicator
wire [7:0] data; // byte data transfer from buffer
wire [6:0] addr; // Address for each picture
//wire data_request; // request for the memory data
output data_request; // request for the memory data




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

wire pressed;
wire [3:0]key;
wire pause_ctl;
wire menu_ctl;

lab09_2 U_sound_top(
  .clk(clk),
  .rst_n(rst_n),
  .mode(mode),
  .s1(s1),
  .s2(s2),
  .s3(s3),
  .s4(s4),
  .s5(s5),
  .audio_appsel(audio_appsel), 
  .audio_sysclk(audio_sysclk), 
  .audio_bck(audio_bck),
  .audio_ws(audio_ws),
  .audio_data(audio_data),
  .display(display),
  .ftsd_ctl(ftsd_ctl),
  .out(out),
  .col_n(col_n), // pressed column index
  .row_n(row_n),  // scanned row index
  .pause_ctl(pause_ctl),
  .menu_ctl(menu_ctl),
  .key(key),
  .pressed(pressed)
);

lcd_ctrl U_LCDctrl(
  .clk(clk_50k), // LCD controller clock
  .rst_n(rst_n), // active low reset
  .data_ack(data_ack), // data re-arrangement buffer ready indicator
  .data(data), // byte data transfer from buffer
  .lcd_di(lcd_di), // LCD data/instruction 
  .lcd_rw(lcd_rw), // LCD Read/Write
  .lcd_en(lcd_e), // LCD enable
  .lcd_rst(lcd_rst), // LCD reset
  .lcd_cs(lcd_cs), // LCD frame select
  .lcd_data(lcd_d), // LCD data
  .addr(addr), // Address for each picture
  .data_request(data_request), // request for the memory data
  .clk_in(clk_1_sec),
  .in(in),
  .in2(menu_ctl),
  .in3(pause_ctl),
  .key(key),
  .pressed(pressed)
);

rom_ctrl U_romctrl(
  .clk(clk_50k), // rom controller clock
  .rst_n(rst_n), // active low reset
  .en(lcd_e), // LCD enable
  .data_request(data_request), // request signal from LCD
  .address(addr), // requested address
  .data_ack(data_ack), // data ready acknowledge
  .data(data) // data to be transferred (byte)
);

clock_divider #(
    .half_cycle(400),
    .counter_width(9)
  ) clk50k (
    .rst_n(rst_n),
    .clk(clk),
    .clk_div(clk_50k)
  );

endmodule
