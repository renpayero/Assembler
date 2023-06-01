 .MODEL SMALL
.STACK
.DATA

    caracter    DB  "7"  
    digito      DB  ?
    
    




.CODE
inicio:
    mov ax,@data    ;   Inicializar el segmento de datos
    mov ds, ax     
    
    mov al,caracter
    
    call    caracterAdecimal
    mov     ah, digito
    mov     ax, 4C00h
    int 21h
    
caracterAdecimal proc
    cmp al, "0"
    jl  noEsDigito
    cmp al, "9"
    jg  noEsDigito
    
    sub al,"0"
    mov digito, al
    ret
    
noEsDigito:
    mov digito, 0FFh
    ret
    
caracterAdecimal endp 
                    
    
    
    
    
    
    mov ax, 4C00h   ;   Terminar  
    int 21h
END inicio