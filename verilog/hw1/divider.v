module divider(outd, f_out, sel, clk, clear, count, load);
output [7:0] outd;
output f_out;
input  clk, clear, count, load;
input [1:0]sel;
//reg [7:0] ind;
wire w0;
wire w1,w2,w3,w4,w5,w6,w7,w8;
wire cin0,cin1,cin2,cin3,cin4,cin5,cin6,cin7;
wire [3:0] cinh,cinl;
parameter divid_0 = 0;
parameter divid_10 = 10;
parameter divid_100 = 100;
parameter divid_256 = 256;

assign {i70,i60,i50,i40,i30,i20,i10,i00} = divid_0;
assign {i71,i61,i51,i41,i31,i21,i11,i01} = divid_256;
assign {i72,i62,i52,i42,i32,i22,i12,i02} = divid_100;
assign {i73,i63,i53,i43,i33,i23,i13,i03} = divid_10;

MUX_4X1 mux0 (sel, i00, i01, i02, i03, cin0);
MUX_4X1 mux1 (sel, i10, i11, i12, i13, cin1);
MUX_4X1 mux2 (sel, i20, i21, i22, i23, cin2);
MUX_4X1 mux3 (sel, i30, i31, i32, i33, cin3);
MUX_4X1 mux4 (sel, i40, i41, i42, i43, cin4);
MUX_4X1 mux5 (sel, i50, i51, i52, i53, cin5);
MUX_4X1 mux6 (sel, i60, i61, i62, i63, cin6);
MUX_4X1 mux7 (sel, i70, i71, i72, i73, cin7);

assign cinl = {cin3,cin2,cin1,cin0};
assign cinh = {cin7,cin6,cin5,cin4};

counter c1 (outd[3:0], w0, clk, clear, cinl, load, count);
counter c2 (outd[7:4], , w0, clear, cinh, load, count);

not not1(w1,outd[7]);
not not2(w2,outd[6]);
not not3(w3,outd[5]);
not not4(w4,outd[4]);
not not5(w5,outd[3]);
not not6(w6,outd[2]);
not not7(w7,outd[1]);
and and1(w8,load,w1,w2,w3,w4,w5,w6,w7,outd[0]);

endmodule
//------------------------------------------------------------
module counter ( out, cout, CLK, CLR, in, load, count);
input  CLK, CLR, load, count;
input  [3:0] in;
output cout;
output [3:0] out;
reg [3:0] out;
reg cout;

always @(posedge CLK or posedge load or posedge CLR)
begin
if (CLR)
out <= 4'b0000;
else if (load)
    out <= in;
else if (count) 
    {cout, out} <= out - 1;
else
   out <= out;
end   

endmodule
//-------------------------------------------------------------
module MUX_4X1(sel, i0, i1, i2, i3, out);
input i0, i1, i2, i3;
input [1:0] sel;
output out;
reg out;

always @(sel or i0 or i1 or i2 or i3)
case(sel)
2'b00: out = i0;
2'b01: out = i1;
2'b10: out = i2;
2'b11: out = i3;
endcase
endmodule
