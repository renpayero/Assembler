.MODEL SMALL
.STACK
.DATA 
    
    n1 dw  600
    n2 dw  700  
    contsi  dw  ?
    max dw  ?
    
    


.CODE
inicio:
    mov ax,@data    ;   Inicializar el segmento de datos
    mov ds, ax      ;      
    
    mov si, offset  n1    
    mov di, offset  n2 
    mov ax, ds:[si]   
    mov bx, ds:[di]          
    call mayor
    mov max, ax      
    mov ax, 4c00h
    int 21h
    
    mayor proc                        
        cmp bx, ax      
        jg bxmay                          
        ret 
        mayor endp
        
        
        bxmay:
        mov ax, bx        
        ret
        
                          
                         
    
       



     mov ax, 4c00h
    int 21h
