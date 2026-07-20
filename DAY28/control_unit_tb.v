`timescale 1ns/1ps

module control_unit_tb;

reg [6:0] opcode;

wire RegWrite;
wire MemRead;
wire MemWrite;
wire ALUSrc;
wire MemtoReg;
wire Branch;
wire [1:0] ALUOp;

control_unit uut(
    .opcode(opcode),
    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .MemtoReg(MemtoReg),
    .Branch(Branch),
    .ALUOp(ALUOp)
);

initial begin
    $display("Opcode\t\tRegWrite MemRead MemWrite ALUSrc MemtoReg Branch ALUOp");

    opcode = 7'b0110011; #10; // R-type
    $display("%b\t%b\t %b\t %b\t   %b\t    %b\t    %b\t   %b",
              opcode, RegWrite, MemRead, MemWrite, ALUSrc, MemtoReg, Branch, ALUOp);

    opcode = 7'b0010011; #10; // addi
    $display("%b\t%b\t %b\t %b\t   %b\t    %b\t    %b\t   %b",
              opcode, RegWrite, MemRead, MemWrite, ALUSrc, MemtoReg, Branch, ALUOp);

    opcode = 7'b0000011; #10; // lw
    $display("%b\t%b\t %b\t %b\t   %b\t    %b\t    %b\t   %b",
              opcode, RegWrite, MemRead, MemWrite, ALUSrc, MemtoReg, Branch, ALUOp);

    opcode = 7'b0100011; #10; // sw
    $display("%b\t%b\t %b\t %b\t   %b\t    %b\t    %b\t   %b",
              opcode, RegWrite, MemRead, MemWrite, ALUSrc, MemtoReg, Branch, ALUOp);

    opcode = 7'b1100011; #10; // beq
    $display("%b\t%b\t %b\t %b\t   %b\t    %b\t    %b\t   %b",
              opcode, RegWrite, MemRead, MemWrite, ALUSrc, MemtoReg, Branch, ALUOp);

    $finish;
end

endmodule
