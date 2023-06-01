	list p=16f84
	#include <p16f84.inc>

cant	equ	10
lista	equ	11
minimo	equ	20
conta	equ	21

	org 0x00
	goto inicio

inicio	movlw	.123
	movwf	lista
	movlw	.234
	movwf	lista+1
	movlw	.56
	movwf	lista+2
	movlw	.75
	movwf	lista+3
	movlw	.12
	movwf	lista+4
	movlw	5
	movwf	cant

	movlw	0xff
	movwf	minimo
	movf	cant, 0
	movwf	conta
	movlw	lista
	movwf	FSR
bucle:	movf	INDF, 0
	subwf	minimo, 0
	btfsc	STATUS, C
	call	nuevomin
	incf	FSR
	decfsz	conta
	goto	bucle
	goto fin
	
nuevomin:
	movf	INDF, 0
	movwf	minimo
	return
        
fin:

    end
