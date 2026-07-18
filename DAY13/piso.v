module piso (
    input clk,
    input load,
    input [3:0] d,
    output reg sout
);

reg [3:0] q;

initial
begin
    q = 4'b0000;
    sout = 1'b0;
end

always @(posedge clk)
begin
    if (load)
        q <= d;                  // Parallel Load
    else begin
        sout <= q[3];            // Serial Output
        q <= {q[2:0], 1'b0};     // Shift Left
    end
end

endmodule
