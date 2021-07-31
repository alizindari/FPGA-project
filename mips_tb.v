`timescale 10ns/10ns
module mips_tb();

reg clk;
wire RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUsrc,RegWrite,zero,jump_reg,jump,jump_link;
wire [31:0] pc_output,instruct,m2_out,m3_out,read_data_1,read_data_2,si_out,alu_out,read_data,new_pc,add_out,m4_out,m5_out;
wire [4:0] m1_out;
wire [1:0] ALUop;
wire [3:0] alu_con_out;
wire [27:0] shift_out;           
mips m(clk,RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUsrc,RegWrite,zero,jump_reg,jump,jump_link,
       pc_output,instruct,m2_out,m3_out,
       read_data_1,read_data_2,si_out,alu_out,
       read_data,m1_out,ALUop,alu_con_out,new_pc,add_out,m4_out,m5_out,shift_out);


initial begin
clk = 0;
forever begin
#10
clk = ~clk;
end

end

endmodule 