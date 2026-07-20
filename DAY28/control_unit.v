module control_unit (
    input  [6:0] opcode,

    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg ALUSrc,
    output reg MemtoReg,
    output reg Branch,
    output reg [1:0] ALUOp
);

always @(*) begin

    // Default values
    RegWrite = 0;
    MemRead  = 0;
    MemWrite = 0;
    ALUSrc   = 0;
    MemtoReg = 0;
    Branch   = 0;
    ALUOp    = 2'b00;

    case(opcode)

        // R-Type (add, sub, and, or...)
        7'b0110011: begin
            RegWrite = 1;
            ALUSrc   = 0;
            ALUOp    = 2'b10;
        end

        // I-Type (addi)
        7'b0010011: begin
            RegWrite = 1;
            ALUSrc   = 1;
            ALUOp    = 2'b11;
        end

        // Load (lw)
        7'b0000011: begin
            RegWrite = 1;
            MemRead  = 1;
            ALUSrc   = 1;
            MemtoReg = 1;
            ALUOp    = 2'b00;
        end

        // Store (sw)
        7'b0100011: begin
            MemWrite = 1;
            ALUSrc   = 1;
            ALUOp    = 2'b00;
        end

        // Branch (beq)
        7'b1100011: begin
            Branch = 1;
            ALUOp  = 2'b01;
        end

        default: begin
            RegWrite = 0;
            MemRead  = 0;
            MemWrite = 0;
            ALUSrc   = 0;
            MemtoReg = 0;
            Branch   = 0;
            ALUOp    = 2'b00;
        end

    endcase

end

endmodule
