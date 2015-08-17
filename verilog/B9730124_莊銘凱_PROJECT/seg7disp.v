module seg7disp(rst,dataIn0, segLedOut,B,en);

input rst,en;
input [7:0] dataIn0;
input [7:0] B;
output [7:0] segLedOut;
reg [7:0] segLedOut;


always @(rst or dataIn0 or B)
begin
if(~rst)
	segLedOut = 8'h03;
else if(~en)
	begin
		case(dataIn0)
			8'h0: segLedOut = 8'h03;
			8'h1: segLedOut = 8'h9F;
			8'h2: segLedOut = 8'h25;
			8'h3: segLedOut = 8'h0D;
			8'h4: segLedOut = 8'h99;
			8'h5: segLedOut = 8'h49;
			8'h6: segLedOut = 8'h41;
			8'h7: segLedOut = 8'h1B;
			8'h8: segLedOut = 8'h01;
			8'h9: segLedOut = 8'h19;
			default:  segLedOut = 8'hFF;
		endcase
	end
else if (en)

	begin
		case(B)
			8'h0: segLedOut = 8'h03;
			8'h1: segLedOut = 8'h9F;
			8'h2: segLedOut = 8'h25;
			8'h3: segLedOut = 8'h0D;
			8'h4: segLedOut = 8'h99;
			8'h5: segLedOut = 8'h49;
			8'h6: segLedOut = 8'h41;
			8'h7: segLedOut = 8'h1B;
			8'h8: segLedOut = 8'h01;
			8'h9: segLedOut = 8'h19;
			default:  segLedOut = 8'hFF;
		endcase
	end
end
endmodule