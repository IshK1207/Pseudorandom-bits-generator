`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2024 01:04:44
// Design Name: 
// Module Name: test
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


module test();
reg [7:0]X,Y;
reg [7:0] P,Q;
reg [2:0]R1,R2;
reg [2:0] R3,R4;
//reg [7:0]B1,B2;
reg [7:0]B3,B4;
reg clk;
reg start;
wire Z;

KCR kcr(X,Y,P,Q,R1,R2,R3,R4,B3,B4,Z,clk,start);
//main main1(X,Y,P,Q,R1,R2,R3,R4,B1,B2,B3,B4,Z,clk,start);
//CLCG main1(X,Y,R1,R2,B1,B2,Z,clk,start);
//VILCG vil1(X,P,R1,R3,B3,PN,Z,clk,start);
//lcg lcg7(R3,B3,X,Z, clk, start);
//adder add123(X,Y,P,Z);
initial begin
clk=0;
start = 0;
R1 = 4; R2 = 2;
R3 = 4; R4 = 3;
//B1 = 9;B2 = 3;
B3 = 47;B4 = 23;
X = 25;Y = 15;
P = 10; Q = 13;
#10
start = 1;
#12
start = 0;
# 2000
$finish;
end

always begin
clk = #5 ~clk;
end


endmodule
