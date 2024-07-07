
module ece120_nor_2(
    input logic op1, op2,
    output logic res
    );
    assign res = ~(op1 | op2);
endmodule