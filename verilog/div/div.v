module div (clk,oclk,q);
input clk;
output reg oclk;
output reg [3:0]q;
always @(negedge clk)
begin
if (q==4'b0101)
begin
oclk=~oclk;
q=4'b0001;
end
else if (clk==0)
q=q+1;
end
endmodule

