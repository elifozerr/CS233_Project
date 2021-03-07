`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2019 20:03:11
// Design Name: 
// Module Name: gameTop
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


module gameTop( input logic clk,
    input logic reset,
    input logic start,
    //input logic pos1, pos0,
   // input logic[3:0] num,
    input logic [3:0] in, 
    input logic sel1,sel0,
    input logic ledS1,ledS0,
    input logic enabled,
    input logic restart,
    input logic button1, button2, button3, button4,
    output logic dp,
    output logic[3:0] an,
    output logic[6:0] seg ,
    output logic [15:0] outputL,
    //output logic [63:0] number,
    //output [7:0][7:0] outMat,
    output logic[7:0] rowsOut,
     output logic shcp, stcp, mr, oe, ds);

         
    logic [63:0]number;
    logic [7:0][7:0]outMat;

   //rt1 pt1(clk, pos1,pos0,num,dp,an,seg);
    part2 pt2(clk,reset,in,sel1,sel0,ledS1,ledS0,enabled,seg,outputL,dp,number,an);
    part3 pt3(clk,restart,reset,start,number,button1, button2, button3, button4,outMat);
    converter cv(clk, outMat,rowsOut,shcp, stcp, mr, oe, ds);
    
    
    
endmodule
