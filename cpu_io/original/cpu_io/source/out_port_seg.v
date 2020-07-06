module out_port_seg(datain, HEX1, HEX2);
	input[31:0] datain;
	output [6:0] HEX1,HEX2;
	reg [6:0] HEX1,HEX2;
	
	wire[3:0] sig,dec;
	
	// sig 个位值； dec 十位值
	assign sig = datain%10;
	assign dec = datain/10;
	
	always @ (*)
		case(sig)
			0: HEX1 = 7'b100_0000; 
			1: HEX1 = 7'b111_1001;
			2: HEX1 = 7'b010_0100;
			3: HEX1 = 7'b011_0000;
			4: HEX1 = 7'b001_1001;
			5: HEX1 = 7'b001_0010;
			6: HEX1 = 7'b000_0010;
			7: HEX1 = 7'b111_1000;
			8: HEX1 = 7'b000_0000;
			9: HEX1 = 7'b001_0000;
			default: HEX1 = 7'b111_1111;
		endcase
	
	always @ (*)
		case(dec)
			0: HEX2 = 7'b100_0000; 
			1: HEX2 = 7'b111_1001;
			2: HEX2 = 7'b010_0100;
			3: HEX2 = 7'b011_0000;
			4: HEX2 = 7'b001_1001;
			5: HEX2 = 7'b001_0010;
			6: HEX2 = 7'b000_0010;
			7: HEX2 = 7'b111_1000;
			8: HEX2 = 7'b000_0000;
			9: HEX2 = 7'b001_0000;
			default: HEX2 = 7'b111_1111; 
		endcase

endmodule
