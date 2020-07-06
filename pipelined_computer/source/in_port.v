module in_port(sw0,sw1,sw2,sw3,sw4, inportout);
	input sw0,sw1,sw2,sw3,sw4;
	
	output[31:0] inportout;
	
	assign inportout = {27'b0, sw4,sw3,sw2,sw1,sw0};

endmodule
