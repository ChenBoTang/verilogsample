module syncounter (clk,f_out,out,rst,check);

input clk,rst,check;
output f_out;
output [7:0]out;
reg [7:0]out;
reg f_out;
wire [7:0]check;



always@(posedge clk or negedge rst)
 begin
   if(rst==0)
      begin
       f_out=0;
       out=check;
      end
   
   else if(rst==1 & clk==1 & out==8'b00000001)
     begin
       f_out=~f_out;
       out=check;
      end
   else if(rst==1 && clk==1)
       out=out-1;
       
   
 end
     



endmodule
