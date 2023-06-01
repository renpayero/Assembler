.MODEL SMALL
.STACK
.DATA

        Lado1 dw 3
        Lado2 dw 9
        Lado3 dw 6
        Lado4 dw 7 
        Perim dw ?

.CODE
inicio:
    mov ax,@data    ;   Inicializar el segmento de datos
    mov ds, ax      ;    
    

    push Lado1
    push Lado2
    push Lado3
    push Lado4
    call perimetro
    mov Perim, bx 
    mov ax, 4c00h
    int 21h
    
    perimetro proc
        push bp   
        mov bp, sp  
    
        mov bx, 0                            
                                           
        add bx, ss[bp+4]                      
        add bx, ss[bp+6]                      
        add bx, ss[bp+8]  
        add bx, ss[bp+10]                     
    
        pop bp   
        ret 8
        perimetro endp 





