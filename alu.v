module alu(input clk,input [31:0] a,b,input [3:0] sel,output reg [31:0] res,output reg zero);

always @(posedge clk)begin

if (a == b) zero <= 1 ;else zero <= 0;

case(sel)
4'b0000: res <= a & b;
4'b0001: res <= a | b;
4'b0010: res <= a+b;
4'b0110: res <= a-b;
4'b0111: if (a<b) res <= 1; else if(b<a) res <= 0;
4'b1100: res <= ~(a | b);

endcase 

end 
endmodule
