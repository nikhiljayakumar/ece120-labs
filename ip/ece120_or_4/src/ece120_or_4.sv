module ece120_or_4(
    input logic op1, op2, op3, op4,
    output logic res
    );
    assign res = op1 | op2 | op3 | op4;
endmodule