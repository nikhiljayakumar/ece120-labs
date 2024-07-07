.ORIG x3000
GETC 
AND R1, R0, #-1 ; R1 holds character for bit 0

GETC
AND R2, R0, #-1 ; R2 holds character for bit 1

LD R3, FONTADDR  
GETC

LD R6, FOUR  ;
LEFTSHIFTHEX ADD R0, R0, R0 ; left shift R0
             ADD R6, R6, #-1;
             BRp LEFTSHIFTHEX

ADD R3, R3, R0 ; R3 holds address for pixel map
LEA R0, INIT
ADD R0, R0, #-1 ; R0 holds pointer to start of string containing single row

OUTERLOOP LD R5, ROW      ; R5 <- ROW value
          ADD R5, R5, #-1 ; R5 <- R5 - 1
          BRz DONE        ; if row value is zero we are done
          ST R5, ROW      ; ROW value <- R5
          ADD R3, R3, #1 ; R3 <- current row (b/c can't add by 16 in one step)
          LD R4, MASK     ; R4 <- mask
          LD R5, COL
          BR INNERLOOP

INNERLOOP ADD R4, R4, R4 ; left shift mask
          LDR R6, R3, #0 ; R6 <- mem[R3]
          AND R6,R4,R6   ; R6 <- if mask true or false, only used for cc
          BRnp BITONE    ;

          ADD R6, R0, R5 ; R6 <- index of character being manipulated, 
          STR R1, R6, #0 ; mem[R0+R5] <- R0 (bit zero character into string)
          ADD R5, R5, #-1;
          BRz PRINT
          BR INNERLOOP

BITONE    ADD R6, R0, R5 ; R6 <- index of character being manipulated 
          STR R2, R6, #0 ; mem[R0+R5] <- R0 (bit one character into string)
          ADD R5, R5, #-1;
          BRz PRINT
          BR INNERLOOP

PRINT     PUTS
          BR OUTERLOOP

DONE      HALT

FONTADDR .FILL x3FFF ; address of font_data.asm
MASK     .FILL x0080 ; bitmask that is left shifted in each inner loop iteration
ROW      .FILL x0011 ; outer loop for each row, initialized to 17
COL      .FILL x0008 ; inner loop for each col, initialized to 8
FOUR     .FILL x0004 ; need for counter to left shift pixel map ascii value
INIT     .BLKW x0008 ; init block of 8 memory locations (holding one row)
NEWLINE  .FILL x000a ; newline character after one row
NULTERM  .FILL x0000 ; null terminating so puts knows where to stop
.END
