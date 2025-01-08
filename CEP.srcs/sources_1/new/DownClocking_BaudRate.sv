`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 05:15:32 PM
// Design Name: 
// Module Name: DownClocking_BaudRate
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DownClocking_BaudRate(input clock_in, rst,
                        output reg clock_out
    );
	
	logic [12:0]  cnt;
	always_ff @ (posedge clock_in or posedge rst)
	begin
	 if (rst) begin
		cnt <= 0;
		clock_out <= 0;
		end
    else if (cnt == 5208)begin 
          cnt <= 0;
          clock_out <= ~clock_out;
        end
	 else 
		cnt <= cnt+1;
	end
	
//	always_comb begin
//		if (cnt >= 10)
//		      clock_out = 1;
//		else
//		      clock_out = 0;
//    end
	
endmodule
