	list p=16f84
	#include <p16f84.inc>

num1	equ	10
num2	equ	11
max         equ	12

	org 0x00
	goto inicio

mayor
        movf    num1, W
        subwf   num2
        btfsc   STATUS, Z
        retlw   0
        movf    num1, W
        subwf   num2
        btfsc   STATUS, C
        retlw   num1
        retlw   num2

inicio
        movlw    .10
        movwf   num1
        movlw    .9
        movwf   num2
        call mayor
        movwf   max
end

        

    















