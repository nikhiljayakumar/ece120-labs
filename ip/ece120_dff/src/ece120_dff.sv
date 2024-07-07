module ece120_dff (
    input logic      D,
    input logic      rst_n,
    input logic      clk,
    output logic     Q,
    output logic     Q_n
);

    logic data;
    assign Q = data;
    assign Q_n = ~data;
    
    always_ff @ (posedge clk or negedge rst_n) begin
        data <= rst_n ? D : 1'b0;
    end

endmodule