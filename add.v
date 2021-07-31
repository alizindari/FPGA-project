
module add(input [31:0] a,b,output reg[31:0] res);

always @(*)begin

	res = a + b;
	
end

endmodule