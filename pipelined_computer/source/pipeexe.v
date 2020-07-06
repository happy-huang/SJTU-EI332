module pipeexe(ealuc,ealuimm,ea,eb,eimm,esa,eshift,ern0,epc4,ejal,ern,ealu);
		 // ezero,ert,wrn,wdi,malu,wwreg
					
	input [3:0] ealuc;
	input [4:0] ern0;
	input [31:0] ea, eb, eimm, epc4, esa;
	input ealuimm, ejal, eshift;
	
	output [31:0] ealu;
	output [4:0] ern;
	
	wire [31:0] alua, alub, alur;
	
	//assign epc8 = epc4 + 4;
	
	mux2x32 alu_a(ea, esa, eshift, alua);
	mux2x32 alu_b(eb, eimm, ealuimm, alub);
	
	alu alu_unit(alua, alub, ealuc, alur);
	
	mux2x32 link(alur,epc4, ejal, ealu ); //
	
	assign ern = ern0 | {5{ejal}}; //判断是写入31号寄存器还是保持不变。

endmodule

	
	