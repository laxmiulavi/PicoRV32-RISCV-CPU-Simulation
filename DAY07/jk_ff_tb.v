`timescale 1ns/1ps

module jk_ff_tb;

    reg j, k, clk;
    wire q;

    
    jk_ff uut (
        .j(j),
        .k(k),
        .clk(clk),
        .q(q)
    );

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    
    initial begin
        $display("Time\tClk\tJ\tK\tQ");
        $monitor("%0t\t%b\t%b\t%b\t%b", $time, clk, j, k, q);

        j = 0; k = 0; #10;   // No change
        j = 0; k = 1; #10;   // Reset
        j = 1; k = 0; #10;   // Set
        j = 1; k = 1; #10;   // Toggle
        j = 1; k = 1; #10;   // Toggle again

        $finish;
    end

endmodule
