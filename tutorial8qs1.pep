         BR      main
number: .EQUATE 0            ;local variable #2d
;
main:    SUBSP 2,i           ;push #number
         DECI number,s       ;scanf("%d", &number)
if:      LDWA number,s       ;if (number < 0)
         BRGE endif          
         LDWA number,s       ;number = -number
         NEGA
         STWA number,s
endif:   DECO number,s       ;prinf("%d", number)
         ADDSP 2,i           ;pop #number
         STOP
         .END