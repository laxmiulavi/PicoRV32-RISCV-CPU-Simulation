module moore_1011 (
    input clk,
    input x,
    output reg y
);

reg [2:0] state;

parameter S0 = 3'b000,
          S1 = 3'b001,
          S2 = 3'b010,
          S3 = 3'b011,
          S4 = 3'b100;

initial begin
    state = S0;
    y = 0;
end

always @(posedge clk)
begin
    case (state)

        S0: begin
            if (x)
                state <= S1;
            else
                state <= S0;
        end

        S1: begin
            if (x)
                state <= S1;
            else
                state <= S2;
        end

        S2: begin
            if (x)
                state <= S3;
            else
                state <= S0;
        end

        S3: begin
            if (x)
                state <= S4;
            else
                state <= S2;
        end

        S4: begin
            if (x)
                state <= S1;
            else
                state <= S2;
        end

        default:
            state <= S0;

    endcase

    // Moore output
    if (state == S4)
        y <= 1;
    else
        y <= 0;

end

endmodule
