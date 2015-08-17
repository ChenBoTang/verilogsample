module HW_1(sel,out,clk,f_out,rst);

input clk,rst;
input [1:0]sel;
output [7:0]out;
output f_out;
wire [7:0]check;
reg [3:0] en;

assign check=(en[0])? 8'b00000000:8'bz;
assign check=(en[1])? 8'b00000110:8'bz;
assign check=(en[2])? 8'b00011110:8'bz;
assign check=(en[3])? 8'b01000000:8'bz;


syncounter h1(.clk(clk),.f_out(f_out),.out(out),.rst(rst),.check(check));
 
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
       
       