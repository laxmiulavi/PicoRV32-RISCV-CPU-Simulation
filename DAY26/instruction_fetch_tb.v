`timescale 1ns/1ps

module instruction_fetch_tb;

reg clk;
reg reset;
reg load;
reg [31:0] pc_in;

wire [31:0] pc_out;
wire [31:0] instruction;

instruction_fetch uut (
    .clk(clk),
    .reset(reset),
    .load(load),
    .pc_in(pc_in),
    .pc_out(pc_out),
    .instruction(instruction)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Test stimulus
initial begin
    $display("Time\tPC_Out\t\tInstruction");
    $monitor("%0t\t%h\t%h", $time, pc_out, instruction);

    reset = 1;
    load = 0;
    pc_in = 32'h00000000;
    #10;

    reset = 0;

    // PC = 0
    #10;

    // PC = 4
    #10;

    // PC = 8
    #10;

    // PC = 12
    #10;

    // Load a new PC value
    load = 1;
    pc_in = 32'h00000008;
    #10;

    load = 0;
    #20;

    $finish;
end

endmodule
