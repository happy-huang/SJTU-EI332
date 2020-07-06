module sc_datamem (  addr, datain, dataout,we,clock,mem_clk,dmem_clk,   
							out_port0,out_port1,out_port2,out_port3, in_port0,in_port1,mem_dataout,io_read_data );
					    //添加了 2个 32 位输入端口，3 个 32 位输出端口   
	input  [31:0]  addr;
   input  [31:0]  datain;
	input [31:0] in_port0,in_port1; 
	input          we, clock,mem_clk;
	
	output [31:0]  dataout;
   output         dmem_clk;
	output [31:0] out_port0,out_port1,out_port2,out_port3;  
	output [31:0] mem_dataout;  
	output [31:0] io_read_data; 
	
	 wire           dmem_clk;         
	 wire           write_enable;   
	 wire [31:0] dataout;  
	 wire [31:0] mem_dataout;  
	 wire 		write_datamem_enable;  
	 wire 		write_io_enable;   
	
	 assign     write_enable = we & ~clock; //注意
	 assign     dmem_clk = mem_clk & ( ~ clock) ; //注意  
	 //100000-111111:I/O ; 000000-011111:data 
	 assign write_datamem_enable = write_enable & (~addr[7]); //注意 
	 assign write_io_enable = write_enable & addr[7]; //注意   
	 mux2x32 io_data_mux(mem_dataout,io_read_data,addr[7],dataout); 
	 //添加子模块，用于选择输出数据来源于内部数据存储器还是 IO， 
	 // module mux2x32 (a0,a1,s,y); 
	 // when address[7]=0, means the access is to the datamem. 
	 // that is, the address space of datamem is from 000000 to 011111 word(4 bytes) 
	 // when address[7]=1, means the access is to the I/O space. 
	 // that is, the address space of I/O is from 100000 to 111111 word(4 bytes)  
	 
	 lpm_ram_dq_dram  dram (addr[6:2], dmem_clk, datain, write_datamem_enable, mem_dataout ); 
	 io_output io_output_reg (addr, datain, write_io_enable, dmem_clk, out_port0, out_port1,out_port2, out_port3);  
	 //添加子模块，用于完成对 IO 地址空间的译码，以及构成 IO 和 CPU内部之间的数据 输出通道 
	 //module io_output(addr,datain,write_io_enable,io_clk,out_port0,out_port1,out_port2 ); 
	 io_input io_input_reg(addr, dmem_clk, io_read_data, in_port0, in_port1);  
	 //添加子模块，用于完成对 IO 地址空间的译码，以及构成 IO 和 CPU内部之间的数据 输入通道 
	 //module io_input( addr,io_clk,io_read_data,in_port0,in_port1); 
	 
	 
endmodule 
 
	
	
	
	
	
	