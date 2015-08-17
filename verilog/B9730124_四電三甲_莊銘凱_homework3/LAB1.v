module LAB1(rst,clk,chn,switch,A,B,out_state,wout,ones,tens);


input rst,clk,chn,switch;
output [7:0]ones, tens;
output reg [2:0]A,B;
output reg [2:0] out_state=3'b000;
output reg [7:0]wout;

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