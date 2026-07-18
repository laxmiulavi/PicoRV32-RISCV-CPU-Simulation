module siso (
    input clk,
    input din,
    output reg [3:0] q,
    output sout
);

initial
    q = 4'b0000;

always @(posedge clk)
begin
    q <= {q[2:0], din};
end

assign sout = q[3];

endmodule
