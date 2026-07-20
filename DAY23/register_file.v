module register_file (
    input clk,
    input we,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input [31:0] write_data,
    output [31:0] read_data1,
    output [31:0] read_data2
);

reg [31:0] registers [31:0];

// Read ports
assign read_data1 = registers[rs1];
assign read_data2 = registers[rs2];

// Write port
always @(posedge clk)
begin
    if (we && rd != 5'd0)
        registers[rd] <= write_data;
end

endmodule
