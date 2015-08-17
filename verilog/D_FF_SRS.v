module D_FF_SRS (D, Set, Reset, CLK, Q);
input D, CLK, Set, Reset;
output Q;
reg Q;
always @(negedge CLK)
begin
if(Set)
Q = 1'b1;
else if(Reset) 
Q = 1'b0;
else
Q = D;
end
endmodule