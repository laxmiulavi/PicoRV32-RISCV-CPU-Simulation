`timescale 1ns/1ps

module sr_ff_tb;

    reg s, r, clk;
    wire q;

    // Instantiate the DUT
    sr_ff uut (
        .s(s),
        .r(r),
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
        $display("Time\tClk\tS\tR\tQ");
        $monitor("%0t\t%b\t%b\t%b\t%b",
                 $time, clk, s, r, q);

        s = 0; r = 0; #10;   // No change
        s = 1; r = 0; #10;   // Set
        s = 0; r = 1; #10;   // Reset
        s = 1; r = 1; #10;   // Invalid
        s = 0; r = 0; #10;   // No change

        $finish;
    end

endmodule
