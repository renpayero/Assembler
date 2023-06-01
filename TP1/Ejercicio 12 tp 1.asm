.MODEL SMALL
.STACK
.DATA 
    
    NE1 dw  120
    NE2 dw  500
    


.CODE
inicio:
    mov ax,@data    ;   Inicializar el segmento de datos
    mov ds, ax      ;      
    
    mov bx, NE1
    mov cx, NE2 
    mov ax, 0
    call mayor 
    mov ax, 4c00h
    int 21h
    
    mayor proc
        cmp bx, cx
        jg bxmay
        mov ax, cx 
        ret 
        mayor endp
        
        
        bxmay:
        mov ax, bx 
        ret
        
                          
                         
    
       



     mov ax, 4c00h
    int 21h
