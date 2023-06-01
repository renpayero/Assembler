.MODEL SMALL
.STACK
.DATA
    
    cadena dw 3, 2, 1, 0
    long   dw ?
    

.CODE
inicio:
    mov ax,@data    ;   Inicializar el segmento de datos
    mov ds, ax      ; 
    
        mov cx, 0
        mov ax, 0
        push    cadena 
        call longString 
        mov ax, cx  
        mov long, cx
        mov ax, 4c00h
        int 21h
        
        longString proc
            push bp
            mov bp, sp
            iterar:
            mov ax, ss:[bp+4]
            cmp ax, 00000000b
            jne otro1
            iterar2:
            mov ax, ss:[bp+6]
            cmp ax, 00000000b
            jne otro2  
            iterar3:
            mov ax, ss:[bp+8]
            cmp ax, 00000000b
            jne otro3  
            iterar4:
            mov ax, ss:[bp+10]
            cmp ax, 00000000b
            jne otro4 

            
            
            fin:
            pop bp
            ret 4
            longString endp
            
            otro1:
            inc cx 
            jmp iterar2 
            
            otro2:
            inc cx 
            jmp iterar3
            
            otro3:
            inc cx 
            jmp iterar4
            
            otro4:
            inc cx 
            jmp fin


            
            
            
        

    mov ax, 4C00h   ;   Terminar  
    int 21h
END inicio