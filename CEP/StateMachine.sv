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


module StateMachine(output reg RTS,
                    output reg [2:0] current,
                    input logic clk,rst,en,tx_start,CTS,shift
                );
    
localparam Idle = 3'b000;
localparam Write = 3'b001;
localparam Wait_ = 3'b010;
localparam Request = 3'b011;
localparam Transmit = 3'b100;
reg [2:0] next;

always_ff @(posedge clk or posedge rst) begin
    if(rst) 
        current <= Idle;
    else
        current <= next;
end

always_comb begin
    case(current)
    Idle: if (en) next = Write;
            else  next = Idle;
    Write: if (tx_start) next = Request;
            else if (en)  next = Write;
            else  next = Wait_;
    Wait_: if (tx_start) next = Request;
            else  next = Wait_;
    Request: if (CTS) next = Transmit;
            else  next = Request;
    Transmit: if (shift) next = Transmit;
            else  next = Idle;
    default: next = Idle;
    endcase
end


always_comb begin
    case(current)
    Idle: RTS = 0;
    Write: if (tx_start) RTS = 1;
            else  RTS = 0;
    Wait_: if (tx_start) RTS = 1;
            else  RTS = 0;
    Request: if (CTS) RTS = 0;
            else  RTS = 1;
    Transmit: RTS = 0;
    default: RTS = 0;
    endcase
end


endmodule

//always_comb begin
//    case({en,tx_start,CTS,shift,current})
//    4'b0XXX,Idle: next <= Idle;
//    4'b1XXX,Idle: next <= Write;
    
//    4'b00XX,Write: next <= Wait_;
//    4'b10XX,Write: next <= Write;
//    4'bX1XX,Write: next <= Request;
    
//    4'bX0XX,Wait_: next <= Wait_;
//    4'bX1XX,Wait_: next <= Request;
    
//    4'bXX0X,Request: next <= Request;
//    4'bXX1X,Request: next <= Transmit;
    
//    4'bXXX0,Transmit: next <= Idle;
//    4'bXXX1,Transmit: next <= Transmit;
    
//    default: next <= Idle;
//    endcase
//end


//always_comb begin
//    case({en,tx_start,CTS,shift,current})
//    4'bXXXX,Idle: RTS <= 0;
    
//    4'bX0XX,Write: RTS <= 0;
//    4'bX1XX,Write: RTS <= 1;
    
//    4'bX0XX,Wait_: RTS <= 0;
//    4'bX1XX,Wait_: RTS <= 1;
    
//    4'bXX0X,Request: RTS <= 1;
//    4'bXX1X,Request: RTS <= 0;
    
//    4'bXXXX,Transmit: RTS <= 0;
    
//    default: RTS <= 0;
//    endcase
//end

