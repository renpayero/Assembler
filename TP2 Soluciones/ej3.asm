var1	equ	0x20
var2	equ	0x21

	movlw	.97	; W = 61, var1 = ?,  var2 = ?
	movwf	var1	; W = 61, var1 = 61, var2 = ?
	movlw	var1	; W = 20, var1 = 61, var2 = ?
	addwf	var1	; W = 20, var1 = 81, var2 = ?
	addwf	var1, 0	; W = A1, var1 = 81, var2 = ?
	movwf	var2	; W = A1, var1 = 81, var2 = A1
	addlw	var2	; W = C2, var1 = 81, var2 = A1
	movf	var2, 0	; W = A1, var1 = 81, var2 = A1
	incf	var1	; W = A1, var1 = 82, var2 = A1
	incf	var1, 0	; W = 83, var1 = 82, var2 = A1
