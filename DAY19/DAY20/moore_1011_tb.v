`timescale 1ns/1ps

module moore_1011_tb;

    reg clk, x;
    wire y;

    // Instantiate the DUT
    moore_1011 uut (
        .clk(clk),
        .x(x),
        .y(y)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Apply input sequence
    initial begin
        $display("Time\tClk\tX\tY");
        $monitor("%0t\t%b\t%b\t%b", $time, clk, x, y);

        // Input sequence: 1011011
        x = 1; #10;
        x = 0; #10;
        x = 1; #10;
        x = 1; #10;
        x = 0; #10;
        x = 1; #10;
        x = 1; #10;

        $finish;
    end

endmodule
