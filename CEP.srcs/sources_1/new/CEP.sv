`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 08:27:25 AM
// Design Name: 
// Module Name: CEP
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


module CEP(output reg serial_out,
            input reg [7:0] data,
            input logic CLK,rst,en,tx_start
                );
              
wire wr,shift_en,baud,clk; // Controller outputs

Datapath DP(.data(data), .write(wr), .clk(clk), .rst(rst), .baud(baud), .shift_en(shift_en), .s_out(serial_out));
Controller Ct(.wr(wr), .shift_en(shift_en), .baud(baud), .clk(clk), .CLK(CLK), .rst(rst), .en(en), .tx_start(tx_start));

endmodule
