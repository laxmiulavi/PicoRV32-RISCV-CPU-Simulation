module instruction_fetch (
    input clk,
    input reset,
    input load,
    input [31:0] pc_in,
    output reg [31:0] pc_out,
    output [31:0] instruction
);

reg [31:0] imem [0:255];

initial begin
    imem[0] = 32'h00000013; // nop
    imem[1] = 32'h00100093; // addi x1, x0, 1
    imem[2] = 32'h00200113; // addi x2, x0, 2
    imem[3] = 32'h001101B3; // add x3, x2, x1
end

always @(posedge clk or posedge reset)
begin
    if (reset)
        pc_out <= 32'h00000000;
    else if (load)
        pc_out <= pc_in;
    else
        pc_out <= pc_out + 32'h00000004;
end

assign instruction = imem[pc_out[9:2]];

endmodule
