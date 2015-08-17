module lab(in,out,sel,en);
input [31:0]in;
input [4:0]sel;
input en;
output out;
wire [3:0]w;
lab42 aa(in[7:0],en,w[0],sel[2:0]);
lab42 bb(in[15:8],en,w[1],sel[2:0]);
lab42 cc(in[23:16],en,w[2],sel[2:0]);
lab42 dd(in[31:24],en,w[3],sel[2:0]);
lab41 ee(w,en,out,sel[4:3]);
endmodule 