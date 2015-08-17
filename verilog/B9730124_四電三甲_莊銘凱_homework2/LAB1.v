module LAB1(product,out_state,clk,control,St,M,M_id);
input [3:0] M,M_id;
input clk,St;
output reg [8:0] product;
output reg [3:0]control,out_state;
wire [3:0]sum;

assign K=product[0];
assign {cout,sum}= M_id + product[7:4];

parameter S0=4'b0000,S1=4'b0001,S2=4'b0010,S3=4'b0011,S4=4'b0100;
parameter S5=4'b0101,S6=4'b0110,S7=4'b0111,S8=4'b1000,S9=4'b1001;

always@(posedge clk)
begin
   case(control)
     4'b0100: 
             begin 
              product[7:4]=sum[3:0];
              product[8]=cout;
               end
     4'b0010: 
             begin
              product=product>>1;
                
               end
               
     4'b1000: begin
              product={5'b0000,M};
              end
   endcase
end


always@(posedge clk)
begin
 case (out_state)
  S0: 
    out_state=(St==1'b1)?S1:S0;
  S1: 
    out_state=(K==1'b1)?S2:S3;
  S2: 
     out_state=S3;
  S3: 
    out_state=(K==1'b1)?S4:S5;
  S4: 
    out_state=S5;
  S5: 
    out_state=(K==1'b1)?S6:S7;
  S6:
     out_state=S7;
  S7: 
    out_state=(K==1'b1)?S8:S9;
  S8:
     out_state=S9;
  S9:
     out_state=S0; 
 endcase
end


always@(*)
begin
 case (out_state)
  S0: control=(St==1'b1)?4'b1000:4'b0000;
  S1: control=(K==1'b1)?4'b0100:4'b0010;
  S2: control=4'b0010;
  S3: control=(K==1'b1)?4'b0100:4'b0010;
  S4: control=4'b0010;
  S5: control=(K==1'b1)?4'b0100:4'b0010;
  S6: control=4'b0010;
  S7: control=(K==1'b1)?4'b0100:4'b0010;
  S8: control=4'b0010;
  S9: control=4'b0001;   
 endcase
 end

 endmodule
