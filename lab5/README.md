# Combinational Logic Design
## Overview

![](./img/fsm.png)

- In labs 5 and 7, you will design a vending machine controller
- For this lab, you will design the **control logic** which will generate outputs for accepting coins `A` and dispensing products `P`
- Some of you may have noticed the lumetta notes mention this vending machine, please ignore it as the lab uses a different state scheme
- As you did in lab 3, start by creating a new project, import the ECE 120 IPs, and create a new block diagram. **Make sure to name the block diagram `vending_machine_control_logic`**
  * It **must** be named this or the testbench/autograder will not recognize it
- If you were working locally previous, starting with this lab, you **must** use `vivado 2023.1`
  * If you were working on EWS, do not worry about this

## Specifications
1. The vending machine will dispense a product when a total of 35 cents has been inserted
2. It may only accept quarters (25 cents) or dimes (10 cents)
3. It will only accept coins that can total to ***exactly*** 35 cents
4. It will also keep track of the history/state following the table below:
  * You will design the history tracking part in lab 7
  * `S2`, `S1`, and `S0` are then the outputs from that part
  * `S2` represents which coin was just inserted, except for states `000` and `100` in which we assume that nothing has been inserted. `S1` and `S0` represent which coin was previously inserted.

| S2 | S1 | S0 | Definition |
|----|----|----|------------|
| 0  | 0  | 0  | No money was previously inserted. No money has just been inserted | 
| 0  | 0  | 1  | A quarter was previously inserted. A quarter has just been inserted | 
| 0  | 1  | 0  | A dime was previously inserted. A quarter has just been inserted | 
| 0  | 1  | 1  | No money was previously inserted. A quarter has just been inserted |
| 1  | 0  | 0  | Unused | 
| 1  | 0  | 1  | A quarter was previously inserted. A dime has just been inserted | 
| 1  | 1  | 0  | A dime was previously inserted. A dime has just been inserted | 
| 1  | 1  | 1  | No money was previously inserted. A dime has just been inserted |

### Ports
| Port Name | Direction |
|-----------|-----------|
| S2        | input     |
| S1        | input     |
| S0        | input     |
| A         | output    |
| P         | output    |

`A` indicates whether the coin that has just been inserted should be accepted.  
`P` indicates whether the product should be dispensed.

### Constraints
While we don't have an area constraint for the simulation, do note that you will need to implement this on a breadboard in the next lab. 
So it is in your best interest to find the minimal area for your implementation.

### Testbench
[top_tb](./tb/top_tb.sv)
You will need to fill in the two lines (`L14` and `L22`) with the expected expression for `A` and `P`

#### How it works
Systemverilog is very similar to C. You should use C bitwise operators to fill in the above lines.  
For example, if your `expected_A` is `NOT(S2) AND S1`, you should write
```
function logic expected_A(logic S2, logic S1, logic S0, logic A, logic P);
    expected_A = ~S2 & S1;
endfunction
```

## Turn-ins
You must turn in both Github and Gradescope for full credit
### GitHub
1. Export the block design to a tcl script
  * Have the block diagram open in vivado
  * Click on, top left, `File->Export->Export Block Diagram->OK`
2. The exported tcl script **must** be named `lab5.tcl` and reside under the `lab5` directory in your github repo
  * The export will export to a default location to a default name, make sure you move it to the right place
```
your ece120 folder
  |-- lab4
  |-- lab5
        |--lab5.tcl
  ...
```

### Gradescope
Everything should be in a single PDF.
1. Truth tables and K-maps that define `A` and `P`
2. Simplified boolean expression for `A` and `P`
3. Screenshot (no picture of monitor) of the circuit diagrams.
4. Screenshot of both simulated waveforms

