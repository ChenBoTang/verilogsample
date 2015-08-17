module JK_FF ( J, K, CLK, Q);
input J, K, CLK;
output Q;
wire w1,w2,w3,w4,w5;

and(w1,J,Q);
and(w2,~K,~Q);
or(w3,w2,w1);
D_FF d_ff(w3, CLK, Q);

endmodule

module D_FF (D, CLK, Q);
input D, CLK;
output Q;
reg Q;


always @(negedge CLK)

Q = D;

endmodule