	list p=16f84
	#include <p16f84.inc>

var	equ	10
inv	equ	11
conta	equ	12	

	org 0x00

	movlw	b'10011010'
	movwf	var		; inicializar el valor a invertir

	movlw	8
	movwf	conta		; inicializar contador

bucle:	rrf	var		; rotar var a la derecha, el LSB va a C
	rlf	inv		; rotar inv a la izquierda, C va al LSB
	decfsz	conta		; decrementar el contador y si el resultado
				; es 0, saltear la próxima instrucción
	goto bucle		; iterar nuevamente

	end
