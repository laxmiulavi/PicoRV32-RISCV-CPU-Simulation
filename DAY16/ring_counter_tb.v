`timescale 1ns/1ps

module ring_counter_tb;

    reg clk;
    wire [3:0] q;

    // Instantiate the DUT
    ring_counter uut (
        .clk(clk),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        $display("Time\tClk\tQ");
        $monitor("%0t\t%b\t%b", $time, clk, q);

        #80;
        $finish;
    end

endmodule
