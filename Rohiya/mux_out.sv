`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2023 03:00:42 PM
// Design Name: 
// Module Name: mux_out
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


module mux_out(input logic sel, 
                input logic out_dff,input logic a1,
                output logic out
    );
    
    always_comb begin
        case(sel)
            1'b0: begin out= out_dff ; end
            1'b1: begin out=  a1; end
        endcase
    end
endmodule

