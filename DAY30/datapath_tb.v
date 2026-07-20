`timescale 1ns/1ps

module datapath_tb;

reg clk;
reg reset;

wire [31:0] pc;
wire [31:0] instruction;

datapath uut(
    .clk(clk),
    .reset(reset),
    .pc(pc),
    .instruction(instruction)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;

    #10 reset = 0;

    $display("----------------------------------------");
    $display("Time\tPC\t\tInstruction");
    $display("----------------------------------------");

    repeat(6)
    begin
        @(posedge clk);
        $display("%0t\t%h\t%h", $time, pc, instruction);
    end

    $finish;
end

endmodule
