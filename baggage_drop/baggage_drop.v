`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:17:59 11/09/2021 
// Design Name: 
// Module Name:    baggage_drop 
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
module baggage_drop (
    output  [6 : 0]   seven_seg1, 
    output  [6 : 0]   seven_seg2,
    output  [6 : 0]   seven_seg3,
    output  [6 : 0]   seven_seg4,
    output  [0 : 0]   drop_activated,
    input    [7 : 0]   sensor1,
    input    [7 : 0]   sensor2,
    input    [7 : 0]   sensor3,
    input    [7 : 0]   sensor4,
    input    [15: 0]   t_lim,
    input              drop_en);
	  
	 wire [7:0] height;
	 sensors_input module1(
			.sensor1(sensor1),
			.sensor2(sensor2),
			.sensor3(sensor3),
			.sensor4(sensor4),
			.height(height)
			);
			
	 wire [15:0] out;
	 square_root module2(
			.in(height),
			.out(out)
			);
		
	 wire [15:0] t_act;
	 assign t_act = out/2; // formula timpului
		
	 display_and_drop module3(
			.seven_seg1(seven_seg1),
			.seven_seg2(seven_seg2),
			.seven_seg3(seven_seg3),
			.seven_seg4(seven_seg4),
			.t_lim(t_lim),
			.drop_en(drop_en),
			.drop_activated(drop_activated),
			.t_act(t_act)
			);

endmodule
