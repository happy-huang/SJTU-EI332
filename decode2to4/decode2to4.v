module decode2to4 (Y, Ena, A1, A2);
	input Ena, A1, A2;
	output[3:0] Y;
	wire nA2, nA1;
	
	not n1(nA1, A1), n2(nA2,A2);
	nand nd1(Y[0], Ena, nA1, nA2), nd2(Y[1],Ena, nA1, A2),
		  nd3(Y[2], Ena, A1, nA2), nd4(Y[3], Ena, A1, A2);
endmodule