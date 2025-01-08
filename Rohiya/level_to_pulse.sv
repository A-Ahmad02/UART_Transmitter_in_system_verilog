`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2023 12:09:35 PM
// Design Name: 
// Module Name: level_to_pulse
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


module level_to_pulse(output pulse,
                    input logic clk,rst, level
    );
wire Q;
D_FlipFlop DFF(.q(Q), .clk(clk) , .reset(rst), .enable(1'b1), .d(level));  
AND a1(pulse,~Q,level);
endmodule

