;qs3 
BR      main
x:       .WORD 0
y:       .WORD 0
sum:     .WORD 0
temp:    .WORD 0
;
p_X:       .ASCII "Enter x:\x00"
p_Y:        .ASCII "Enter y:\x00"
p_result:   .ASCII "The division result is:\x00"
p_error:    .ASCII "Division by zero!\x00" 

main:            STRO p_X,d
                 DECI x,d
                 STRO p_Y,d
                 DECI y,d

                 LDWA y,d ; load y into acumulator
                 CPWA 0,i ; check if y == 0
                 BREQ error ; if y == 0, brnach to error

                 LDWA 0,i
                 STWA sum,d

                 LDWA x,d
                 STWA temp,d

div_loop:        CPWA y,d ; compare temp_x with y
                 BRLT done_div
                   
                 SUBA y,d
                 STWA temp,d
                 LDWA sum,d
                 ADDA 1,i
                 STWA sum,d
                 
                 LDWA temp,d
                 BR div_loop

done_div:        STRO p_result,d
                 DECO sum,d
                 BR   end

error:           STRO p_error,d ;Print "Error: Division by zero!"

end:             STOP
.END