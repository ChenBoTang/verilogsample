module division (oclk, clk);
input clk;
output oclk;
reg oclk;
integer i;								
always @ (posedge clk)
	if (i<=25000000)						
		begin
		i=i+1;
		oclk=oclk;
		end
	else if(i==25000001)					
		begin
		oclk=~oclk;
		i=0;
		end
endmodule
