.MODEL SMALL
.STACK
.DATA
       dato8    db 11010011b
       cequis   dw ?
     


.CODE
inicio:
    mov ax,@data    ;   Inicializar el segmento de datos
    mov ds, ax      ;  
     
    mov al, dato8
    call subrutina
    mov cequis, cx 
    mov ax, 4c00h
    int 21h
    
    
    subrutina proc 
        mov cx, 0
        iterar:
        cmp al, 0
        je  fin
        shr al, 1
        jnc iterar
        inc cx
        jmp iterar
        
        fin:
        ret
        subrutina endp
        

    mov ax, 4C00h   ;   Terminar  
    int 21h
END inicio