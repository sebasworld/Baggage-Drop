`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:20:19 11/09/2021 
// Design Name: 
// Module Name:    display_and_drop 
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
module display_and_drop (
    output [6 : 0]   seven_seg1, 
    output [6 : 0]   seven_seg2,
    output [6 : 0]   seven_seg3,
    output [6 : 0]   seven_seg4,
    output [0 : 0]   drop_activated,
    input    [15: 0]   t_act,
    input    [15: 0]   t_lim,
    input              drop_en);
	 
	 reg [6:0] seven_seg1_reg, seven_seg2_reg, seven_seg3_reg, seven_seg4_reg, drop_activated_reg;
	 
	 always @(*) begin
			if(t_act <= t_lim)
					if (drop_en == 0) begin 
						drop_activated_reg = 0;
						seven_seg1_reg = 7'b011_1001;				//COLD - t_act este sub t_lim, dar drop_en nu este indeplinita
						seven_seg2_reg = 7'b101_1100;
						seven_seg3_reg = 7'b011_1000;
						seven_seg4_reg = 7'b101_1110;
					end
					
					else begin
						drop_activated_reg = 1;
						seven_seg1_reg = 7'b101_1110;				//DROP - t_act este sub t_lim si drop_en este indeplinita
						seven_seg2_reg = 7'b101_0000;
						seven_seg3_reg = 7'b101_1100;
						seven_seg4_reg = 7'b111_0011;
					end
			
			else begin
					if (drop_en == 1) begin
						drop_activated_reg = 0; 
						seven_seg1_reg = 7'b000_0000;				//HOT - t_act este peste t_lim, chiar daca drop_en este indeplinita
						seven_seg2_reg = 7'b111_0110;
						seven_seg3_reg = 7'b101_1100;
						seven_seg4_reg = 7'b111_1000;
					end
			end
	end
	
	assign seven_seg1 = seven_seg1_reg;
	assign seven_seg2 = seven_seg2_reg;
	assign seven_seg3 = seven_seg3_reg;
	assign seven_seg4 = seven_seg4_reg;
	assign drop_activated = drop_activated_reg;
	
endmodule
