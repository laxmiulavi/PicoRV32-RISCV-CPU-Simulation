module sipo (
    input clk,
    input din,
    output reg [3:0] q
);

initial
    q = 4'b0000;

always @(posedge clk)
begin
    q <= {q[2:0], din};
end

endmodule
