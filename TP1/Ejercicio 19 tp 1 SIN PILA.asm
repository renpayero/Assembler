.MODEL SMALL
.STACK
.DATA
    
    cadena dw 3, 2, 1, 0 
    long   dw ?
    

.CODE
inicio:
    mov ax,@data    ;   Inicializar el segmento de datos
    mov ds, ax      ; 
    
    mov ax, 0  
    mov si, 0
    call longString 
    mov long, ax
    mov ax, 4c00h
    int 21h 
    
    longString proc         
        comp:
        cmp cadena[si], 00000000b 
        je fin
        inc ax
        inc si 
        jmp comp 
        
        
        
        
        fin:
        dec ax
        ret
        longString endp
        
         
        
        
    
     
    
    
        

    mov ax, 4C00h   ;   Terminar  
    int 21h
END inicio