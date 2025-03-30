;qs4
BR       main
a:       .WORD 0
b:       .WORD 0
p_a:     .ASCII "Enter a:\x00"
p_b:     .ASCII "Enter b:\x00"
p_sum:   .ASCII "The larger number is: \x00"

main:    STRO p_a,d
         DECI a,d
         STRO p_b,d
         DECI b,d
         BR if_cmp 

if_cmp:  LDWA a,d
         CPWA b,i
         BRLT else
         STRO p_sum,d 
         DECO a,d
         STOP

else:    STRO p_sum,d 
         DECO b,d
         STOP
.END
