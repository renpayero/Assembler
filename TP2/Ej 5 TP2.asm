   
; BTS: BIT TEST FLAGS    
;EJERCICIO 5 a ANALIZAR EL SIGUIENTE FRAGMENTO DE CODIGO


            movf    var1, 0         ;mueve a w el valor de var1
            sublw   5               ;resta a w 5
            btfsc   STATUS, C       ;STATUS ve los flags,C de carry, si es carry es 0
                                    ; saltea la signfuiente instruccion
                                    ;si el carry es 1 la ejecuta 
            goto    bloque1         ; Salta al bloque1
            movlw   2               ; mueve a W el valor 2
            goto    bloque2         ; Salta a bloque2
bloque1:    movlw   1               ; Mueve a w el valor 1
bloque2:    movwf   var2            ; mueve el valor del registro w a var 2          


;EJERCICIO 5 b 

            movf    var1,0          ;Mueve a w el valor de var1
            sublw   42              ; resta a w 42 y guarda en el registro 42
            btfsc   STATUS, Z       ; ve si Z es 0 o 1, si es 0 salta si es 1 continua
            goto    bloque1         ; salta al bloque1
            clrf    var2            ; limpia var2, queda en 0
            goto    bloque2         ; salta a bloque2
bloque1:    movlw   1               ;mueve a w el valor 1
            movwf   var2            ;mueve a var 2 el valor de w
bloque2:    nop                     ;no hace nada