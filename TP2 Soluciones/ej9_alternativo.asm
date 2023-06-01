	list p=16f84
	#include <p16f84.inc>

minimo  equ     0x10
contador    equ 0x11
cblock  0x20
        lista:5
endc

org 0x00
goto inicio

inicio
        movf    .10, W
        movwf   lista
        movf    .11, W
        movwf   lista+1
        movf    .12, W
        movwf   lista+2
        movf    .13, W
        movwf   lista+3
        movf    .14, W
        movwf   lista+4

        movf    .255, W        ; asignamos un numero muy grande
        movwf   minimo      ; asignamos W a minimo

        movf    .5, W
        movwf   contador

        movlw   lista       ; asigno la direccion de memoria de lista a 
                                    ; W --> W = 0x20
        movwf   FSR         ; FSR = 0x20

iterar
        movf    INDF, W   ;Movemos a W el dato que esta en la direccion de FSR
        subwf   minimo, W       ; W = minimo - W
        btfsc   STATUS, C       ; me fijo si tengo carry
        goto iterarDenuevo   ; C = 1 -->    W > minimo
        movf    INDF, W          ; C = 0 -->    W < minimo
        movwf   minimo
iterarDenuevo
        incf    FSR
        decfsz  contador
        goto iterar

end


        

        
















