`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 08:52:18 AM
// Design Name: 
// Module Name: StateMachine
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


module StateMachine_old(output reg RTS,
                    output reg [1:0] current,
                    input logic clk,rst,en,tx_start,CTS,shift
                );
    
localparam Idle = 2'b00;
localparam Read = 2'b01;
localparam Request = 2'b10;
localparam Transmit = 2'b11;
//reg [1:0] current,next;
reg [1:0] next;

always_ff @(posedge clk or posedge rst) begin
    if(rst) 
        current <= Idle;
    else
        current <= next;
end

always_comb begin
    case({en,tx_start,CTS,shift,current})
    4'b00XX,Idle: next <= Idle;
    4'b10XX,Idle: next <= Read;
    4'bX1XX,Idle: next <= Request;
    
    4'b00XX,Read: next <= Idle;
    4'b10XX,Read: next <= Read;
    4'bX1XX,Read: next <= Request;
    
    4'bXX0X,Request: next <= Request;
    4'bXX1X,Request: next <= Transmit;
    
    4'bXXX0,Transmit: next <= Idle;
    4'bXXX1,Transmit: next <= Transmit;
    
    default: next <= Idle;
    endcase
end


always_comb begin
    case({en,tx_start,CTS,shift,current})
    4'bX0XX,Idle: RTS <= 0;
    4'bX1XX,Idle: RTS <= 1;
    
    4'bX0XX,Read: RTS <= 0;
    4'bX1XX,Read: RTS <= 1;
    
    4'bXX0X,Request: RTS <= 1;
    4'bXX1X,Request: RTS <= 0;
    
    4'bXXXX,Transmit: RTS <= 0;
    
    default: RTS <= 0;
    endcase
end


endmodule

