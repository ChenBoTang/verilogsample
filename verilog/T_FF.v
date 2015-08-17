module T_FF ( T, CLK, Q);
input T, CLK;
output Q;
wire w1;

xor(w1,Q,T);

D_FF d_ff(w1, CLK, Q);

endmodule

module D_FF (D, CLK, Q);
input D, CLK;
output Q;
reg Q;
always @(negedge CLK)
Q = D;

endmodule