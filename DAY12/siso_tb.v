`timescale 1ns/1ps

module siso_tb;

    reg clk, din;
    wire [3:0] q;
    wire sout;

    // Instantiate the DUT
    siso uut (
        .clk(clk),
        .din(din),
        .q(q),
        .sout(sout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Apply inputs
    initial begin
        $display("Time\tClk\tDin\tQ\t\tSout");
        $monitor("%0t\t%b\t%b\t%b\t%b",
                 $time, clk, din, q, sout);

        din = 1; #10;
        din = 0; #10;
        din = 1; #10;
        din = 1; #10;
        din = 0; #10;
        din = 1; #10;

        $finish;
    end

endmodule
