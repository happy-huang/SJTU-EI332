module test(a,b,out1,out2); 
 input a,b; 
 output out1,out2; 
 assign out1 = a&b; 
 assign out2 = a|b; 
endmodule 