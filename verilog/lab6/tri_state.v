module tri_state(out,in,en);
input in,en;
output reg out;

always@(en) begin
if (en) out=in;
else out=1'bz;
end
endmodule
