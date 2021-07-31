module sign_extend(input [15:0] data, output reg[31:0] res);

always @(*)begin

	if (data[15] == 0)
		res <= {{16{0}},data};
        else 
		res <= {{16{1}},data};

end
endmodule 		