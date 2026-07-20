`timescale 1ns/1ps

module instruction_decoder_tb;

reg [31:0] instruction;

wire [6:0] opcode;
wire [4:0] rd;
wire [2:0] funct3;
wire [4:0] rs1;
wire [4:0] rs2;
wire [6:0] funct7;

instruction_decoder uut (
    .instruction(instruction),
    .opcode(opcode),
    .rd(rd),
    .funct3(funct3),
    .rs1(rs1),
    .rs2(rs2),
    .funct7(funct7)
);

initial begin
    $display("Time\tInstruction\tOpcode\tRD\tRS1\tRS2\tFunct3\tFunct7");
    $monitor("%0t\t%h\t%b\t%d\t%d\t%d\t%b\t%b",
             $time, instruction, opcode, rd, rs1, rs2, funct3, funct7);

    instruction = 32'h00000013; // nop
    #10;

    instruction = 32'h00100093; // addi x1,x0,1
    #10;

    instruction = 32'h00200113; // addi x2,x0,2
    #10;

    instruction = 32'h001101B3; // add x3,x2,x1
    #10;

    $finish;
end

endmodule
