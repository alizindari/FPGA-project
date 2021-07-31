module incrementer(input clk,input [31:0] data,output reg[31:0] res);

initial begin
res=0;
end
reg [3:0] temp=0;
always @(posedge clk)begin
temp = temp+1;
if (temp == 2)begin
	res <= data+1;
	temp = 0;
end
end


endmodule 