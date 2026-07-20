`timescale 1ns/1ps

module data_memory_tb;

    reg clk;
    reg we;
    reg [31:0] address;
    reg [31:0] write_data;
    wire [31:0] read_data;

    // Instantiate the DUT
    data_memory uut (
        .clk(clk),
        .we(we),
        .address(address),
        .write_data(write_data),
        .read_data(read_data)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        $display("Time\tWE\tAddress\t\tWrite_Data\tRead_Data");
        $monitor("%0t\t%b\t%h\t%h\t%h",
                 $time, we, address, write_data, read_data);

        // Write to memory[0]
        we = 1;
        address = 32'h00000000;
        write_data = 32'h11111111;
        #10;

        // Write to memory[1]
        address = 32'h00000004;
        write_data = 32'h22222222;
        #10;

        // Write to memory[2]
        address = 32'h00000008;
        write_data = 32'h33333333;
        #10;

        // Read memory[0]
        we = 0;
        address = 32'h00000000;
        #10;

        // Read memory[1]
        address = 32'h00000004;
        #10;

        // Read memory[2]
        address = 32'h00000008;
        #10;

        $finish;
    end

endmodule
