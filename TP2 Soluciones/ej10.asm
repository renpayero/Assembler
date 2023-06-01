	list p=16f84
	#include <p16f84.inc>

conta	equ	0x10
lista	equ	0x20

	org 0x00
	
	movlw	lista
	movwf	FSR		; inicializar puntero FSR con la dirección de la lista
	movlw	.16
	movwf	conta		; conta = 16

	movlw	2		; W = 2
bucle:	movwf	INDF		; W -> registro apuntado por FSR
	incf	FSR		; incrementar el puntero FSR
	addlw	2		; incrementar W en 2
	decfsz	conta		; decrementar el contador y si el resultado
				; es 0, saltear la próxima instrucción
	goto bucle		; iterar nuevamente

	end
