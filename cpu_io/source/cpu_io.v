module cpu_io(reset, clk, HL
);
		
		input reset, clk;
		output [31:0] HL;
		
		wire clock_out,imem_clk,dmem_clk;
		wire [31:0] in_port0,in_port1;
		wire [31:0] out_port0, out_port1, HL, memout;
		wire [31:0] pc,aluout,ins;
		wire [31:0] io_read_data,mem_dataout;
		
		clock_and_mem_clock inst(clk, clock_out);
		
		sc_computer_main inst4(reset,clock_out, clk, pc,ins,aluout,memout,imem_clk,dmem_clk,
							out_port0,out_port1,HL ,in_port0,in_port1,mem_dataout,io_read_data);
		
endmodule
		
		