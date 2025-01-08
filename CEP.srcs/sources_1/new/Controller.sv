`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 04:55:18 PM
// Design Name: 
// Module Name: Controller
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


module Controller(output reg clk,wr,shift_en,baud,
                  input logic CLK,rst,en,tx_start
                );
                
wire [3:0] cnt; 
wire [1:0] state;
wire load, shift_en_n, transmit,RTS;

//assign clk = CLK;
DownClocking_clk DC1(.clock_in(CLK), .rst(rst), .clock_out(clk)); // 10 times Faster than Baud f=96000Hz
DownClocking_BaudRate DC2(.clock_in(CLK), .rst(rst), .clock_out(baud)); // f=9600Hz

StateMachine FSM(.RTS(RTS), .current(state), .clk(clk), .rst(rst), .en(en), .tx_start(tx_start), .shift(shift_en));
Comparator_2bit Cp1(.out(wr), .in0(2'b01), .in1(state));
Comparator_2bit Cp2(.out(transmit), .in0(2'b11), .in1(state));

Edge_to_Pulse Et(.pulse(load), .clk(clk), .rst(rst), .level(transmit));
Reloadable_DownCounter Rd(.rst(rst), .baud(baud), .load(load), .sel(4'b1011), .cnt(cnt)); // Reloads 10 to complete 10 cycles 
Comparator_4bit Cp3(.out(shift_en_n), .in0(4'b0000), .in1(cnt));
not n1(shift_en,shift_en_n);
endmodule
