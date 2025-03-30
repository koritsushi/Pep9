BR main
bonus: .EQUATE 6 ; constant
exam1: .EQUATE 4  ; local variable #2d
exam2: .EQUATE 2  ; local variable #2d
score: .EQUATE 0  ; local variable #2d
;
main:    SUBSP 6,i
         DECI exam1,s        ; scanf("%d\n %d\n", exam1, exam2);
         DECI exam2,s
         LDWA exam1,s        ; score = (exam 1
         ADDA exam2,s        ; + exam2)
         ASRA                ; / 2
         ADDA bonus,i        ; + bonus
         STWA score,s
         STRO msg,d          ;printf("score = %d", 
         DECO score,s        ; score);
         LDBA '\n',i
         ADDSP 6,i
         STOP

msg:     .ASCII "score = \x00"
         .END