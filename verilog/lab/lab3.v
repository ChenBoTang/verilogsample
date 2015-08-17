module lab3(x1,x2,x3,x4,g,f,h);
input x1,x2,x3,x4;
output g,f,h;
wire w1,w2,w3,w4,w5,w6;
and (w3,x1,x3);
and (w4,x2,x4);
or  (g,w3,w4);
not (w1,x3);
or  (w5,w1,x1);
not (w2,x2);
or  (w6,w2,x4);
and (h,w5,w6);
or  (f,g,h);
endmodule 