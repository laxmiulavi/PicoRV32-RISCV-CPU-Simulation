module alu4bit (
    input [3:0] a,
    input [3:0] b,
    input [2:0] sel,
    output reg [3:0] y
);

always @(*)
begin
    case (sel)
        3'b000: y = a + b;    // Addition
        3'b001: y = a - b;    // Subtraction
        3'b010: y = a & b;    // AND
        3'b011: y = a | b;    // OR
        3'b100: y = a ^ b;    // XOR
        3'b101: y = ~a;       // NOT
        3'b110: y = a << 1;   // Left Shift
        3'b111: y = a >> 1;   // Right Shift
        default: y = 4'b0000;
    endcase
end

endmodule
