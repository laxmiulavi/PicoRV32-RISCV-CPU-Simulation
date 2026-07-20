module datapath(
    input clk,
    input reset,
    output reg [31:0] pc,
    output [31:0] instruction
);

reg [31:0] imem [0:255];
integer i;

initial begin
    for(i=0; i<256; i=i+1)
        imem[i] = 32'h00000013;   // NOP

    imem[0] = 32'h00000013; // nop
    imem[1] = 32'h00100093; // addi x1,x0,1
    imem[2] = 32'h00200113; // addi x2,x0,2
    imem[3] = 32'h001101B3; // add x3,x2,x1
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        pc <= 32'h00000000;
    else
        pc <= pc + 32'h00000004;
end

assign instruction = imem[pc[9:2]];

endmodule

