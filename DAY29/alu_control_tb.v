`timescale 1ns/1ps

module alu_control_tb;

reg [1:0] ALUOp;
reg [2:0] funct3;
reg [6:0] funct7;
wire [3:0] ALUCtrl;

alu_control uut (
    .ALUOp(ALUOp),
    .funct3(funct3),
    .funct7(funct7),
    .ALUCtrl(ALUCtrl)
);

initial begin
    $display("Time\tALUOp\tfunct3\tfunct7\t\tALUCtrl");
    $monitor("%0t\t%b\t%b\t%b\t%b",
              $time, ALUOp, funct3, funct7, ALUCtrl);

    // ADD
    ALUOp = 2'b10; funct7 = 7'b0000000; funct3 = 3'b000; #10;

    // SUB
    ALUOp = 2'b10; funct7 = 7'b0100000; funct3 = 3'b000; #10;

    // AND
    ALUOp = 2'b10; funct7 = 7'b0000000; funct3 = 3'b111; #10;

    // OR
    ALUOp = 2'b10; funct7 = 7'b0000000; funct3 = 3'b110; #10;

    // ADDI
    ALUOp = 2'b11; funct3 = 3'b000; funct7 = 7'b0000000; #10;

    // Branch (SUB)
    ALUOp = 2'b01; funct3 = 3'b000; funct7 = 7'b0000000; #10;

    $finish;
end

endmodule
