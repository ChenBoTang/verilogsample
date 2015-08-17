module LAB1(rst,clk,chn,switch,A,B);


input rst,clk,chn,switch;
wire [7:0]ones, tens;
output reg [2:0]A,B;
reg [2:0] out_state=3'b000;
reg [7:0]wout;

reg auto=1'b0;
wire [7:0] ONES, TENS, HUNDREDS;
wire oclk;

parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100;
parameter d1=8'b0000001,d3=8'b00000011,d0=8'b0000000;

bin2bcd A3(ONES,TENS,HUNDREDS,wout);  
seg7disp A4(1'b1,ONES, ones);         
seg7disp A5(1'b1,TENS, tens);        
division A1(.oclk(oclk), .clk(clk));        
always @(posedge oclk )
begin
	if(~rst) 
	wout = 8'b00001000;


        else if((chn==0)&(auto==1))
        
        begin
          case(out_state)
           S0:wout=8'b00001000;
           S1:wout=8'b00000101;
           S2:wout=8'b00000100;
           S3:wout=8'b00000010;
           endcase
        end
        else if(auto)
          wout=wout;
        else if (wout == 8'b00000001)
		wout = 8'b00001000;	

        else if(wout < 9)
		wout = wout - 8'b00000001;
	 
	
end

always@(negedge switch)
 begin 
  auto=~auto;                 
  end 

always@(posedge oclk)
begin
if(auto==0)                       
 begin
   case(out_state)
   S0:
      begin
        if(wout==8'b00000110)
           begin
              out_state=S1;   
                                 
           end
         else
              out_state=S0;
        end  
   S1:
     begin
         if(wout==8'b00000101)
         
              out_state=S2;
            
          else
              out_state=S1;
     end
   S2:
      begin
         if(wout==8'b00000010)
         out_state=S3;
          else
              out_state=S2;
      end
   S3:
      begin
        if(wout==8'b00000001)
            out_state=S0;
                        
         else
              out_state=S3;   
      end
    
   endcase
   end
 else if(chn==0)                    
   begin
       case(out_state)
       S0: out_state=S1;
       S1: out_state=S2;
       S2: out_state=S3;
       S3: out_state=S0;
       endcase
    end
   
end
always@(*)
begin
 case (out_state)
  S0: begin A=3'b010;
            B=3'b001;
              
      end
  S1: begin A=3'b100;
              B=3'b001;
      end        
  S2: begin A=3'b001;
             B=3'b010;
      end
  S3: begin
            A=3'b001;
            B=3'b100;
      end
  endcase
 end
endmodule
module seg7disp(rst,dataIn0, segLedOut);

input rst;
input [7:0] dataIn0;
output [7:0] segLedOut;
reg [7:0] segLedOut;

always @(rst or dataIn0)
if(~rst)
	segLedOut = 8'h03;
else
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
endmodule
module bin2bcd(ONES,TENS,HUNDREDS,A);
input [7:0] A;
output [7:0] ONES, TENS, HUNDREDS;
wire [3:0] c1,c2,c3,c4,c5,c6,c7;
wire [3:0] d1,d2,d3,d4,d5,d6,d7;

assign d1 = {1'b0,A[7:5]};
assign d2 = {c1[2:0],A[4]};
assign d3 = {c2[2:0],A[3]};
assign d4 = {c3[2:0],A[2]};
assign d5 = {c4[2:0],A[1]};
assign d6 = {1'b0,c1[3],c2[3],c3[3]};
assign d7 = {c6[2:0],c4[3]};
add3 m1(d1,c1);
add3 m2(d2,c2);
add3 m3(d3,c3);
add3 m4(d4,c4);
add3 m5(d5,c5);
add3 m6(d6,c6);
add3 m7(d7,c7);
assign ONES = {4'b0000, c5[2:0],A[0]};
assign TENS = {4'b0000, c7[2:0],c5[3]};
assign HUNDREDS = {6'b000000, c6[3],c7[3]};

endmodule

module add3(in,out);
input [3:0] in;
output [3:0] out;
reg [3:0] out;

always @ (in)
	case (in)
	4'b0000: out <= 4'b0000;
	4'b0001: out <= 4'b0001;
	4'b0010: out <= 4'b0010;
	4'b0011: out <= 4'b0011;
	4'b0100: out <= 4'b0100;
	4'b0101: out <= 4'b1000;
	4'b0110: out <= 4'b1001;
	4'b0111: out <= 4'b1010;
	4'b1000: out <= 4'b1011;
	4'b1001: out <= 4'b1100;
	default: out <= 4'b0000;
	endcase
endmodule
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
