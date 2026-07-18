module sync_counter4 (
    input clk,
    output reg [3:0] q
);

initial
    q = 4'b0000;

always @(posedge clk)
begin
    q <= q + 1;
end

endmodule
