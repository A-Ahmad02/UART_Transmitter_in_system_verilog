`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 04:54:29 PM
// Design Name: 
// Module Name: Datapath
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


module Datapath(input logic [7:0] data,
                input logic write, clk, rst, baud, shift_en,
                output logic s_out
                );
logic pls, mux_trans;
logic shift;

Edge_to_Pulse Et(.pulse(pls), .clk(clk), .rst(rst), .level(baud));
MUX2x1 M1(.sel1(shift_en), .in0(1'b0), .in1(pls),  .out(shift));  

ShiftReg_10bit Sr(.out(mux_trans), .data({1'b1,data,1'b0}), .clk(clk), .rst(rst), .en(shift | write), .sel(shift)); 
MUX2x1 M2(.sel1(shift_en), .in0(1'b1), .in1(mux_trans),  .out(s_out));  
                
endmodule
