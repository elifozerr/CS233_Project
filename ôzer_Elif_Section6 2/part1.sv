`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2019 17:38:07
// Design Name: 
// Module Name: part1
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


module part1( input logic clk,
    input logic pos1, pos0,
    input logic[3:0] num,
    output logic dp,
    output logic[3:0] an,
    output logic[6:0] seg
    );
    logic[3:0] in0, in1, in2, in3;

    always @(posedge clk)
    begin
        if (pos1 == 1'b0 && pos0 == 1'b0)
        begin
            in0 = num;
          
        end
        if (pos1 == 1'b0 && pos0 == 1'b1)
        begin
            in1 = num;
          
        end
        if (pos1 == 1'b1 && pos0 == 1'b0)
        begin
            in2 = num;
           
        end
        if (pos1 == 1'b1 && pos0 == 1'b1)
        begin
            in3 = num;
         
        end
    end
    SevSeg_4digit sg(clk, in0, in1, in2, in3,
                    seg, dp, an);
endmodule