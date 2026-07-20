module instruction_memory (
    input [31:0] address,
    output reg [31:0] instruction
);

reg [31:0] memory [0:3];

initial begin
    memory[0] = 32'h00000013; // nop
    memory[1] = 32'h00100093; // addi x1, x0, 1
    memory[2] = 32'h00200113; // addi x2, x0, 2
    memory[3] = 32'h001101B3; // add x3, x2, x1
end

always @(*)
begin
    instruction = memory[address[31:2]];
end

endmodule
