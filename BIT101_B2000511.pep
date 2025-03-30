BR main             

seed:    	       .WORD 0            ; Stores user input seed
a:       	       .WORD 37           ; Multiplier for LCG
c:       	       .WORD 11           ; Increment for LCG
m:       	       .WORD 50           ; Modulus for LCG (ensures number between 1-50)
randNum: 	       .WORD 0            ; Stores the generated random number
maxNum:          .WORD 0
temp:    	       .WORD 0            ; Temporary storage
product: 	       .WORD 0            ; Stores multiplication result
count:   	       .WORD 0            ; Stores iteration count        
guess:           .WORD 0


TooHigh:         .ASCII "Too high! Try again. \x00"
TooLow:          .ASCII "Too low! Try again. \x00"
Correct:         .ASCII "Correct! \x00"

p_seed:          .ASCII "Enter a seed value: \x00"
p_guess1:        .ASCII "guess the number:[1-\x00"
p_guess2:        .ASCII "]\x00"
Message:         .ASCII "Generated Random Number: \x00"

main:            STRO p_seed, d       ; Display "Enter a seed value: " 
                 DECI seed, d         ; Read user input and store in `seed`

                 ; Initialize product to 0
                 LDWA 0, i           
                 STWA product, d       

                 ; Multiply manually: product = seed * a
                 LDWA a, d            ; Load `a` into count
                 STWA count, d        ; Store it as iteration count

                 LDWA seed, d         ; Load seed value
                 STWA temp, d         ; Store it temporarily

mul_loop:        CPWA 0, i           ; Check if count is zero 
                 BREQ mul_done        ; Exit loop if count is zero

                 LDWA product, d      ; Load current product value
                 ADDA temp, d         ; Multiply using repeated addition
                 STWA product, d      ; Store updated product

                 LDWA count, d        ; Load count
                 SUBA 1, i           ; Decrease count by 1
                 STWA count, d        ; Store updated count
                 BR mul_loop          ; Repeat loop

mul_done:        LDWA product, d      ; Load multiplication result
                 ADDA c, d            ; Add increment c

                 ; Perform modulus manually (mod m)
mod_loop:        CPWA m, d            ; Compare value with m
                 BRLT store_re        ; If value < m, exit loop
                 SUBA m, d            ; Otherwise, subtract m
                 BR mod_loop          ; Repeat

store_re:        ADDA 1,i           ; Ensure range is between 1-50
                 STWA randNum, d      ; Store the generated number
                 STRO Message, d      ; Display "Generated Random Number: " 
                 DECO randNum, d      ; Print the random number
                 LDWA randNum, d
                 ADDA 1,i
                 STWA maxNum, d 
                 STRO nl,d
                 BR checker       

checker:         STRO p_guess1,d
                 DECO maxNum,d
                 STRO p_guess2,d
                 DECI guess, d
                 LDWA guess, d       
                 CPWA randNum, d         
                 BREQ correct         
                 BRGT too_high        
                 BRLT too_low         

too_high:        STRO TooHigh, d
                 STRO nl,d
                 BR checker 

too_low:         STRO TooLow, d 
                 STRO nl,d
                 BR checker           

nl:              .ASCII "\n\x00"

correct:         STRO Correct, d      
                 STOP
.END