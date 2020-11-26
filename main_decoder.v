module main_decoder(
    input [5:0] opcode,	
    output memToReg, memToWrite, branch, aluSrc, regToDst, regToWrite,
    output [1:0] aluOp
);

reg memToRegR, memToWriteR, branchR, aluSrcR, regToDstR, regToWriteR;
reg [1:0] aluOpR;

assign regToWrite  = regToWriteR;
assign regToDst    = regToDstR;
assign aluSrc      = aluSrcR;
assign branch      = branchR;
assign memToWrite  = memToWriteR;
assign memToReg    = memToRegR;
assign aluOp       = aluOpR;

always @*
begin
    case (opcode)
        6'h00:  
        begin   
            regToWriteR  = 1'b1;
            regToDstR    = 1'b1;
            aluSrcR      = 1'b0;
            branchR      = 1'b0;
            memToWriteR  = 1'b0;
            memToRegR    = 1'b0;
            aluOpR       = 2'b10;
        end
        6'h23:   
        begin
            regToWriteR  = 1'b1;
            regToDstR    = 1'b0;
            aluSrcR      = 1'b1;
            branchR      = 1'b0;
            memToWriteR  = 1'b0;
            memToRegR    = 1'b1;
            aluOpR       = 2'b00;
        end
        6'h2B:
        begin
            regToWriteR  = 1'b0;
            aluSrcR      = 1'b1;
            branchR      = 1'b0;
            memToWriteR  = 1'b1;
            aluOpR       = 2'b00;
        end
        6'h04:
        begin
            regToWriteR  = 1'b0;
            aluSrcR      = 1'b0;
            branchR      = 1'b1;
            memToWriteR  = 1'b0;
            aluOpR       = 2'b01;
        end
    endcase
end

endmodule