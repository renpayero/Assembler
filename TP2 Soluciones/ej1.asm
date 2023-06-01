; a.
cuenta	equ	0x10
; b.
	cblock	.32
		num1:2
		num2:2
	endc
; c.
	cblock	0x15
		multiplicando,
		multiplicador,
		producto:2
	endc


; La realidad es que 'equ' declara una constante y 'cblock' un bloque de constantes.
; En estos casos la constante es una dirección de memoria que debemos especificar
; explícitamente, cosa que no es necesaria en Assembly de Intel 8086.
