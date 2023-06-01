list p=16f84
#incluide <p16f84.inc>

        var equ 10  ;Es la direccion de memoria 10
        inv equ 11
        conta equ 12 

        org 0x00
        movlw   b'10011010'
        movwf   var
        movlw   8
        movwf   conta

bucle:  rrf var         ;Rota a la derecha el vector y guarda el digito de la derecha en el carry
        rlf inv         ;Rota a la izquierda tomando la posicion del carry referida a F
        decfsz  conta   ;decrementa conta hasa que llega a 0
        goto bucle 
END          