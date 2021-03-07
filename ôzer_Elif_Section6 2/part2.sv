`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2019 20:16:44
// Design Name: 
// Module Name: part2
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

module part2( input logic clk,reset,
            input logic [3:0] in,
            input logic sel1,sel0,
            input logic ledS1,ledS0,
            input logic enabled,
            output [6:0] seg,
            output logic [15:0] outputL,
            output logic dp,
            output logic [63:0] number,
            output [3:0] an);
            
    logic [3:0] in0, in1, in2, in3;
    //reg [63:0] number;
        
    always@(posedge clk)        
    begin  
    if(reset ==0)
    begin         
      if( sel1 == 0 && sel0 == 0) 
      begin
        in0 = in;
      end
      if( sel1 == 1 && sel0 == 0) 
      begin
        in1 = in;
      end
      if( sel1 == 0 && sel0 == 1) 
      begin
        in2 = in;
      end
      if( sel0 == 1 && sel1 == 1) 
      begin
        in3 = in;
      end
    end
    else
    begin
        in0=0;
        in1=0;
        in2=0;
        in3=0;
    end
    end
    
    
    //load number respectively
    always@ (posedge clk)
    begin
    if(reset==0)
    begin
        if(ledS1 == 1'b0 && ledS0 == 1'b0)
          begin
            //number[15:0] <= {in3,in2,in1,in0};
            if ( enabled)
            begin
            number[15:12] <= in3;
            number[11:8] <= in2;
            number[7:4]<= in1;
            number[3:0] <= in0;
            end
            outputL <= number[15:0];
          end
        if(ledS1 == 1'b1 && ledS0 == 1'b0)
          begin
            //number[31:16] <= {in3,in2,in1,in0};
            if(enabled)
            begin
            number[31:28]<= in3;
            number[27:24] <=in2;
            number[23:20] <= in1;
            number [19:16] <= in0; 
            end
            outputL <= number[31:16];
          end
        if(ledS1== 1'b0 && ledS0 ==1'b1)
          begin
            //number[47:32] <= {in3,in2,in1,in0};
            if (enabled)
            begin
            number[47:44] <= in3;
            number[43:40] <= in2;
            number[39:36] <= in1;
            number[35:32] <= in0;
            end
            outputL <= number[47:32];
          end
        if(ledS1== 1'b1 && ledS0 == 1'b1)
          begin
            //number[63:48] <= {in3,in2,in1,in0};
            if(enabled)
            begin
            number[63:60] <=in3;
            number[59:56] <= in2;
            number[55:52] <= in1;
            number[51:48] <= in0;
            end
            outputL <= number[63:48];
          end
    end
    else
      begin
        number = 64'b0;
        outputL = 64'b0;
      end
    end
    
//    always@ (posedge clk)
//    begin
//        if(ledS1== 1'b0 && ledS0 == 1'b0)
//        begin
//            outputL = number[15:0];
//            in3 = number[15:12];
//            in2 = number[11:8];
//            in1 = number[7:4];
//            in0 = number[3:0];
//        end
//        if(ledS1== 1'b0 && ledS0 == 1'b1)
//        begin
//            outputL = number[31:16];
//            in3 = number[31:28];
//            in2 = number[27:24];
//            in1 = number[23:20];
//            in0 = number [19:16]; 
//        end
//        if(ledS1== 1'b1 && ledS0 == 1'b0) //
//        begin
//            outputL = number[47:32];
//            in3 = number[47:44];
//            in2 = number[43:40];
//            in1 = number[39:36];
//            in0 = number[35:32];
//        end
        
//        if(ledS1== 1'b1 && ledS0 == 1'b1)
//        begin
//            outputL = number[63:48];
//            in3 = number[63:60];
//            in2 = number[59:56];
//            in1 = number[55:52];
//            in0 = number[51:48];
//        end 
//    end
    
    SevSeg_4digit sg(clk , in0, in1, in2, in3, seg, dp, an); 
        
endmodule
