module cmp(a,b,a_eq_b,a_gt_b,a_lt_b);
input [3:0]a,b;
output a_eq_b,a_gt_b,a_lt_b;
wire [3:0]x;
assign x[0] = a[0]&b[0]|~a[0]&~b[0];
assign x[1] = a[1]&b[1]|~a[1]&~b[1];
assign x[2] = a[2]&b[2]|~a[2]&~b[2];
assign x[3] = a[3]&b[3]|~a[3]&~b[3];
assign a_eq_b = x[0]&x[1]&x[2]&x[3];
assign a_gt_b = a[3]&(~b[3])|x[3]&a[2]&(~b[2])|x[3]&x[2]&a[1]&(~b[1])|x[3]&x[2]&x[1]&a[0]&(~b[0]);
assign a_lt_b = ~a[3]&b[3]|x[3]&~a[2]&b[2]|x[3]&x[2]&~a[1]&b[1]|x[3]&x[2]&x[1]&~a[0]&b[0];
endmodule 