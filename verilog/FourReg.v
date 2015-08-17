module FourReg(D_in, clk, rst , load, Out);

output[3:0] Out;
input[3:0] D_in;
input clk,rst,load;
reg [3:0]Out;

always @(posedge clk)
begin

if(rst)
Out = 4'b0000;
else if(load)
Out = D_in;
else
Out = Out ;


end
endmodule
