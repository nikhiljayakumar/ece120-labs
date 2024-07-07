module ece120_nand_3(
    input logic op1, op2, op3,
    output logic res
    );
    assign res = ~(op1 & op2 & op3);
endmodule