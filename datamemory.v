module datamemory #(parameter M=7, N=32) (input clk,
					memread,
					memwrite,
					input [6:0] address,
					input [31:0] write_data,
					output reg[31:0] read_data); 

reg [31:0] mem [0:127];

initial begin
mem[13] = 3;
end
	
always @(posedge clk) begin 
if (memwrite)
    mem[address] <= write_data;		
end 

always @(*)begin
if (memread)
    read_data = mem[address];
end

endmodule
