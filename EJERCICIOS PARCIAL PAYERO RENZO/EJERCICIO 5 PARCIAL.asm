.MODEL SMALL
.STACK
.DATA

    listado db  12, 24, 45, 11, 3, 60, 15, 9
    cantidad db 8
    totmayores dw ?
    
    

.CODE
inicio:
    mov ax,@data    ;   Inicializar el segmento de datos
    mov ds, ax      ;   
    
    mov si, 0
    mov bl, cantidad 
    mov dx, 0
    call contar 
    mov totmayores, dx
    mov ax, 4c00h
        int 21h
    
contar proc
    cmp bl, 0
    je fin
    cmp listado[si], 18
    jg  mayor
    cmp listado[si], 18
    jl  menor

    

    mayor:
        inc dx
        inc si
        dec bl
        loop contar 
        
    menor:
        inc si
        dec bl
        loop contar     
        
        
        fin: 
        ret
        contar endp
        
