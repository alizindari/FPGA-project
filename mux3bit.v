module mux3bit(input [31:0] a,b,c,input jump,jump_reg,output reg [31:0] res);


always @(*)begin

res=0;
if (jump == 0 && jump_reg == 0)
   res = a;
else if (jump == 0 && jump_reg == 1)
   res = b;
else if (jump == 1 && jump_reg == 0)
   res = c;

end

endmodule
