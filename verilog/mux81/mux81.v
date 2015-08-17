module mux81(in,out,sel);
input [7:0]in;
input [2:0]sel;
output out;
wire [1:0]w;
mux41 aa(in[3:0],w[0],sel[1:0]);
mux41 bb(in[7:4],w[1],sel[1:0]);
mux21 cc(w,out,sel[2]);
endmodule
module mux41(in,out,sel);
input [3:0]in;
input [1:0]sel;
output out;
reg out;
always @(in or sel)
begin
if (sel==2'b00)
out=in[0];
if (sel==2'b01)
out=in[1];
if (sel==2'b10)
out=in[2];
if (sel==2'b11)
out=in[3];
end
endmodule 
module mux21(in,out,sel);
input [1:0]in;
input sel;
output out;
reg out;
always @(in or sel)
begin
if (sel==0)
out = in[0];
if (sel==1)
out = in[1];
end
endmodule 