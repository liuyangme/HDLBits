module top_module(
    input clk,
    input in,
    input reset,
    output out); //

    parameter A = 0;
    parameter B = 1;
    parameter C = 2;
    parameter D = 3;

    reg [3:0] state;
    reg [3:0] next_state;

    // State transition logic
    always @(*) begin
        next_state[A] = (state[A]&&(~in)) || (state[C]&&(~in));
        next_state[B] = (state[A]&&in) || (state[B]&&in) || (state[D]&&in);
        next_state[C] = (state[B]&&(~in)) || (state[D]&&(~in));
        next_state[D] = (state[C]&&in);
    end
    // State flip-flops with synchronous reset
    always @(posedge clk) begin
        if(reset)
        begin
            state <= 4'b0001;
        end
        else
        begin
            state <= next_state;
        end
    end

    // Output logic
    assign out = state[D];

endmodule