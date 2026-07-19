`timescale 1ns/1ps

module alu4bit_tb;

    reg [3:0] a, b;
    reg [2:0] sel;
    wire [3:0] y;

    // Instantiate the DUT
    alu4bit uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        $display("Time\tSel\tA\tB\tY");
        $monitor("%0t\t%b\t%b\t%b\t%b",
                 $time, sel, a, b, y);

        a = 4'b1010;
        b = 4'b0011;

        sel = 3'b000; #10;   // ADD
        sel = 3'b001; #10;   // SUB
        sel = 3'b010; #10;   // AND
        sel = 3'b011; #10;   // OR
        sel = 3'b100; #10;   // XOR
        sel = 3'b101; #10;   // NOT
        sel = 3'b110; #10;   // Left Shift
        sel = 3'b111; #10;   // Right Shift

        $finish;
    end

endmodule
