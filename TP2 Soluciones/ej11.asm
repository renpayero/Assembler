	list	p=16f84
	#include <p16f84.inc>

mul1	equ	10 		; multiplicando de 8 bits
mul2	equ	11 		; multiplicador de 8 bits
prod_h	equ	12 		; byte alto del producto de 16 bits
prod_l	equ	13 		; byte bajo del producto de 16 bits
cont	equ	14		; contador del bucle

	org	0x00
	goto	inicio

    multi	
        clrf	prod_h		; inicializar el byte alto del producto en 0
        clrf	prod_l		; inicializar el byte bajo del producto en 0
        movlw	8
        movwf	cont		; inicializar el contador en 8
        movf	mul1, 0		; mover el multiplicando al registro W
        bcf	STATUS,	C 	    ; Poner el bit de carry en 0
	
    bucle	
        rrf	mul2		; rotar el multiplicador a la derecha, el LSB quedará en C
                        ; y será el que multiplicaré en esta iteración
        btfsc	STATUS, C	; chequear si el bit de carry C = 0
        addwf	prod_h		; C = 1, tengo que sumar mul1 (está en W)
        rrf	prod_h		; rotar el byte alto del producto a la derecha
                        ; el LSB quedará en C
        rrf	prod_l		; rotar el byte bajo del producto a la derecha
                        ; usando C
        decfsz	cont		; decrementar el contador
        goto	bucle		; volver a iterar
	return			; terminar la subrutina

inicio	movlw	0FF
	movwf	mul2		; multiplicador = 0FF
	movlw	0FF
	movwf	mul1		; multiplicando = 0FF
	
	call	multi 		; El producto de 0FF*0FF quedará almacenado en prod_h y prod_l

	end
