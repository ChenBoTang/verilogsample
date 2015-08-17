module D_F1(d,q,clk,rst);
input d,clk,rst;
output reg q;

always@(negedge clk or negedge rst )
begin
 if(rst==0)
    q=1;
    
 else
    q=d;
 end

endmodule