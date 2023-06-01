.MODEL SMALL
.STACK
.DATA 
          var db 10110101b
          inv db    ?

   

.CODE
inicio:
    mov ax,@data    ;   Inicializar el segmento de datos
    mov ds, ax      ;     
    
    mov si, 7  
    mov al, inv
    call comp
     mov ax, 4c00h
    int 21h
    
    comp proc 
        cmp var[si], 00000000b 
        je  mover
        ret
        comp  endp
        
        
        
        mover:
        mov al, var[si]
        add inv, al
        dec si 
        call comp
        mov ax, 4c00h
        int 21h
        
                      



