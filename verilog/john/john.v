module john(clk,x,y);
input clk;
output x,y;
wire [7:0]w;
j a(clk,w);
assign x = w[1]|w[2]|w[4]|w[5];
assign y = w[6]|w[7];
endmodule
module j(clk,out);
input clk;
output [7:0]out;
reg a,b,c,d;
assign out[0]=a&~b;
assign out[1]=b&~c;
assign out[2]=c&~d;
assign out[3]=a&d;
assign out[4]=~a&b;
assign out[5]=~b&c;
assign out[6]=~c&d;
assign out[7]=~a&~d;
always @(posedge clk)
begin
a<=~d;
b<=a;
c<=b;
d<=c;
end
endmodule 