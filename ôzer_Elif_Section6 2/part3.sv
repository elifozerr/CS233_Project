`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2019 20:46:16
// Design Name: 
// Module Name: part3
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


module part3(input logic clk, restart,reset,
             //
             input logic start,
             input logic [63:0]number,
             input logic button1, button2, button3, button4,
             output logic [7:0][7:0] outMat );
    
    //binary to matrix
    logic [7:0][7:0] initState;
    logic [7:0][7:0] mat;
//    logic [7:0][7:0] next;
  
    
//    always@ (number)
//    begin
//    //
     
//     if(start)
//        begin
//            for(integer i= 0; i<8 ; i=i+1)
//            begin
//                for(integer j = 0; j<8 ; j= j+1)
//                begin
//                    initState [i][j] = number[i*7+j];
//                end
//            end
//        end
//    end
        
    
    
    logic [7:0][7:0][1:0]label= {{2'b01, 2'b10, 2'b01, 2'b10, 2'b11, 2'b10, 2'b11, 2'b10},
                           {2'b00, 2'b11, 2'b00, 2'b11, 2'b00, 2'b01, 2'b00, 2'b01},
                           {2'b01, 2'b10, 2'b01, 2'b10, 2'b11, 2'b10, 2'b11, 2'b10},
                           {2'b00, 2'b11, 2'b00, 2'b11, 2'b00, 2'b01, 2'b00, 2'b01},
                           {2'b00, 2'b01, 2'b00, 2'b01, 2'b00, 2'b01, 2'b00, 2'b01},
                           {2'b10, 2'b11, 2'b10, 2'b11, 2'b10, 2'b11, 2'b10, 2'b11},
                           {2'b00, 2'b01, 2'b00, 2'b01, 2'b00, 2'b01, 2'b00, 2'b01},
                           {2'b10, 2'b11, 2'b10, 2'b11, 2'b10, 2'b11, 2'b10, 2'b11}};
     
   always_ff@ (posedge clk)
   begin
    //if(|number ==1)
    // begin
        if(start)
        begin
            for(integer i= 0; i<8 ; i=i+1)
            begin
                for(integer j = 0; j<8 ; j= j+1)
                begin
                    initState [i][j] = number[i*8+j];
                end
            end
            mat = initState;
        end
        
        if(restart)
        begin
            mat = initState;
        end
        
        if(button1)
        begin
            //rule
            //if(|number ==1)
            //begin
                for(integer i=0; i<8; i=i+1)
                begin
                    for(integer j=0; j<8; j=j+1)
                    begin
                    if(label[i][j] == 2'b00)
                    begin
                        if( mat[(i+1)%8][j] ==1'b1 && mat[i][(j+7)%8] ==1'b1 && mat[i][(j+1)%8] ==1'b1 && mat[(i+7)%8][j%8] ==1'b0)
                        begin
                            mat [i][j] = 1'b1; 
                        end
                        else if(mat[(i+1)%8][j] ==1'b1 && mat[i][(j+7)%8] ==1'b0 && mat[i][(j+1)%8] ==1'b0 && mat[(i+7)%8][j] ==1'b0)
                        begin
                             mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b1 && mat[i][(j+1)%8] ==1'b1 && mat[(i+7)%8][j] ==1'b0)
                        begin
                            mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b0 && mat[i][(j+1)%8] ==1'b1 && mat[(i+7)%8][j] ==1'b1)
                        begin
                            mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b0 && mat[i][(j+1)%8] ==1'b1 && mat[(i+7)%8][j] ==1'b0  )
                        begin
                            mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b1 && mat[i][(j+1)%8] ==1'b0 && mat[(i+7)%8][j] ==1'b1)
                        begin
                            mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b0 && mat[i][(j+1)%8] ==1'b1 && mat[(i+7)%8][j] ==1'b0)
                        begin
                            mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b0 && mat[i][(j+1)%8] ==1'b0 && mat[(i+7)%8][j] ==1'b1)
                        begin
                            mat [i][j] = 1'b1;
                        end
                      
                         else
                         begin
                            mat [i][j] = 1'b0;
                         end 
                    end 
//                    else
//                    begin
//                        next<= mat;
//                    end  
                    end
               end
           //end
       end
            
        
   if(button2)
        begin
            //rule
            //if(|number ==1)
            //begin
                for(integer i=0; i<8; i=i+1)
                begin
                    for(integer j=0; j<8; j=j+1)
                    begin
                    if(label[i][j] == 2'b01)
                    begin
                        if( mat[(i+1)%8][j] ==1'b1 && mat[i][(j+7)%8] ==1'b1 && mat[i][(j+1)%8] ==1'b1 && mat[(i+7)%8][j] ==1'b0)
                        begin
                            mat [i][j] = 1'b1; 
                        end
                        else if(mat[(i+1)%8][j] ==1'b1 && mat[i][(j+7)%8] ==1'b0 && mat[i][(j+1)%8] ==1'b0 && mat[(i+7)%8][j] ==1'b0)
                        begin
                             mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b1 && mat[i][(j+1)%8] ==1'b1 && mat[(i+7)%8][j] ==1'b0)
                        begin
                            mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b0 && mat[i][(j+1)%8] ==1'b1 && mat[(i+7)%8][j] ==1'b1)
                        begin
                            mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b0 && mat[i][(j+1)%8] ==1'b1 && mat[(i+7)%8][j] ==1'b0  )
                        begin
                            mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b1 && mat[i][(j+1)%8] ==1'b0 && mat[(i+7)%8][j] ==1'b1)
                        begin
                            mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b1 && mat[i][(j+1)%8] ==1'b0 && mat[(i+7)%8][j] ==1'b0)
                        begin
                            mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b0 && mat[i][(j+1)%8] ==1'b0 && mat[(i+7)%8][j] ==1'b1)
                        begin
                            mat [i][j] = 1'b1;
                        end
                      
                         else
                         begin
                            mat [i][j] = 1'b0;
                         end 
                    end 
//                    else
//                    begin
//                        next<= mat;
//                        end  
                        end
                   end
               //end
           end
        
       if(button3)
        begin
            //rule
            //if(|number ==1)
            //begin
                for(integer i=0; i<8; i=i+1)
                begin
                    for(integer j=0; j<8; j=j+1)
                    begin
                    if(label[i][j] == 2'b10)
                    begin
                        if( mat[(i+1)%8][j] ==1'b1 && mat[i][(j+7)%8] ==1'b1 && mat[i][(j+1)%8] ==1'b1 && mat[(i+7)%8][j] ==1'b0)
                        begin
                            mat [i][j] = 1'b1; 
                        end
                        else if(mat[(i+1)%8][j] ==1'b1 && mat[i][(j+7)%8] ==1'b0 && mat[i][(j+1)%8] ==1'b0 && mat[(i+7)%8][j] ==1'b0)
                        begin
                             mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b1 && mat[i][(j+1)%8] ==1'b1 && mat[(i+7)%8][j] ==1'b0)
                        begin
                            mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b0 && mat[i][(j+1)%8] ==1'b1 && mat[(i+7)%8][j] ==1'b1)
                        begin
                            mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b0 && mat[i][(j+1)%8] ==1'b1 && mat[(i+7)%8][j] ==1'b0  )
                        begin
                            mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b1 && mat[i][(j+1)%8] ==1'b0 && mat[(i+7)%8][j] ==1'b1)
                        begin
                            mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b1 && mat[i][(j+1)%8] ==1'b0 && mat[(i+7)%8][j] ==1'b0)
                        begin
                            mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b0 && mat[i][(j+1)%8] ==1'b0 && mat[(i+7)%8][j] ==1'b1)
                        begin
                            mat [i][j] = 1'b1;
                        end
                      
                         else
                         begin
                            mat [i][j] = 1'b0;
                         end 
                    end 
//                    else
//                    begin
//                        next<= mat;
//                    end  
                    end
               end
           //end
       end
        
        
       if(button4)
        begin
            //rule
            //if(|number ==1)
            //begin
                for(integer i=0; i<8; i=i+1)
                begin
                    for(integer j=0; j<8; j=j+1)
                    begin
                    if(label[i][j] == 2'b11)
                    begin
                        if( mat[(i+1)%8][j] ==1'b1 && mat[i][(j+7)%8] ==1'b1 && mat[i][(j+1)%8] ==1'b1 && mat[(i+7)%8][j] ==1'b0)
                        begin
                            mat [i][j] = 1'b1; 
                        end
                        else if(mat[(i+1)%8][j] ==1'b1 && mat[i][(j+7)%8] ==1'b0 && mat[i][(j+1)%8] ==1'b0 && mat[(i+7)%8][j] ==1'b0)
                        begin
                             mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b1 && mat[i][(j+1)%8] ==1'b1 && mat[(i+7)%8][j] ==1'b0)
                        begin
                            mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b0 && mat[i][(j+1)%8] ==1'b1 && mat[(i+7)%8][j] ==1'b1)
                        begin
                            mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b0 && mat[i][(j+1)%8] ==1'b1 && mat[(i+7)%8][j] ==1'b0  )
                        begin
                            mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b1 && mat[i][(j+1)%8] ==1'b0 && mat[(i+7)%8][j] ==1'b1)
                        begin
                            mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b1 && mat[i][(j+1)%8] ==1'b0 && mat[(i+7)%8][j] ==1'b0)
                        begin
                            mat [i][j] = 1'b1;
                        end
                        else if(mat[(i+1)%8][j] ==1'b0 && mat[i][(j+7)%8] ==1'b0 && mat[i][(j+1)%8] ==1'b0 && mat[(i+7)%8][j] ==1'b1)
                        begin
                            mat [i][j] = 1'b1;
                        end
                      
                         else
                         begin
                            mat [i][j] = 1'b0;
                         end 
                    end 
//                    else
//                    begin
//                        next<= mat;
//                    end 
//--------- 
                    end
               end
           //end
       end
        if(reset)
        begin
            //mat =0;
            mat = 0;
            
        end
        
        for (int i = 0; i < 8; i++)
        begin
            for (int j = 0; j < 8; j++)
            begin
                outMat[i][j] = mat[i][j];
            end
        end
     
   end
 //end
    
endmodule


   



   
