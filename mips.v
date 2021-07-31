module mips(input clk,
	    output RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUsrc,RegWrite,zero,jump_reg,jump,jump_link,
	    output [31:0] pc_output,instruct,m2_out,m3_out,read_data_1,read_data_2,si_out,alu_out,read_data,
	    output [4:0] m1_out,
            output [1:0] ALUop,
	    output [3:0] alu_con_out,
	    output [31:0] new_pc,add_out,m4_out,m5_out,
            output [27:0] shift_out

 );

/*output wire [31:0] pc_output;
output wire [31:0] instruct;
output wire RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUsrc,RegWrite;
output wire [1:0] ALUop;
output wire [31:0] m1_out,m2_out,m3_out;
output wire [31:0] read_data_1,read_data_2;
output wire [31:0] si_out;
output wire [3:0] alu_con_out;
output wire zero;
output wire [31:0] alu_out;
output wire [31:0] read_data;
output wire [31:0] new_pc;
output wire [27:0] shift_out;*/

incrementer inc(clk,pc_output,new_pc);

register pc(clk,m5_out,pc_output);
instruction_mem ins_mem(clk,pc_output[4:0],instruct);
Control c(instruct[31:26],RegDst,Branch,MemRead,MemtoReg,ALUop,MemWrite,ALUsrc,RegWrite,jump_reg,jump,jump_link);
sign_extend si_ex(instruct[15:0],si_out);

add ad(new_pc,si_out,add_out);

shift sh(instruct[25:0],shift_out);

mux5 m1(instruct[20:16],instruct[15:11],RegDst,m1_out);
mux m2(read_data_2,si_out,ALUsrc,m2_out);
mux3bit m3(alu_out,read_data,new_pc,jump_link,MemtoReg,m3_out);
mux m4(new_pc,add_out,zero&Branch,m4_out);
mux3bit m5(m4_out,read_data_1,{new_pc[31:28],shift_out},jump,jump_reg,m5_out);
//always @(*) begin
//$display("%b",{new_pc[31:28],shift_out});
//end
registerbank rb(clk,RegWrite,jump_link,instruct[25:21],instruct[20:16],m1_out,m3_out,read_data_1,read_data_2);

ALU_control alu_con(ALUop,instruct[5:0],alu_con_out);
alu al(clk,read_data_1,m2_out,alu_con_out,alu_out,zero);

datamemory da_mem(clk,MemRead,MemWrite,alu_out[6:0],read_data_2,read_data);

endmodule
