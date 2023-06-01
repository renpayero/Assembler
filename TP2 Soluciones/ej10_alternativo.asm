	list p=16f84
	#include <p16f84.inc>

contador    equ 0x11
cblock  0x20
        lista:16
endc

org 0x00
goto inicio

inicio
        movf    .16, W
        movwf   contador

        movlw   lista       ; asigno la direccion de memoria de lista a 
                                    ; W --> W = 0x20
        movwf   FSR         ; FSR = 0x20

        movf    .0, W       ; inicializo W=0
iterar
        movwf   INDF        ; asigno W a INDF 
        addwf   .2, W       ; W = W + 2
        incf    FSR             ; Me paro en la proxima direccion de la lista
        decfsz  contador    
        goto iterar

end


        

        
















