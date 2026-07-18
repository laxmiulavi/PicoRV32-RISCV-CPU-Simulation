`timescale 1ns/1ps

module decoder2to4_tb;

    reg [1:0] sel;
    wire [3:0] y;

    // Instantiate the DUT
    decoder2to4 uut (
        .sel(sel),
        .y(y)
    );

    initial begin
        $display("Time\tSel\tY");
        $monitor("%0t\t%b\t%b", $time, sel, y);

        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        $finish;
    end

endmodule
