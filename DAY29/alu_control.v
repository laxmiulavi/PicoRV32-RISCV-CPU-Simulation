module alu_control (
    input [1:0] ALUOp,
    input [2:0] funct3,
    input [6:0] funct7,
    output reg [3:0] ALUCtrl
);

always @(*) begin
    case (ALUOp)

        // Load/Store -> ADD
        2'b00:
            ALUCtrl = 4'b0010;

        // Branch -> SUB
        2'b01:
            ALUCtrl = 4'b0110;

        // R-Type
        2'b10: begin
            case ({funct7, funct3})
                10'b0000000000: ALUCtrl = 4'b0010; // ADD
                10'b0100000000: ALUCtrl = 4'b0110; // SUB
                10'b0000000111: ALUCtrl = 4'b0000; // AND
                10'b0000000110: ALUCtrl = 4'b0001; // OR
                default:         ALUCtrl = 4'b1111;
            endcase
        end

        // I-Type (ADDI)
        2'b11: begin
            case (funct3)
                3'b000: ALUCtrl = 4'b0010; // ADDI
                3'b111: ALUCtrl = 4'b0000; // ANDI
                3'b110: ALUCtrl = 4'b0001; // ORI
                default: ALUCtrl = 4'b1111;
            endcase
        end

        default:
            ALUCtrl = 4'b1111;

    endcase
end

endmodule
