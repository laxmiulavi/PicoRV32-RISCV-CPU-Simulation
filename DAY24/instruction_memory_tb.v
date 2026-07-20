`timescale 1ns/1ps

module instruction_memory_tb;

    reg [31:0] address;
    wire [31:0] instruction;

    // Instantiate the DUT
    instruction_memory uut (
        .address(address),
        .instruction(instruction)
    );

    initial begin
        $display("Time\tAddress\t\tInstruction");
        $monitor("%0t\t%h\t%h", $time, address, instruction);

        address = 32'h00000000; #10;   // memory[0] -> nop
        address = 32'h00000004; #10;   // memory[1] -> addi x1,x0,1
        address = 32'h00000008; #10;   // memory[2] -> addi x2,x0,2
        address = 32'h0000000C; #10;   // memory[3] -> add x3,x2,x1

        $finish;
    end

endmodule
