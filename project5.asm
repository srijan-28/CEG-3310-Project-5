
.ORIG x3000

MAIN
    LD R6, STACK

    LEA R0, PROMPT
    PUTS

    GETC
    OUT

    LD R1, NEG48
    ADD R0, R0, R1
    ST R0, N

    JSR FIB
    ST R0, RESULT

    LEA R0, NEWLINE
    PUTS

    LEA R0, MSG1
    PUTS

    LD R0, N
    LD R1, ASCII
    ADD R0, R0, R1
    OUT

    LEA R0, MSG2
    PUTS

    LD R0, RESULT
    JSR PRINT

    HALT

; fibonacci function
FIB
    ADD R6, R6, #-1
    STR R7, R6, #0

    ADD R6, R6, #-1
    STR R1, R6, #0

    ADD R6, R6, #-1
    STR R2, R6, #0

    ADD R1, R0, #0

    ADD R2, R0, #-1
    BRnz DONE

    ADD R0, R1, #-1
    JSR FIB

    ADD R6, R6, #-1
    STR R0, R6, #0

    ADD R0, R1, #-2
    JSR FIB

    LDR R2, R6, #0
    ADD R0, R0, R2
    ADD R6, R6, #1

DONE
    LDR R2, R6, #0
    ADD R6, R6, #1

    LDR R1, R6, #0
    ADD R6, R6, #1

    LDR R7, R6, #0
    ADD R6, R6, #1

    RET

; print result
PRINT
    ADD R6, R6, #-1
    STR R7, R6, #0

    ADD R6, R6, #-1
    STR R1, R6, #0

    ADD R6, R6, #-1
    STR R2, R6, #0

    AND R1, R1, #0
    ADD R2, R0, #0

TEN
    ADD R2, R2, #-10
    BRn LAST
    ADD R1, R1, #1
    BR TEN

LAST
    ADD R2, R2, #10

    ADD R6, R6, #-1
    STR R2, R6, #0

    ADD R1, R1, #0
    BRz ONES

    LD R0, ASCII
    ADD R0, R0, R1
    OUT

ONES
    LDR R2, R6, #0
    LD R0, ASCII
    ADD R0, R0, R2
    OUT

    ADD R6, R6, #1

    LDR R2, R6, #0
    ADD R6, R6, #1

    LDR R1, R6, #0
    ADD R6, R6, #1

    LDR R7, R6, #0
    ADD R6, R6, #1

    RET

PROMPT  .STRINGZ "Please enter a number n: "
MSG1    .STRINGZ "F("
MSG2    .STRINGZ ") = "
NEWLINE .STRINGZ "\n"

NEG48   .FILL #-48
ASCII   .FILL #48
STACK   .FILL x4000

N       .BLKW 1
RESULT  .BLKW 1

.END
