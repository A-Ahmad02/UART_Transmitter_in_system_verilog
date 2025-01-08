`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2023 10:04:56 PM
// Design Name: 
// Module Name: D-FlipFlop
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


module D_FlipFlop(  output logic q,
                    input logic clk, rst, en, d
                    );

always_ff @ (posedge clk or posedge rst)
begin
    if (rst)
    q <= 1'b0;
    else
        begin
            if (en)
            q <= d;
            else
            q <= q;
        end
end

endmodule
