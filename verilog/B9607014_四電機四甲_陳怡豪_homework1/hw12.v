module hw12(clk,oclk,q);
input clk;
output reg oclk;
output reg [4:0]q;
always @(negedge clk)
begin
if (q==5'b11001)
begin
oclk=~oclk;
q=5'b00001;
end
else if (clk==0)
q=q+1;
end
endmodule

