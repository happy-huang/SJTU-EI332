module pipeid (mwreg,mrn,ern,ewreg,em2reg,mm2reg,dpc4,inst,ins, 
               wrn,wdi,ealu,malu,mmo,wwreg,
					mem_clock,resetn,
					bpc,jpc,pcsource,wpcir,
					dwreg,dm2reg,dwmem,daluc,daluimm,
					da,db,dimm,dsa,drn,dshift,djal,
					drs,drt, dbubble); 
					
	input [4:0] mrn, wrn, ern, drs, drt;
	input em2reg,mm2reg,ewreg,wwreg,mwreg,mem_clock,resetn;
	input [31:0] dpc4,ins, inst, wdi, ealu, malu, mmo;  //wdi: wb阶段返回值
	
	output wire dwreg,dm2reg,dwmem,daluimm,dshift,djal,wpcir, dbubble;
	output wire [1:0] pcsource;
	output wire [3:0] daluc;
	output wire [4:0] drn;
	output wire [31:0] da, db, dimm, dsa, bpc, jpc; 
	
	wire [5:0] op =   inst[31:26];
	wire [4:0] rs =   inst[25:21];
	wire [4:0] rt =   inst[20:16];
	wire [4:0] rd =   inst[15:11];
	assign dsa = {27'b0, inst[10:6]};
	wire [5:0] func = inst[5:0];
	
	wire z = (da==db);

	wire wmem, wreg, regrt, m2reg,shift,aluimm, jal, sext;
	wire [3:0] aluc;
	sc_cu cu(op, func, z, wmem, wreg, regrt, m2reg, aluc, shift,aluimm, pcsource, jal, sext);
	
	wire [31:0] qa,qb;
	regfile rf(rs,rt,wdi,wrn,wwreg,mem_clock,resetn,qa,qb);
	

	// data hazard
	assign wpcir = ~(em2reg & ((ern == rs) | (ern == rt)) & ~wmem ) ;
	
	assign dwreg = (wpcir==1)?wreg:1'b0;
	assign dm2reg = (wpcir==1)?m2reg:1'b0;
	assign dwmem = (wpcir==1)?wmem:1'b0;
	assign daluimm = (wpcir==1)?aluimm:1'b0;
	assign dshift = (wpcir==1)?shift:1'b0;
	assign djal = (wpcir==1)?jal:1'b0;
	assign daluc = (wpcir==1)?aluc:4'b0;
	assign drn = (regrt==1)?rt:rd;
	
	
	assign jpc = {dpc4[31:28], inst[25:0], 2'b0};
	wire se = sext & inst[15];
	assign dimm = {{16{se}}, inst[15:0]};
	wire [31:0] imm;
	assign imm = dimm << 2;
	assign bpc = dpc4 + imm;
	
	wire [1:0] fwa, fwb;
	assign fwa[0]= (ewreg & ~em2reg & ern!=0 & ern == rs) | (mm2reg & mrn==rs & mrn!=0);
	assign fwa[1]= (mwreg & ~mm2reg & mrn == rs & ern != rs & mrn != 0) | (mm2reg & mrn == rs & mrn != 0); 
	assign fwb[0] = (ewreg & ~em2reg & ern == rt & ern != 0) | ( mm2reg & mrn == rt & mrn != 0);
	assign fwb[1] = (mwreg & ~mm2reg & mrn == rt & ern != rt & mrn != 0) | (mm2reg & mrn == rt & mrn != 0); 
	
	mux4x32 forwarding_da(qa,ealu,malu,mmo,fwa,da);
	mux4x32 forwarding_db(qb,ealu,malu,mmo,fwb,db);
	
	//control hazards
	assign dbubble=pcsource[0] | pcsource[1];
	
endmodule
	
	
	
	
	