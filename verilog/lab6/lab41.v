module lab41(in, en, out, sel);
input [3:0]in;
input [1:0]sel;
input en;
output out;
wire [3:0]w;
decoder_2x4 xx(sel[0],sel[1],en,w);
tri_state aa(out,in[0],w[0]);
tri_state bb(out,in[1],w[1]);
tri_state cc(out,in[2],w[2]);
tri_state dd(out,in[3],w[3]);

endmodule

module decoder_2x4(i0, i1, en, out);
input i0, i1, en;
output[3:0]out;
reg[3:0]out;
always@(en)
begin
if(en)
begin
case({i1, i0})
     2'b00:out=4'b0001;
     2'b01:out=4'b0010;
     2'b10:out=4'b0100;
     2'b11:out=4'b1000;
     endcase
     end
     else
begin
out = 4'b0000;
end
end
endmodule

