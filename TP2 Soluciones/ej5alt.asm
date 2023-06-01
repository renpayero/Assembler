; a
	movf	var1, 0		; var1 -> W
	sublw	5		; W = 5 - var1
	btfsc	STATUS, C	; C = 1?
	goto	bloque1		; C = 1, var1 <= 5 "bloque1" sería el "then"
				; C = 0, var1 > 5  lo que sigue sería el "else"
	movlw	2		; W = 2
	goto	bloque2		; "bloque2" sería el "endif"
bloque1	movlw	1		; W = 1
bloque2	movwf	var2

; código Python equivalente
; if var1 <= 5:
;    var2 = 1
;else:
;    var2 = 2


;b
	movf	var1, 0		; var1 -> W
	sublw	42		; W = 42 - var1
	btfsc	STATUS, Z	; Z = 1?
	goto	bloque1		; Z = 1, var1 = 42. "bloque1" sería el "then"
				; Z = 0, lo que sigue sería el "else"
	clrf	var2		; var2 = 0
	goto	bloque2		; "bloque2" sería el "endif"
bloque1	movlw	1		
	movwf	var2		; var2 = 1
bloque2 nopq
