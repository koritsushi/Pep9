     BR main               ; Jump over data section

num:  .WORD 0              ; Reserve memory for user input
quot: .WORD 0              ; Store quotient (num / 2)
rem:  .WORD 0              ; Store remainder (num % 2)
two:  .WORD 2              ; Constant value 2

Prompt:  .ASCII "Enter a number: \x00"
EvenMsg: .ASCII "Even Number!\x00"
OddMsg:  .ASCII "Odd Number!\x00"


main:    STRO Prompt, d       ; Display "Enter a number: "
         DECI num, d          ; Read number from user

         ; Initialize quotient to 0
         LDWA 0, i 
         STWA quot, d

         ; Copy num for subtraction loop
         LDWA num, d
         STWA rem, d          ; Store original value for remainder checking

div_loop: CPWA two, d     ; Compare num with 2
         BRLT str_rem        ; If num < 2, remainder found 
    
         SUBA two, d         ; num = num - 2
      STWA num, d

      LDWA quot, d        ; Load quotient
      ADDA 1, i           ; Increment quotient 
      STWA quot, d        ; Store new quotient

      LDWA num, d        ; Load quotient
      BR div_loop         ; Repeat loop

str_rem: STWA rem, d       ; Store remainder correctly
      CPWA 0, i            ; Compare remainder with 0 
      BREQ even            ; If remainder == 0, branch to "even"

      STRO OddMsg, d       ; Print "Odd Number!"
      BR end               ; End program

even: STRO EvenMsg, d      ; Print "Even Number!"

end:  STOP
.END