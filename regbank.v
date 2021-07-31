module registerbank #(parameter M=5, N=32) (input clk,regwrite,jump_link,
					    input [4:0] read_reg_1,read_reg_2,write_reg,
		                            input [31:0] write_data,
				            output reg[31:0] read_data_1,read_data_2); 

reg [31:0] mem [0:31];

initial begin
mem[0] <= 0;
//mem[2] = 3;
mem[5] = 15;
end

always @(posedge clk) begin 
	if (regwrite == 1)
		mem[write_reg] <= write_data;
	if (jump_link == 1)
 		mem[31] <= write_data;
	
end 

always @(*)begin
	read_data_1 <= mem[read_reg_1];
	read_data_2 <= mem[read_reg_2];		
end

endmodule
