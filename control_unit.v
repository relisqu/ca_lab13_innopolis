module control_unit(
	input [5:0] opCode, funct,
	output memToReg, memToWrite, branch, alusrc, regToDst, regToWrite,
 	output [2:0] aluControl
);
	wire [1:0] aluOp;
	main_decoder md(opCode, memToReg, MemToWrite, branch, alusrc, regToDst, regToWrite, aluOp);
	alu_decoder ad(aluOp, funct, aluControl);
endmodule