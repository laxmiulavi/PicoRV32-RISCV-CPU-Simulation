module universal_shift_register (
    input clk,
    input [1:0] sel,
    input sin_left,
    input sin_right,
    input [3:0] d,
    output reg [3:0] q
);

initial
    q = 4'b0000;

always @(posedge clk)
begin
    case (sel)
        2'b00: q <= q;                      // Hold
        2'b01: q <= {sin_left, q[3:1]};     // Shift Right
        2'b10: q <= {q[2:0], sin_right};    // Shift Left
        2'b11: q <= d;                      // Parallel Load
        default: q <= 4'b0000;
    endcase
end

endmodule
