.MODEL SMALL
.STACK
.DATA

    listado db  15, 30, 45, 12, 7, 60, 16
    cantidad db 7 
    totmayores dw ?
    totmenores dw ?
    



.CODE
inicio:
    mov ax,@data    ;   Inicializar el segmento de datos
    mov ds, ax      ;   
    
    mov si, 0
    mov bl, cantidad
    mov ax, 0 
    mov dx, 0
    call contar
    
contar proc
    cmp bl, 0
    je fin
    cmp listado[si], 20
    jl esmenor
    cmp listado[si], 20
    jg  esmayor
    
    esmenor:
        inc ax
        inc si
        dec bl
        loop contar
        
    esmayor:
        inc dx
        inc si
        dec bl
        loop contar
        
    fin:
        mov totmayores, ax
        mov totmenores, dx 
        mov ax, 4c00h
        int 21h
        
      
    



    mov ax, 4C00h   ;   Terminar  
    int 21h
END inicio