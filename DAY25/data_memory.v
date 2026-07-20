module data_memory (
    input clk,
    input we,
    input [31:0] address,
    input [31:0] write_data,
    output reg [31:0] read_data
);

reg [31:0] memory [0:255];

integer i;

initial begin
    for (i = 0; i < 256; i = i + 1)
        memory[i] = 32'h00000000;
end

// Write
always @(posedge clk)
begin
    if (we)
        memory[address[9:2]] <= write_data;
end

// Read
always @(*)
begin
    read_data = memory[address[9:2]];
end

endmodule
