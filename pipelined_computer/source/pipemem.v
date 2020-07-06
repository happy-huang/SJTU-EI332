module pipemem(mwmem,malu,mb,clock,mem_clock,mmo,resetn,  
					real_in_port0,real_in_port1,real_out_port0,real_out_port1, real_out_port2,real_out_port3); 
	input mwmem,clock,mem_clock,resetn;
	input [31:0] malu, mb, real_in_port0, real_in_port1;
	
	output [31:0] real_out_port0,real_out_port1, real_out_port2,real_out_port3;
	output [31:0] mmo;
	wire [31:0]		mem_dataout, io_read_data;
	wire dmem_clk;
	 wire write_enable;
	 assign     write_enable = mwmem; //注意
	 assign     dmem_clk = mem_clock ; //注意  
	 
	 wire write_datamem_enable = write_enable & (~malu[7]); //注意 
	 wire write_io_enable = write_enable & malu[7]; //注意   
	 mux2x32 io_data_mux(mem_dataout,io_read_data,malu[7],mmo); 
	 //添加子模块，用于选择输出数据来源于内部数据存储器还是 IO， 
	 // module mux2x32 (a0,a1,s,y); 
	 // when address[7]=0, means the access is to the datamem. 
	 // that is, the address space of datamem is from 000000 to 011111 word(4 bytes) 
	 // when address[7]=1, means the access is to the I/O space. 
	 // that is, the address space of I/O is from 100000 to 111111 word(4 bytes)  
	 lpm_ram_dq_dram  dram (malu[6:2], dmem_clk, mb, write_datamem_enable, mem_dataout ); 
	 io_output io_output_reg (malu, mb, write_io_enable, dmem_clk, real_out_port0, real_out_port1,real_out_port2, real_out_port3);  
	 //添加子模块，用于完成对 IO 地址空间的译码，以及构成 IO 和 CPU内部之间的数据 输出通道 
	 io_input io_input_reg(malu, dmem_clk, io_read_data, real_in_port0, real_in_port1);  
	 //添加子模块，用于完成对 IO 地址空间的译码，以及构成 IO 和 CPU内部之间的数据 输入通道 
endmodule	