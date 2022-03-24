`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:18:53 11/09/2021 
// Design Name: 
// Module Name:    sensors_input 
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
module sensors_input (
   output 	[7 : 0]   height,
   input    [7 : 0]   sensor1,
   input    [7 : 0]   sensor2,
   input    [7 : 0]   sensor3,
   input    [7 : 0]   sensor4);
	
	reg [7:0] height_reg;
	reg [9:0] temp;
	
	always @(*) begin
			if (sensor1 == 0 || sensor3 == 0) begin
				temp = sensor2 + sensor4;
				if(temp[0] == 1) begin   // verific daca temp(suma) este impara si daca da, ii adaug 1 inainte de impartire pt aproximarea necesara
					height_reg = (temp + 1)/2;
				end
				else begin
					height_reg = (temp)/2;// daca temp este para, nu-i fac nimic
				end
			end 
			
			if (sensor2 == 0 || sensor4 == 0) begin
				temp = sensor1 + sensor3;
				if(temp[0] == 1) begin // acelasi rationament ca mai sus
					height_reg = (temp + 1)/2;
				end
				else begin
					height_reg = (temp)/2;
				end
			end
			
			if (sensor1 != 0 && sensor2 != 0 && sensor3 != 0 && sensor4 != 0) begin
				height_reg = (sensor1 + sensor2 + sensor3 + sensor4 + 2)/4; // pentru media intre 4 numere, la suma adaug 2 ca sa-mi aproximeze 
			end																				// corespunzator
			
	end

	assign height = height_reg;
	
endmodule
