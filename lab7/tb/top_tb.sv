module top_tb;

    timeunit 10ps;
    timeprecision 10ps;

    // This lab uses clock in a weird way compared to common sequential logics
    bit refclk;
    initial refclk = 1'b1;
    always #(1) refclk = ~refclk;

    logic rst_n, clk, T, A, P;
    vending_machine dut(.*);
    task init();
        clk = 1'b0;
        T   = 1'b0;
        rst_n = 1'b1;
    endtask

    task reset();
        rst_n <= 1'b0;
        @(posedge refclk);
        rst_n <= 1'b1;
        @(posedge refclk);
    endtask

    task quarter();
        T   <= 1'b1;
        @(posedge refclk);
        clk <= 1'b1;
        @(posedge refclk);
        T   <= 1'b0;
        @(posedge refclk);
        clk <= 1'b0;
        @(posedge refclk);
    endtask

    task dime();
        @(posedge refclk);
        clk <= 1'b1;
        repeat(2) @(posedge refclk);
        clk <= 1'b0;
        @(posedge refclk);
    endtask

    function assertAP(logic expected_A, logic expected_P);
        assert(expected_A === A)
        else begin
            $error("%0t: Incorrect A detected, should be %x, but is %x", $time, expected_A, A);
        end

        assert(expected_P === P)
        else begin
            $error("%0t: Incorrect P detected, should be %x, but is %x", $time, expected_P, P);
        end
    endfunction

    initial begin
        init();
        reset();
        /*** Insert your coin below ***/
        quarter();
        assertAP(1, 0);
        quarter();
        assertAP(0, 0);
        dime();
        assertAP(1, 1);
        quarter();
        assertAP(1, 0);
        dime();
        assertAP(1, 1);
        dime();
        assertAP(1, 0);
        dime();
        assertAP(0, 0);
        quarter();
        assertAP(1, 1);
        dime();
        assertAP(1, 0);
        /******************************/
        $finish;
    end

endmodule : top_tb
