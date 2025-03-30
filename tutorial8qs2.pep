;Question 2
     BR main               ; Jump over data section

x:      .WORD 0            ; Reserve memory for x
y:      .WORD 0            ; Reserve memory for y
z:      .WORD 0            ; Reserve memory for z
result: .WORD 0            ; Store final result
temp:   .WORD 0            ; Temporary storage for multiplication
counter:.WORD 0            ; Counter for multiplication

PromptX: .ASCII "Enter x: \x00"
PromptY: .ASCII "Enter y: \x00"
PromptZ: .ASCII "Enter z: \x00"
Message: .ASCII "The computed result is: \x00"

main: STRO PromptX, d      ; Display "Enter x: "
      DECI x, d            ; Read x from user

      STRO PromptY, d      ; Display "Enter y: "
      DECI y, d            ; Read y from user

      STRO PromptZ, d      ; Display "Enter z: "
      DECI z, d            ; Read z from user

      ; Compute (x + y)
      LDWA x, d           
      ADDA y, d           
      STWA temp, d        ; Store (x + y) in temp

      ; Initialize multiplication
      LDWA 0, i          ; result = 0 
      STWA result, d      

      LDWA z, d           ; Load z (number of iterations)
      STWA counter, d     ; Store counter

mult_l:  CPWA 0, i          ; If counter == 0, stop multiplication 
         BREQ subtract   

         LDWA result, d      ; Load result
         ADDA temp, d        ; result = result + temp
         STWA result, d      ; Store new result

         LDWA counter, d     ; Decrease counter
         SUBA 1, i 
         STWA counter, d
           BR mult_l    ; Repeat loop

subtract: LDWA result, d      ; Load multiplication result
         SUBA 10, i         ; Subtract 10 
         STWA result, d      ; Store final result

         STRO Message, d     ; Display "The computed result is: "
         DECO result, d      ; Print the result

         STOP
         .END