module alu_decoder(
    input [1:0] aluOp,
    input [5:0] funct,
    output reg [2:0] aluControl
);

always @(aluOp, funct)
begin
    case (aluOp)
        2'b00:
        begin
            aluControl <= 3'b010;
        end
        2'b01:
        begin
            aluControl <= 3'b110;
        end
        2'b10:
	begin
            case (funct)
                6'h20:
                begin
                    aluControl <= 3'b010;
                end
                6'h22:
                begin
                    aluControl <= 3'b110;
                end
                6'h24:
                begin
                    aluControl <= 3'b000;
                end
                6'h25:
                begin
                    aluControl <= 3'b001;
                end
                6'h2A:
                begin
                    aluControl <= 3'b111;
                end
            endcase
        end
    endcase
end
endmodule
