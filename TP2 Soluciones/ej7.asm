	list p=16f84
	#include <p16f84.inc>

	cblock	0x20		; declarar variables en la posición 0x20
		ax:2		; ax ocupa 2 bytes
		bx:2		; bx ocupa 2 bytes a continuación de ax
	endc

al	equ	0xc2		; byte bajo del primer sumando
ah	equ	0xb0		; byte alto del primer sumando
bl	equ	0xd6		; byte bajo del segundo sumando
bh	equ	0xff		; byte alto del segundo sumando

	org 0x00
	goto	inicio

sumaSC				; realiza la operación ax = ax + bx en 16 bits
				; SC : Sin Carry para el caso en que bh = 0xff
	movf	bx, 0		; mover el byte bajo de bx al registro W
	addwf	ax		; al = al + bl
	btfsc	STATUS, C	; chequear si hubo acarreo (C = 1)
	incf	bx+1		; sumar el acarreo al byte alto de bx
	movf	bx+1, 0		; mover el byte alto de bx al registro W
	addwf	ax+1		; al = ah + bh
	return

sumaCC				; realiza la operación ax = ax + bx en 16 bits
				; CC : Con Carry para el caso en que bh = 0xff
	movf	bx, 0		; mover el byte bajo de bx al registro W
	addwf	ax		; al = al + bl
	movf	bx+1, 0		; mover el byte alto de bx al registro W
	btfsc	STATUS, C	; chequear si hubo acarreo (C = 1)
	incfsz	bx+1		; sumar el acarreo al byte alto de bx y si el resultado
				; de incrementar es 0, saltear la próxima instrucción 
	addwf	ax+1		; al = ah + bh
	return

inicio				; mover los sumandos a ax y bx usando little endian
	movlw	al
	movwf	ax		; al -> ax
	movlw	ah
	movwf	ax+1		; ah -> ax+1
	movlw	bl
	movwf	bx		; bl -> bx
	movlw	bh
	movwf	bx+1		; bh -> bx+1

	call sumaCC		; llamar a la subrutina para sumar
	
	end
