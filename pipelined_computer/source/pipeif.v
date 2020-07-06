module pipeif(pcsource,pc,bpc,da,jpc,npc,pc4,ins,mem_clock, dbubble);

	input [1:0] pcsource;
	input mem_clock, dbubble;
	input [31:0] pc, bpc, da, jpc; 
	wire [31:0] ins_tmp;
	
	output [31:0] npc, pc4, ins; // npc: next pc
	wire [31:0] npc, pc4;
	reg [31:0] ins;
	
	mux4x32 nextpc(pc4, bpc, da, jpc, pcsource, npc);
	
	assign pc4 = pc+4;

	lpm_rom_irom irom(pc[7:2], mem_clock, ins_tmp);
	always @(ins_tmp)
	begin
		if (dbubble == 1) ins = 0;
		else ins= ins_tmp;
	end

endmodule
