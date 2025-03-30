BR main               ; Jump over data section

seed:    		.WORD 0            ; Stores user input seed
a:       		.WORD 37           ; Multiplier for LCG
c:       		.WORD 11           ; Increment for LCG
m:       		.WORD 50           ; Modulus for LCG (ensures number between 1-50)
randNum: 		.WORD 0            ; Stores the generated random number
temp:    		.WORD 0            ; Temporary storage
product: 		.WORD 0            ; Stores multiplication result
count:   		.WORD 0            ; Stores iteration count

Prompt:   .ASCII "Enter a seed value: \x00"
Message:  .ASCII "Generated Random Number: \x00"

main:            STRO Prompt, d       ; Display "Enter a seed value: "
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
                 BRLT store_re ; If value < m, exit loop
                 SUBA m, d            ; Otherwise, subtract m
                 BR mod_loop          ; Repeat

store_re:        ADDA 1, i           ; Ensure range is between 1-50
                 STWA randNum, d      ; Store the generated number

                 STRO Message, d      ; Display "Generated Random Number: "
                 DECO randNum, d      ; Print the random number

                 STOP
.END