.MODEL SMALL
.STACK
.DATA   
        cadena db "Hola todo bien0"
        cantpa  dw  ?
    

.CODE
inicio:
    mov ax,@data    ;   Inicializar el segmento de datos
    mov ds, ax      ;  
    
    mov ax, offset cadena
    push    ax  
    call contarPalabras
    mov cantpa, ax
    mov ax, 4c00h
    int 21h
    
    contarPalabras proc
        push bp
        mov bp, sp
        mov ax, 0
        mov bx, ss:[bp+4]
        
        contar:
        mov dl, ds:[bx]
        cmp dl, 0
        je fin
        cmp dl, " "
        jne nocontar
        inc ax
        
        nocontar:
        inc bx
        jmp contar
        
        fin:
        inc ax
        pop bp
        ret 2
        contarPalabras endp
       
    
       
        

    mov ax, 4C00h   ;   Terminar  
    int 21h
END inicio