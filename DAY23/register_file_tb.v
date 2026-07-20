`timescale 1ns/1ps

module register_file_tb;

    reg clk;
    reg we;
    reg [4:0] rs1, rs2, rd;
    reg [31:0] write_data;
    wire [31:0] read_data1, read_data2;

    register_file uut (
        .clk(clk),
        .we(we),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\tWE\tRD\tWriteData\tRS1\tReadData1\tRS2\tReadData2");
        $monitor("%0t\t%b\t%d\t%h\t%d\t%h\t%d\t%h",
                 $time, we, rd, write_data, rs1, read_data1, rs2, read_data2);

        // Write x1
        we = 1;
        rd = 5'd1;
        write_data = 32'h11111111;
        #10;

        // Write x2
        rd = 5'd2;
        write_data = 32'h22222222;
        #10;

        // Read x1 and x2
        we = 0;
        rs1 = 5'd1;
        rs2 = 5'd2;
        #10;

        // Write x3
        we = 1;
        rd = 5'd3;
        write_data = 32'h33333333;
        #10;

        // Read x3 and x1
        we = 0;
        rs1 = 5'd3;
        rs2 = 5'd1;
        #10;

        $finish;
    end

endmodule
