module fa_top_tb;

    timeunit 10ps;
    timeprecision 10ps;

    bit clk;
    initial clk = 1'b1;
    always #(1) clk = ~clk;

    bit a, b, Cin, Cout, s;
    full_adder dut(.*);

    function logic [1:0] expected_output(bit a, bit b, bit Cin, bit Cout, bit s);
        expected_output = a + b + Cin;
    endfunction

    function logic [1:0] actual_output(bit a, bit b, bit Cin, bit Cout, bit s);
        actual_output = {Cout, s};
    endfunction

    initial begin
        for (logic [1:0] i = 0; i < 2; ++i) begin
            for (logic [1:0] j = 0; j < 2; ++j) begin
                for (logic [1:0] k = 0; k < 2; ++k) begin
                    a   <= i[0];
                    b   <= j[0];
                    Cin <= k[0];
                    @(posedge clk)

                    assert (expected_output(a, b, Cin, Cout, s) === actual_output(a, b, Cin, Cout, s)) 
                    else begin
                        $error("%0t: Incorrect output detected, should be %x, but is %x", $time, expected_output(a, b, Cin, Cout, s), actual_output(a, b, Cin, Cout, s));
                    end
                end
            end
        end

        $finish;
    end

endmodule : fa_top_tb