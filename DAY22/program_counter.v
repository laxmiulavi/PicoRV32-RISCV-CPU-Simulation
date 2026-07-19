module program_counter (
    input clk,
    input reset,
    input load,
    input [31:0] pc_in,
    output reg [31:0] pc_out
);

always @(posedge clk or posedge reset)
begin
    if (reset)
        pc_out <= 32'h00000000;
    else if (load)
        pc_out <= pc_in;
    else
        pc_out <= pc_out + 32'h00000004;
end

endmodule
