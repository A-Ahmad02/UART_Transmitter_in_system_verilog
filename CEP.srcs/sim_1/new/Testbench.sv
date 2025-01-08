`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2023 11:21:12 AM
// Design Name: 
// Module Name: Testbench
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


module Testbench;
  
logic RTS, serial_out;          // CEP module outputs
logic [7:0] data;               // CEP module inputs 
logic clk,rst,en,tx_start,CTS;  // CEP module inputs
logic clk2;                     // Local variables

CEP UUT(
.serial_out(serial_out), //.RTS(RTS), 
.CLK(clk), .rst(rst), //.CTS(CTS),
.en(en), .tx_start(tx_start), .data(data)
);

initial // All initial blocks run in parallel
begin
    clk = 1'b0;
    #5;
    forever #5 clk = ~clk;
end

initial 
begin
    clk2 = 1'b0;
    #20;
    forever #20 clk2 = ~clk2;
end

always_ff @ (posedge clk2)
begin
 if (RTS) 
    CTS <= 1;
 else 
     CTS <= 0;
end

initial  //Driver
begin
    rst = 1'b1;
    @(posedge clk);
    rst = 1'b0;
    @(posedge clk);
    en = 1'b0; 
    tx_start = 1'b0; 
    repeat(2) @(posedge clk);

    data = 8'b0110_1011;  // 6 b    0_1101_0110_1
//    tx_start = 1'b1; 
//    en = 1'b1;
//    repeat(2) @(posedge clk);
//    tx_start = 1'b0; 
//    en = 1'b0;
//    @(posedge clk);

    en = 1'b1; 
    repeat(5208) @(posedge clk);
    en = 1'b0;
    repeat(5208) @(posedge clk);
    
    data = 8'b00000000; 
    
    tx_start = 1'b1; 
    repeat(5208) @(posedge clk);
    tx_start = 1'b0; 
    @(posedge clk);
    
    data = 8'b11111111; 
    @(posedge clk);

    repeat(9) @(posedge clk);

end

initial  //Moniter
begin
$monitor("en=%b tx_start=%b CTS=%b data=%b, RTS=%b, s_out=%b",en,tx_start,CTS,data,RTS,serial_out);
end

endmodule


