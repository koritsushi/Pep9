BR main          ; Branch to main

number: .EQUATE 0 ; Local variable
limit: .EQUATE 10 ; Constant

main: SUBSP 2,i   ; Allocate space for 'number'
STRO msg,d        ; Print message
DECI number,s     ; Input number

while: LDWA number,s ; Load 'number' into accumulator
CPWA limit,i      ; Compare 'number' with 'limit'
BRGE endwh        ; Branch to end if 'number >= limit'
ADDA 1,i          ; Increment 'number'
STWA number,s     ; Store updated 'number'
DECO number,s     ; Output 'number'
BR while          ; Repeat loop

endwh: STRO msg2,d ; Print newline
ADDSP 2,i         ; Deallocate space
STOP              ; End program

msg: .ASCII "Enter a positive integer:\x00"
msg2: .ASCII "\n\x00"
.END