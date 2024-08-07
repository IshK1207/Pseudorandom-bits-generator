`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2024 19:16:02
// Design Name: 
// Module Name: testbench
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


module testbench();


reg [7:0]D;
reg clk;
reg reset;
wire [7:0]Q;

register reg1(D,clk,reset,Q);

initial begin
clk = 0;
reset = 0;
D = 1;
#10
D = 0;
#7
D = 1;
#10
D=0;
#10
D=1;
$finish;
end

always begin
clk = #5 ~clk;
end


endmodule

