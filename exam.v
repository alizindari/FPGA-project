module register #(size)(input data[size-1:0],input clock,reset,output [size-1:0]result);



genvar i;

generate begin

	for (i=0;i<size;i = i+1)begin
		jk_ff(clock,(!reset&data[i]),(reset|!data[i]),result[i]);
	end
		
endgenerate		

endmodule 