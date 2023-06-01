list    p=16f84a
#include    p16f84a.inc

ax  equ 0x20
bx  equ 0x21

org 0x00
goto    inicio

        suma
            movf    bx, W       ; W = 0
            addwf   ax, F       ; F = 1
        return

inicio
        movf    .10, W
        movwf   ax
        movf    .11, W
        movwf   bx

        call suma

end

