`timescale 1ns/1ps

module bidirectional_shift_tb;

    reg clk, dir, sin;
    wire [3:0] q;

    // Instantiate the DUT
    bidirectional_shift uut (
        .clk(clk),
        .dir(dir),
        .sin(sin),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        $display("Time\tClk\tDir\tSin\tQ");
        $monitor("%0t\t%b\t%b\t%b\t%b",
                 $time, clk, dir, sin, q);

        // Shift Left
        dir = 1; sin = 1; #10;
        sin = 0; #10;
        sin = 1; #10;

        // Shift Right
        dir = 0; sin = 0; #10;
        sin = 1; #10;
        sin = 0; #10;

        $finish;
    end

endmodule
