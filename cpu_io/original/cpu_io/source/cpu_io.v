module cpu_io(
		reset, clk, SW0,SW1,SW2,SW3,SW4,SW5,SW6,SW7,SW8,SW9,
		HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
		
		input reset, clk;
		input SW0,SW1,SW2,SW3,SW4,SW5,SW6,SW7,SW8,SW9;
		
		
		output [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;
		
		wire clock_out;
		wire [31:0] in_port0,in_port1;
		wire [31:0] out_port0, out_port1, out_port2;
		wire [31:0] pc,aluout,ins;
		wire [31:0] io_read_data,mem_dataout;
		
		clock_and_mem_clock inst(clk, clock_out);
		
		in_port inst1(SW0,SW1,SW2,SW3,SW4, in_port0);
		in_port inst2(SW5,SW6,SW7,SW8,SW9, in_port1);
		
		sc_computer_main inst4(reset,clock_out, clk, pc,ins,aluout,memout,imem_clk,dmem_clk,
							out_port0,out_port1,out_port2,in_port0,in_port1,mem_dataout,io_read_data);
		
		out_port_seg inst5(out_port0, HEX0, HEX1);
		out_port_seg inst6(out_port1, HEX2, HEX3);
		out_port_seg inst7(out_port2, HEX4, HEX5);
endmodule
		
		