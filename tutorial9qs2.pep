BR       main

a:       .WORD 0
b:       .WORD 0
quot:    .WORD 0
rem:     .WORD 0

p_a:     .ASCII "Enter a:\x00"
p_b:     .ASCII "Enter b:\x00"
p_d:     .ASCII "a is divisible by b\x00"
p_nd:    .ASCII "a is not divisible by b\x00"
p_err:   .ASCII "err:division by zero\x00"

main:    STRO p_a,d          ;ask input from user to load into a
         DECI a,d
         
         STRO p_b,d          ;ask input from user to load into b
         DECI b,d

         LDWA b,d            ;load b into accumulator
         CPWA 0,i            ;cmp function call
         BREQ err            ;if b == 0
                             ;branch to err function to print error and stop program
         
         LDWA 0,i
         STWA quot,d         ;store accumulator value into variable quot = 0
         STWA rem,d          ;store accumulator value into variable rem = 0

         LDWA a,d            ;load a into accumulator
         STWA rem,d          ;rem = a

loop:    LDWA rem,d          ;load rem into accumulator
         CPWA b,d            ;cmp function call
         BRLT c_r            ;if rem < b then branch to function c_r 
         SUBA b,d            ;since rem is in accumulator this instruction call
                             ;subtract the accumulator which is rem - b
         STWA rem,d          ;whatever value left in accumulator was save into rem
                             ;rem = rem - b;
         LDWA quot,d         ;load quot into accumulator
         ADDA 1,i            ;quot + 1
         STWA quot,d         ;quot = quot + 1
         BR loop
         
c_r:     LDWA rem,d          ;load rem into accumulator
         CPWA 0,i            ;cmp function call acculator with this instruction call value
         BREQ div_err        ; if rem == 0, branch to div_err msg
         STRO p_nd,d
         STOP

div_err: STRO p_d,d
         STOP         

err:     STRO p_err,d
         STOP

.END
