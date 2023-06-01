clrf	resultado		; resultado = 0
	movlw	0x20		; W = 20
	movwf	FSR		; mueve el valor de W al registro FSR para usar direccionamiento indirecto
	movlw	d'10'		; W = 10
	movwf	contador	; W -> contador
bucle:	movf	INDF, 0		; mueve a W el valor del registro INDF, que contiene el valor de la dirección apuntada por FSR
	addwf	resultado	; resultado = resultado + W
	incf	FSR		; incrementa el puntero FSR para apuntar a la dirección siguiente
	decfsz	contador	; decrementa el contador y si el valor decrementado es cero,saltea la próxima instrucción
	goto	bucle		; itera nuevamente

; Dado que en 0x20 comenzaba la lista de los primeros diez números pares, resultado contendrá la suma de los mismos.
; resultado = 00 + 02 + 04 + 06 + 08 + 10 + 12 + 14 + 16 + 18 = 90 = 5A
