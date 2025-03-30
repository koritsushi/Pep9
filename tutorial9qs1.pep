BR       main
counter: .WORD 1
limit:   .WORD 10

c_msg:   .ASCII "counter: \x00" 
nl:      .ASCII "\n\x00"
main:    LDWA counter,d
       
loop:    CPWA limit,d
         BRGT fin
         ADDA 1,i
         STWA counter,d
         STRO c_msg,d 
         DECO counter,d
         STRO nl,d
         BR  main
         
fin:     STOP 


.END