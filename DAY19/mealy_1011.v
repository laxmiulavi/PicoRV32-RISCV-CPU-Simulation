module mealy_1011 (
    input clk,
    input x,
    output reg y
);

reg [1:0] state;

parameter S0 = 2'b00,
          S1 = 2'b01,
          S2 = 2'b10,
          S3 = 2'b11;

initial begin
    state = S0;
    y = 0;
end

always @(posedge clk)
begin
    case(state)

        S0: begin
            if(x)
                state <= S1;
            else
                state <= S0;
            y <= 0;
        end

        S1: begin
            if(x)
                state <= S1;
            else
                state <= S2;
            y <= 0;
        end

        S2: begin
            if(x)
                state <= S3;
            else
                state <= S0;
            y <= 0;
        end

        S3: begin
            if(x) begin
                state <= S1;
                y <= 1;
            end
            else begin
                state <= S2;
                y <= 0;
            end
        end

        default: begin
            state <= S0;
            y <= 0;
        end

    endcase
end

endmodule
