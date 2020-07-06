module clock_and_mem_clock( clock, clock_out);
	input clock;
	output clock_out;
	reg clock_out;
	
	initial
	begin 
		clock_out = 0;
	end

	always @(posedge clock)
		begin
		clock_out <= ~clock_out;
		end
endmodule
		
	
	