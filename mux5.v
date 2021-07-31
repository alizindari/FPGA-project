
module mux5(input [4:0] a,b,input s,output reg[4:0] res);

always @(a or b or s)begin 

	res = 0;
	if (s == 0)
		res = a;
	else
	    res = b;
end

endmodule
		