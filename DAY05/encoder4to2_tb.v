`timescale 1ns/1ps

module encoder4to2_tb;

    reg [3:0] d;
    wire [1:0] y;

    // Instantiate the DUT
    encoder4to2 uut (
        .d(d),
        .y(y)
    );

    initial begin
        $display("Time\tD\t\tY");
        $monitor("%0t\t%b\t%b", $time, d, y);

        d = 4'b0001; #10;
        d = 4'b0010; #10;
        d = 4'b0100; #10;
        d = 4'b1000; #10;

        // Invalid input
        d = 4'b0000; #10;

        $finish;
    end

endmodule
