`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2024 09:17:49
// Design Name: 
// Module Name: main
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
module comparator(input [7:0]a,input [7:0]b,output comp);
assign comp=(a>b)?1'b1:1'b0;
endmodule

module CLCG(input [7:0]seed1,input [7:0]seed2, input [2:0]r1,input [2:0]r2,input [7:0]b1,input [7:0]b2,output out,input clk,input start);
wire [7:0]w1;
wire [7:0]w2;
lcg lcg1(r1,b1,seed1,w1,clk,start);
lcg lcg2(r2,b2,seed2,w2,clk,start);
comparator comp(w1,w2,out);
endmodule

module main(x,y,p,q,r1,r2,r3,r4,b1,b2,b3,b4,out,clk,start);
input [7:0]x,y,p,q;
input [2:0]r1,r2,r3,r4;
input [7:0]b1,b2,b3,b4;
output out;
input clk,start;
CLCG mod1(x,y,r1,r2,b1,b2,w1,clk,start);
CLCG mod2(p,q,r3,r4,b3,b4,w2,clk,start);
tribuff trib(out,w1,w2);    
endmodule

