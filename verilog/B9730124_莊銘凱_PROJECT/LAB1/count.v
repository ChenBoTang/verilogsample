module count(wout, oclk, rst);
input oclk, rst;
output [7:0]wout;
reg [7:0]wout;

always @(posedge oclk )
begin
    if(wout < 32)
		wout = wout + 8'b00000001;
	else if (wout == 32)
		wout = 8'b00000000;
end
endmodule
