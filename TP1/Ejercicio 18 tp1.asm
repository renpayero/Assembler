.MODEL SMALL
.STACK
.DATA
     
     arreglo dw 4, 30, 20, 110
     mayornum dw    ?

.CODE
inicio:
    mov ax,@data    ;   Inicializar el segmento de datos
    mov ds, ax      ;   
    
    mov bx, offset arreglo
    push bx
    call mayorArreglo 
    mov ax, dx
    mov mayornum, ax
    mov ax, 4c00h
    int 21h
    
    mayorArreglo proc
        push bp
        mov  bp, sp 
        mov dx, 0
        
        ricky: 
        cmp dx, ss:[bp+6]
        jb  mayorax6  
        cmp dx, ss:[bp+8]
        jb  mayorax8
        cmp dx, ss:[bp+10]
        jb  mayorax10
        cmp dx, ss:[bp+12]
        jb  mayorax12 
        pop bp
        ret 4 
        mayorArreglo endp
        
        mayorax4:
        mov dx, ss:[bp+4]
        jmp ricky
        
        mayorax6:
        mov dx, ss:[bp+6]
        jmp ricky
        
        mayorax8:
        mov dx, ss:[bp+8]
        jmp ricky
        
        mayorax10:
        mov dx, ss:[bp+10]
        jmp ricky
        
        mayorax12:
        mov dx, ss:[bp+12]
        jmp ricky
        

    mov ax, 4C00h   ;   Terminar  
    int 21h
END inicio