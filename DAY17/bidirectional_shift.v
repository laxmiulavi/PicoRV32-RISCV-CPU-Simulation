module bidirectional_shift (
    input clk,
    input dir,
    input sin,
    output reg [3:0] q
);

initial
    q = 4'b0000;

always @(posedge clk)
begin
    if (dir)
        q <= {q[2:0], sin};    // Shift Left
    else
        q <= {sin, q[3:1]};    // Shift Right
end

endmodule
