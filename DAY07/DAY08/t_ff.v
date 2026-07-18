module t_ff (
    input t,
    input clk,
    output reg q
);

always @(posedge clk)
begin
    if (t)
        q <= ~q;
    else
        q <= q;
end

endmodule
