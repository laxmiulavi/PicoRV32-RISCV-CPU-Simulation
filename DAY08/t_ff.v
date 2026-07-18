module t_ff (
    input t,
    input clk,
    output reg q
);

initial
    q = 1'b0;

always @(posedge clk)
begin
    if (t)
        q <= ~q;
    else
        q <= q;
end

endmodule
