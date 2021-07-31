module register(input clk,input [31:0] in,output reg[31:0] res);

initial begin
res=0;
end
always @(*)begin
	res = in;
end


endmodule 