`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2023 12:11:59 PM
// Design Name: 
// Module Name: mux_level
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


module mux_level(input logic sel, 
                input logic pulse,input logic a0,
                output logic out
    );
    
    always_comb begin
        case(sel)
            1'b0: begin out= a0 ; end
            1'b1: begin out= pulse; end
        endcase
    end
endmodule
