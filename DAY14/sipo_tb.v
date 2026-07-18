`timescale 1ns/1ps

module sipo_tb;

    reg clk, din;
    wire [3:0] q;

    // Instantiate the DUT
    sipo uut (
        .clk(clk),
        .din(din),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        $display("Time\tClk\tDin\tQ");
        $monitor("%0t\t%b\t%b\t%b",
                 $time, clk, din, q);

        din = 1; #10;
        din = 0; #10;
        din = 1; #10;
        din = 1; #10;
        din = 0; #10;
        din = 1; #10;

        $finish;
    end

endmodule
