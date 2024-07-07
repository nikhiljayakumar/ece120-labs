module top_tb;

    timeunit 10ps;
    timeprecision 10ps;

    bit clk;
    initial clk = 1'b1;
    always #(1) clk = ~clk;

    logic S2, S1, S0, A, P;
    vending_machine_control_logic dut(.*);

    function logic expected_A(logic S2, logic S1, logic S0, logic A, logic P);
        expected_A = (S2&S0)|(!S2&S1);
    endfunction

    function logic actual_A(logic S2, logic S1, logic S0, logic A, logic P);
        actual_A = A;
    endfunction

    function logic expected_P(logic S2, logic S1, logic S0, logic A, logic P);
        expected_P = (S2&!S1)|(!S2&S1&!S0);
    endfunction

    function logic actual_P(logic S2, logic S1, logic S0, logic A, logic P);
        actual_P = P;
    endfunction

    initial begin
        for (logic [1:0] i = 0; i < 2; ++i) begin
            for (logic [1:0] j = 0; j < 2; ++j) begin
                for (logic [1:0] k = 0; k < 2; ++k) begin
                    S2   <= i[0];
                    S1   <= j[0];
                    S0   <= k[0];
                    @(posedge clk)

                    assert (expected_A(S2, S1, S0, A, P) === actual_A(S2, S1, S0, A, P)) 
                    else begin
                        $error("%0t: Incorrect A detected, should be %x, but is %x", $time, expected_A(S2, S1, S0, A, P), actual_A(S2, S1, S0, A, P));
                    end

                    assert (expected_P(S2, S1, S0, A, P) === actual_P(S2, S1, S0, A, P)) 
                    else begin
                        $error("%0t: Incorrect P detected, should be %x, but is %x", $time, expected_P(S2, S1, S0, A, P), actual_P(S2, S1, S0, A, P));
                    end
                end
            end
        end

        $finish;
    end

endmodule : top_tb
