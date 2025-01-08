`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2023 12:47:07 PM
// Design Name: 
// Module Name: datapath
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


module datapath(input logic [9:0] I_in,input logic baud_10,input logic transmit,input logic write,input logic clk,input logic rst,input logic  baud,output logic D_out);
logic [9:0] dff_out;
logic [9:0] mux_out;
logic pls;
logic a=0;
logic b=1;
logic shift;
logic mux_trans;

level_to_pulse L1(pls,clk,rst,baud);

mux_level L2(baud_10,pls,a,shift);


d_ff d1(mux_out[0],shift,write,dff_out[0]);
d_ff d2(mux_out[1],shift,write,dff_out[1]);
d_ff d3(mux_out[2],shift,write,dff_out[2]);
d_ff d4(mux_out[3],shift,write,dff_out[3]);
d_ff d5(mux_out[4],shift,write,dff_out[4]);
d_ff d6(mux_out[5],shift,write,dff_out[5]);
d_ff d7(mux_out[6],shift,write,dff_out[6]);
d_ff d8(mux_out[7],shift,write,dff_out[7]);
d_ff d9(mux_out[8],shift,write,dff_out[8]);
d_ff d10(mux_out[9],shift,write,dff_out[9]);

mux_dff m1(mux_out[0],I_in[0],shift,dff_out[9]);
mux_dff m2(mux_out[1],I_in[1],shift,dff_out[0]);
mux_dff m3(mux_out[2],I_in[2],shift,dff_out[1]);
mux_dff m4(mux_out[3],I_in[3],shift,dff_out[2]);
mux_dff m5(mux_out[4],I_in[4],shift,dff_out[3]);
mux_dff m6(mux_out[5],I_in[5],shift,dff_out[4]);
mux_dff m7(mux_out[6],I_in[6],shift,dff_out[5]);
mux_dff m8(mux_out[7],I_in[7],shift,dff_out[6]);
mux_dff m9(mux_out[8],I_in[8],shift,dff_out[7]);
mux_dff m10(mux_out[9],I_in[9],shift,dff_out[8]);

mux_out(transmit,dff_out[9],b,mux_trans);

endmodule
