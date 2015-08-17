module lab(a,b,m,cx,s,v);
input m;
input [3:0]a,b;
output [3:0]s;
output cx,v;
//reg s[3:0];
wire c1,c2,c3,w0,w1,w2,w3;
xor (w0,m,b[0]);
xor (w1,m,b[1]);
xor (w2,m,b[2]);
xor (w3,m,b[3]);
fulladder aa(s[0],c1,a[0],w0,m);
fulladder bb(s[1],c2,a[1],w1,c1);
fulladder cc(s[2],c3,a[2],w2,c2);
fulladder dd(s[3],cx,a[3],w3,c3);
xor (v,cx,c3);
endmodule
module fulladder(S, C, A, B, C0);
input A, B, C0;
output S, C;
assign C = { (A ^ B) & C0 } | (A & B);
assign S = A ^ B ^ C0;
endmodule
