//名称：模18计数器
//作者：黄乐 518030910351
//功能：计数器从0开始计数，递增到17时再次归零，开始新的一轮计数。可以清零或重置。
//接口信号：clk：时钟，上升沿有效；
//			 clr：清零，高电平有效；
//			 ld: 重置，高有效，将counter重置为data值；
//			 data: 重置的数值
//			 counter：输出的计数值信号
module counter18(clk, 
					clr, 
					ld,  
					counter, 
					data); 
input clk, clr, ld;
input [4:0]data;
output [4:0]counter;
reg [4:0]counter;

always@(posedge clk or posedge clr)
	if (clr==1)
		counter<=0;
	else if(ld==1) 
		counter<=data;
	else if(counter>=17)
		counter<=0;
	else counter<=counter+1;

endmodule
