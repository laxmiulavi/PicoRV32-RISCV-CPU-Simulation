`timescale 1ns/1ps

module dff_tb;

    reg d, clk;
    wire q;

    // Instantiate the DUT
    dff uut (
        .d(d),
        .clk(clk),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Apply test inputs
    initial begin
        $display("Time\tClk\tD\tQ");
        $monitor("%0t\t%b\t%b\t%b", $time, clk, d, q);

        d = 0; #10;
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;

        $finish;
    end

endmodule
