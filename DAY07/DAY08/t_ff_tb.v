`timescale 1ns/1ps

module t_ff_tb;

    reg t, clk;
    wire q;

   
    t_ff uut (
        .t(t),
        .clk(clk),
        .q(q)
    );

   
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    
    initial begin
        $display("Time\tClk\tT\tQ");
        $monitor("%0t\t%b\t%b\t%b", $time, clk, t, q);

        t = 0; #10;  
        t = 1; #10;   
        t = 1; #10;   
        t = 0; #10;   
        t = 1; #10;   

        $finish;
    end

endmodule
