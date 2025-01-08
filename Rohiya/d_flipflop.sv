`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2023 12:25:36 PM
// Design Name: 
// Module Name: d_flipflop
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


module d_flipflop(input logic shift, write, clk, d,output logic q);
    logic reset;
    assign reset = shift | write;
    always_ff @(posedge clk, negedge reset) begin
        if (!reset) begin
            q <= 1'b0; // Reset the output to 0 when reset signal is low
        end else begin
            q <= d;
        end
    end
endmodule



