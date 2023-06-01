	list p=16f84
	#include <p16f84.inc>

num1	equ	10
num2	equ	11
mayor	equ	12

	org 0x00
	goto inicio

inicio	movlw	.123
	movwf	num1		; num1 = 123d
	movlw	.234
	movwf	num2		; num2 = 234d
	call	compara
	movwf	FSR		; muevo la dirección del mayor al puntero FSR
	movf	INDF, 0		; muevo a W el valor de la dirección apuntada por FSR
	movwf	mayor		; W -> mayor
	return

compara	movf	num1, 0		; num1 -> W
	subwf	num2, 0		; W = num1 - num2
	btfss	STATUS, C	; evalúo si hubo acarreo (C = 1)
	retlw	num1		; diferencia positiva, num1 > num2, retorno con num1 en W
	retlw	num2		; diferencia negativa, num1 < num2, retorno con num2 en W
	
	end
