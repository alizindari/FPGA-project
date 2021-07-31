module shift(input [25:0] data,output reg[27:0] res);

always @(*)begin

res = {data,2'b00};

end

endmodule
