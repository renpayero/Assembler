; L trabaja con la parte izquierda F trabaja con las variables
;FSR    ES UN REGISTRO
;W ES UN REGISTRO 
;
;EJERCICIO 4 ¨que hace el siguiente fragmento de codigo?


        clrf resultado          ;clrf (clear) limpia la variable resultado, resultado=0
        movlw   0x20            ; MUEVE el valor 20 al registro W
        movwf   fsr             ; MUEVE el valor de w al registro fsr
        movlw   d'10'           ; LA d' es de Decimal ; mueve el valor 10 en decimal a W
        movwf   contador        ; MUEVE el valor de W a contador, contador=10
bucle:  movf indf, 0            ; MUEVE a W el valor de indf(indf es el valor de la direccion
                                ; de memoria que apunta a fsr)
        addwf   resultado       ; Suma w+resultado y se guarda en resultado por la F
        incf    fsr             ;Incrementa fsr
        decfsz  contador        ;sz verifica que el valor sea distinto de 0, decrementa contador 
                                ;cuando el contador sea 0 ignora la siguiente linea de codigo
                                ; o sea 'goto buble'
        goto    bucle           ;salta a bucle