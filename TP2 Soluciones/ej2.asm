; a. suma con el valor 123 decimal.
suma	equ	0x20

	movlw	.123
	movwf	suma

; b. caracter con el valor de la inicial de su nombre.
caracter	equ	0x21

		movlw	"P"
		movwf	caracter

; c. mascara con el valor 10110101 binario
mascara	equ	0x22

	movlw	b'10110101'
	movwf	mascara

; d. num_largo con el valor A34F hexadecimal en little endian.
num_largo	equ	0x23
		movlw	4F
		movwf	num_largo
		movlw	A3
		movwf	num_largo+1

; e. lista con los valores 13, 29, 45, 76, 42 decimales.
lista	equ	0x24
	movlw	.13
	movwf	lista
	movlw	.29
	movwf	lista+1
	movlw	.45
	movwf	lista+2
	movlw	.76
	movwf	lista+3
	movlw	.42
	movwf	lista+4
