//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
//Date        : Tue Feb 20 19:58:22 2024
//Host        : fastx3-28.ews.illinois.edu running 64-bit AlmaLinux release 8.9 (Midnight Oncilla)
//Command     : generate_target vending_machine_control_logic.bd
//Design      : vending_machine_control_logic
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "vending_machine_control_logic,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=vending_machine_control_logic,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=12,numReposBlks=12,numNonXlnxBlks=12,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "vending_machine_control_logic.hwdef" *) 
module vending_machine_control_logic
   (A,
    P,
    S0,
    S1,
    S2);
  output A;
  output P;
  input S0;
  input S1;
  input S2;

  wire S0_1;
  wire S1_1;
  wire S2_1;
  wire ece120_nand_2_1_res;
  wire ece120_nand_2_2_res;
  wire ece120_nand_2_3_res;
  wire ece120_nand_3_0_res;
  wire ece120_nor_2_1_res;
  wire ece120_nor_2_2_res;
  wire ece120_not_1_res;
  wire ece120_not_2_res;
  wire ece120_not_3_res;
  wire ece120_not_4_res;
  wire ece120_not_5_res;
  wire ece120_not_6_res;

  assign A = ece120_not_3_res;
  assign P = ece120_nand_2_3_res;
  assign S0_1 = S0;
  assign S1_1 = S1;
  assign S2_1 = S2;
  vending_machine_control_logic_ece120_nand_2_0_1 ece120_nand_2_1
       (.op1(S0_1),
        .op2(S2_1),
        .res(ece120_nand_2_1_res));
  vending_machine_control_logic_ece120_nand_2_0_2 ece120_nand_2_2
       (.op1(S2_1),
        .op2(ece120_not_4_res),
        .res(ece120_nand_2_2_res));
  vending_machine_control_logic_ece120_nand_2_2_0 ece120_nand_2_3
       (.op1(ece120_nand_2_2_res),
        .op2(ece120_nand_3_0_res),
        .res(ece120_nand_2_3_res));
  vending_machine_control_logic_ece120_nand_3_0_0 ece120_nand_3_0
       (.op1(ece120_not_6_res),
        .op2(S1_1),
        .op3(ece120_not_5_res),
        .res(ece120_nand_3_0_res));
  vending_machine_control_logic_ece120_nor_2_0_1 ece120_nor_2_1
       (.op1(S2_1),
        .op2(ece120_not_2_res),
        .res(ece120_nor_2_1_res));
  vending_machine_control_logic_ece120_nor_2_0_2 ece120_nor_2_2
       (.op1(ece120_not_1_res),
        .op2(ece120_nor_2_1_res),
        .res(ece120_nor_2_2_res));
  vending_machine_control_logic_ece120_not_0_1 ece120_not_1
       (.op(ece120_nand_2_1_res),
        .res(ece120_not_1_res));
  vending_machine_control_logic_ece120_not_0_2 ece120_not_2
       (.op(S1_1),
        .res(ece120_not_2_res));
  vending_machine_control_logic_ece120_not_0_3 ece120_not_3
       (.op(ece120_nor_2_2_res),
        .res(ece120_not_3_res));
  vending_machine_control_logic_ece120_not_0_4 ece120_not_4
       (.op(S1_1),
        .res(ece120_not_4_res));
  vending_machine_control_logic_ece120_not_0_5 ece120_not_5
       (.op(S2_1),
        .res(ece120_not_5_res));
  vending_machine_control_logic_ece120_not_4_0 ece120_not_6
       (.op(S0_1),
        .res(ece120_not_6_res));
endmodule
