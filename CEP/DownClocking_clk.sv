`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 05:13:11 PM
// Design Name: 
// Module Name: DownClocking_100
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


module DownClocking_clk(input clock_in, rst,
                        output reg clock_out
    );
	
	logic [10:0] d, cnt;
	always_ff @ (posedge clock_in or posedge rst)
	begin
	 if (rst)
		cnt <= 0;
	 else 
		cnt <= d;
	end
	
	always_comb begin
		if (cnt == 'd1042)
		  d = 1'd0;
		else
		  d = cnt+1;
    end
		
	always_ff @ (posedge clock_in or posedge rst) begin
	 if (rst)
		     clock_out <= 0;
		else if (cnt == 'd521)
		     clock_out <= ~clock_out;
    end
	
endmodule

//    always@(posedge clk or posedge rst)
//    begin
//    if(rst)
//        cnt <= 'd0;
//     else 
//        cnt <= cnt + 1;
//    end
    
//endmodule
