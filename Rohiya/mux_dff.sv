`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2023 12:46:05 PM
// Design Name: 
// Module Name: mux_dff
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


module mux_dff(output logic out, 
                input logic I,input logic sel,input logic d_out
                
    );
    
    always_comb begin
        case(sel)
            1'b0: begin out= d_out ; end
            1'b1: begin out= I ; end
        endcase
    end
endmodule

