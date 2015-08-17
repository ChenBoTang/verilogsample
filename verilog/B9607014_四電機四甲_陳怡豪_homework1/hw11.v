module hw11(sel,out,clk,f_out,rst);  
//宣告PORT及內部接線
input clk,rst;
input [1:0]sel;
output [7:0]out;
output f_out;
wire [7:0]check;
reg [3:0] en;
//當多工器對應的線路ENABLE時，就把除頻所須對應的COUNT送到CHECK否則就斷路
assign check=(en[0])? 8'b00000000:8'bz;
assign check=(en[1])? 8'b00000100:8'bz;
assign check=(en[2])? 8'b00011110:8'bz;
assign check=(en[3])? 8'b01000000:8'bz;

//呼叫除頻副程式
syncounter h1(.clk(clk),.f_out(f_out),.out(out),.rst(rst),.check(check));
//4-1 MUX 
always @ (sel)
       begin
        case(sel)
           2'b00 : en=4'b0001;
           2'b01 : en=4'b0010;
           2'b10 : en=4'b0100;
           2'b11 : en=4'b1000;
        endcase
        end
 endmodule
module syncounter (clk,f_out,out,rst,check);
//宣告PORT及內部接線
input clk,rst,check;
output f_out;
output [7:0]out;
reg [7:0]out;
reg f_out;
wire [7:0]check;
//clk正緣觸發的除頻電路，rst為reset功能，check為除頻所需count值
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
