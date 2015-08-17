module lab42(in, en, out, sel);
input [7:0]in;
input [2:0]sel;
input en;
output out;
wire [7:0]w;
decoder_3x8 xx(sel[0],sel[1],sel[2],en,w);
tri_state aa(out,in[0],w[0]);
tri_state bb(out,in[1],w[1]);
tri_state cc(out,in[2],w[2]);
tri_state dd(out,in[3],w[3]);
tri_state ee(out,in[4],w[4]);
tri_state ff(out,in[5],w[5]);
tri_state gg(out,in[6],w[6]);
tri_state hh(out,in[7],w[7]);

endmodule

module decoder_3x8(i0, i1, i2, en, out);
input i0, i1, i2, en;
output[7:0]out;
reg[7:0]out;
always@(en)
begin
if(en)
begin
case({i2, i1, i0})
     3'b000:out=8'b00000001;
     3'b001:out=8'b00000010;
     3'b010:out=8'b00000100;
     3'b011:out=8'b00001000;
     3'b100:out=8'b00010000;
     3'b101:out=8'b00100000;
     3'b110:out=8'b01000000;
     2'b111:out=8'b10000000;
     endcase
     end
     else
begin
out = 8'b00000000;
end
end
endmodule

