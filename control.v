

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:03:37 10/24/2016 
// Design Name: 
// Module Name:    Control 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Control(
    input [5:0] inst_in,
    output reg RegDst,
	 output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg [1:0] ALUop,
    output reg MemWrite,
    output reg ALUsrc,		
    output reg RegWrite,
    output reg jump_reg,
    output reg jump,
    output reg jump_link
    );
always @(*)
begin
   if(inst_in == 6'b000000)//R_type
	begin
	RegDst = 1;
	ALUsrc = 0;
	MemtoReg = 0;
	RegWrite = 1;
	MemRead = 0;
	MemWrite = 0;
	Branch = 0;
	ALUop[1] = 1;
	ALUop[0] = 0;
	end
	
	else if(inst_in == 6'b100011)//load
	begin
	RegDst = 0;
	ALUsrc = 1;
	MemtoReg = 1;
	RegWrite = 1;
	MemRead = 1;
	MemWrite = 0;
	Branch = 0;
	ALUop[1] = 0;
	ALUop[0] = 0;
	end
	
	else if(inst_in == 6'b001000)//addi
	begin
	RegDst = 0;
	ALUsrc = 1;
	MemtoReg = 0;
	RegWrite = 1;
	MemRead = 1;
	MemWrite = 0;
	Branch = 0;
	ALUop[1] = 0;
	ALUop[0] = 0;
	end
	else if(inst_in == 6'b001100)//andi
	begin
	RegDst = 0;
	ALUsrc = 1;
	MemtoReg = 0;
	RegWrite = 1;
	MemRead = 1;
	MemWrite = 0;
	Branch = 0;
	ALUop[1] = 1;
	ALUop[0] = 0;
	end
	else if(inst_in == 6'b001101)//ori
	begin
	RegDst = 0;
	ALUsrc = 1;
	MemtoReg = 0;
	RegWrite = 1;
	MemRead = 1;
	MemWrite = 0;
	Branch = 0;
	ALUop[1] = 1;
	ALUop[0] = 0;
	end

	else if(inst_in == 6'b000100)//branch
	begin
	ALUsrc = 0;
	RegWrite = 0;
	MemRead = 0;
	MemWrite = 0;
	Branch = 1;
	ALUop[1] = 0;
	ALUop[0] = 1;
	end

	else if(inst_in == 6'b100000)//jump register
	begin
	jump_reg = 1;
	jump = 0;
        end

	else if(inst_in == 6'b110000)//jump 
	begin
	jump = 1;
	jump_reg = 0;
        end

	else if(inst_in == 6'b111000)//jump and link
	begin
	jump = 1;
	jump_reg = 0;
	jump_link = 1;
	MemtoReg = 0;
        end
end

endmodule
