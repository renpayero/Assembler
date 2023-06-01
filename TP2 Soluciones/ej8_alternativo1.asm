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
        goto   mayor1
        movf    num2, W
        goto salir        
        mayor1
                movf    num1, W
        salir
                movwf   max
                return
        

inicio
        movf    .10, W
        movwf   num1
        movf    .9, W
        movwf   num2
        call mayor

end


