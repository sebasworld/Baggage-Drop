`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:19:09 11/09/2021 
// Design Name: 
// Module Name:    square_root 
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
module square_root (
    output [15:0] out,
    input  [7:0] in );
	 
	 reg [7:0] i;
	 reg [15:0] y, b;
	 reg [31:0] in_reg;
	 
	 always @(*) begin
			b = 4096; // baza initiala este de 2^12
			y = 0;
			in_reg = in * 65536; // inmultesc in-ul cu 2^16 pentru shiftarea la stanga
			for (i=0; i<=14; i=i+1) begin
					y = y + b; // insumez cu baza 
					if((y * y) > in_reg) begin
						y = y - b; // scad baza la loc daca este depasit in_reg
					end
					b = b/2; // shiftez baza la dreapta cu 1
			end
	 end
	 assign out = y;
	 
endmodule
