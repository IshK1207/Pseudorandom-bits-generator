`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2024 12:13:24
// Design Name: 
// Module Name: lcg
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
module decoder( input [2:0]sel,output [7:0]out);
assign out[0] = ((~sel[0])&(~sel[1])&(~sel[2]));
assign out[1] = ((sel[0])&(~sel[1])&(~sel[2]));
assign out[2] = ((~sel[0])&(sel[1])&(~sel[2]));
assign out[3] = ((sel[0])&(sel[1])&(~sel[2]));
assign out[4] = ((~sel[0])&(~sel[1])&(sel[2]));
assign out[5] = ((sel[0])&(~sel[1])&(sel[2]));
assign out[6] = ((~sel[0])&(sel[1])&(sel[2]));
assign out[7] = ((sel[0])&(sel[1])&(sel[2]));
endmodule

module tribuff(output out, input en, input in);
assign out = en?in:1'bz;
endmodule

module barrel(output [7:0]in ,input [7:0]out, input [2:0]r);
wire [7:0]w1;
wire grnd;
assign grnd = 1'b0;
decoder d1(r,w1);
tribuff tr00(in[0],w1[0],out[0]);
tribuff tr01(in[1],w1[0],out[1]);
tribuff tr02(in[2],w1[0],out[2]);
tribuff tr03(in[3],w1[0],out[3]);
tribuff tr04(in[4],w1[0],out[4]);
tribuff tr05(in[5],w1[0],out[5]);
tribuff tr06(in[6],w1[0],out[6]);
tribuff tr07(in[7],w1[0],out[7]);

tribuff tr10(in[0],w1[1],grnd);
tribuff tr11(in[1],w1[1],out[0]);
tribuff tr12(in[2],w1[1],out[1]);
tribuff tr13(in[3],w1[1],out[2]);
tribuff tr14(in[4],w1[1],out[3]);
tribuff tr15(in[5],w1[1],out[4]);
tribuff tr16(in[6],w1[1],out[5]);
tribuff tr17(in[7],w1[1],out[6]);

tribuff tr20(in[0],w1[2],grnd);
tribuff tr21(in[1],w1[2],grnd);
tribuff tr22(in[2],w1[2],out[0]);
tribuff tr23(in[3],w1[2],out[1]);
tribuff tr24(in[4],w1[2],out[2]);
tribuff tr25(in[5],w1[2],out[3]);
tribuff tr26(in[6],w1[2],out[4]);
tribuff tr27(in[7],w1[2],out[5]);

tribuff tr30(in[0],w1[3],grnd);
tribuff tr31(in[1],w1[3],grnd);
tribuff tr32(in[2],w1[3],grnd);
tribuff tr33(in[3],w1[3],out[0]);
tribuff tr34(in[4],w1[3],out[1]);
tribuff tr35(in[5],w1[3],out[2]);
tribuff tr36(in[6],w1[3],out[3]);
tribuff tr37(in[7],w1[3],out[4]);

tribuff tr40(in[0],w1[4],grnd);
tribuff tr41(in[1],w1[4],grnd);
tribuff tr42(in[2],w1[4],grnd);
tribuff tr43(in[3],w1[4],grnd);
tribuff tr44(in[4],w1[4],out[0]);
tribuff tr45(in[5],w1[4],out[1]);
tribuff tr46(in[6],w1[4],out[2]);
tribuff tr47(in[7],w1[4],out[3]);

tribuff tr50(in[0],w1[5],grnd);
tribuff tr51(in[1],w1[5],grnd);
tribuff tr52(in[2],w1[5],grnd);
tribuff tr53(in[3],w1[5],grnd);
tribuff tr54(in[4],w1[5],grnd);
tribuff tr55(in[5],w1[5],out[0]);
tribuff tr56(in[6],w1[5],out[1]);
tribuff tr57(in[7],w1[5],out[2]);

tribuff tr60(in[0],w1[6],grnd);
tribuff tr61(in[1],w1[6],grnd);
tribuff tr62(in[2],w1[6],grnd);
tribuff tr63(in[3],w1[6],grnd);
tribuff tr64(in[4],w1[6],grnd);
tribuff tr65(in[5],w1[6],grnd);
tribuff tr66(in[6],w1[6],out[0]);
tribuff tr67(in[7],w1[6],out[1]);

tribuff tr70(in[0],w1[7],grnd);
tribuff tr71(in[1],w1[7],grnd);
tribuff tr72(in[2],w1[7],grnd);
tribuff tr73(in[3],w1[7],grnd);
tribuff tr74(in[4],w1[7],grnd);
tribuff tr75(in[5],w1[7],grnd);
tribuff tr76(in[6],w1[7],grnd);
tribuff tr77(in[7],w1[7],out[0]);
endmodule

module mux (input [7:0]a, input [7:0]b, input sel, output[7:0]c);
assign c = sel?b:a;
endmodule

module adder (input [7:0]a,input [7:0]b,input [7:0]c,output[7:0]sum);
assign sum = a+b+c;
endmodule

module onepsw(input start,output out);
assign out = start||out;
endmodule 

module register (input [7:0]D,input clk,input en,input reset, output [7:0]Q);
reg [7:0]Q;
initial begin
Q=0;
end
always @(posedge clk)begin
if (reset)
Q=0;
else if (en)
Q=D;
end
endmodule

module lcg(input [2:0]r,input[7:0]b,input[7:0]x0,output [7:0]xn,input clk,input start);
wire [7:0]w1;wire [7:0]w2; wire[7:0]w3; wire w4,w5;
mux mux1(xn,x0,start,w1);
barrel shift(w2,w1,r);
adder add(w1,w2,b,w3);
onepsw one1(start,w5);
register reg1(w3,clk,w5,w4,xn);
endmodule
