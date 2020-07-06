module pipepc( npc,wpcir,clock,resetn,pc );
	input wire[31:0] npc;
	input clock, resetn, wpcir;
	
	output [31:0] pc;
	reg [31:0] pc;
	
	always @(posedge clock or negedge resetn)
	begin
		if (~resetn)
			begin
				pc <= -4;
			end
		else
			begin 
				if (wpcir)
					begin
					pc <= npc;
					end
			end
	end
endmodule

					
