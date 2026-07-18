`timescale 1ns/1ps

module universal_shift_register_tb;

    reg clk;
    reg [1:0] sel;
    reg sin_left, sin_right;
    reg [3:0] d;
    wire [3:0] q;

    // Instantiate the DUT
    universal_shift_register uut (
        .clk(clk),
        .sel(sel),
        .sin_left(sin_left),
        .sin_right(sin_right),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        $display("Time\tClk\tSel\tD\tSL\tSR\tQ");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b",
                 $time, clk, sel, d, sin_left, sin_right, q);

        // Parallel Load
        d = 4'b1010;
        sel = 2'b11;
        sin_left = 0;
        sin_right = 0;
        #10;

        // Shift Right
        sel = 2'b01;
        sin_left = 1;
        #10;

        // Shift Left
        sel = 2'b10;
        sin_right = 0;
        #10;

        // Hold
        sel = 2'b00;
        #10;

        $finish;
    end

endmodule
