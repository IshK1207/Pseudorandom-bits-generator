`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2024 11:33:23
// Design Name: 
// Module Name: VILCG
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
//module lcg(r,b,x0,xn, clk, start);

module VILCG(x,p,rx,rp,b,pn,xn,clk,start);
input [7:0]x,p,b;
input [2:0]rx,rp;
output [7:0]xn,pn;
input clk,start;
lcg lcgp(rp,b,p,pn,clk,start);
lcg lcgx(rx,pn,x,xn,clk,start);
endmodule

module KCR(x,y,p,q,r1,r2,r3,r4,b3,b4,z,clk,start);
input [7:0]x,y,p,q;
input [2:0]r1,r2,r3,r4;
input [7:0]b3,b4;
input clk,start;
output z;
wire [7:0]w1,w2,w3,w4;
VILCG vi1(x,p,r1,r3,b3,w3,w1,clk,start);
VILCG vi2(y,q,r2,r4,b4,w4,w2,clk,start);
comparator maincomp(w1,w2,z);
endmodule
