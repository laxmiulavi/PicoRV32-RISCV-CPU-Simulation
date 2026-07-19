`timescale 1ns/1ps

module program_counter_tb;

    reg clk;
    reg reset;
    reg load;
    reg [31:0] pc_in;
    wire [31:0] pc_out;

    program_counter uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .pc_in(pc_in),
        .pc_out(pc_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\tReset\tLoad\tPC_IN\t\tPC_OUT");
        $monitor("%0t\t%b\t%b\t%h\t%h",
                 $time, reset, load, pc_in, pc_out);

        reset = 1;
        load = 0;
        pc_in = 32'h00000000;
        #10;

        reset = 0;
        #20;

        load = 1;
        pc_in = 32'h00000040;
        #10;

        load = 0;
        #20;

        load = 1;
        pc_in = 32'h00000100;
        #10;

        load = 0;
        #20;

        $finish;
    end

endmodule
