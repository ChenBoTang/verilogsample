module LFSR(clk,rd_out,rst,ONES,TENS);

input clk,rst;
output [4:0] rd_out;
output [7:0]ONES,TENS;
wire temp,oclk;
wire [7:0] HUNDREDS;
reg A,B;
assign temp=(rd_out[4])^(rd_out[2]^A);
assign temp2=(rd_out[2]^B);
//division d1(oclk,clk);

bin2bcd d3(ONES,TENS,HUNDREDS,{3'b0,rd_out});


D_F1 A0(temp,rd_out[0],clk,rst);
D_F A1(rd_out[0],rd_out[1],clk,rst);
D_F A2(rd_out[1],rd_out[2],clk,rst);
D_F A3(temp2,rd_out[3],clk,rst);
D_F1 A5(rd_out[3],rd_out[4],clk,rst);

always@(negedge rst)
A=~A;
always@(posedge clk)
B=A;
//D_F1 A5(rd_out[4],rd_out[5],clk,rst);






endmodule