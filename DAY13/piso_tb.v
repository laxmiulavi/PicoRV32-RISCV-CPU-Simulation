`timescale 1ns/1ps

module piso_tb;

    reg clk, load;
    reg [3:0] d;
    wire sout;

    // Instantiate the DUT
    piso uut (
        .clk(clk),
        .load(load),
        .d(d),
        .sout(sout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        $display("Time\tClk\tLoad\tD\t\tSout");
        $monitor("%0t\t%b\t%b\t%b\t%b",
                 $time, clk, load, d, sout);

        d = 4'b1011;
        load = 1; #10;      // Load data

        load = 0; #40;      // Shift out 4 bits

        $finish;
    end

endmodule
