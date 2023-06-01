.MODEL SMALL
.STACK
.DATA 
   
   caracter dw "9"
   digito dw ?
   numeros  dw  1, 2, 3, 4, 5, 6, 7, 8, 9  
   
   

.CODE
inicio:
    mov ax,@data    ;   Inicializar el segmento de datos
    mov ds, ax      ;
    
    mov ax, caracter
    mov dx, numeros
    mov si, 0       
    call etiqueta  
    
    fin:
    mov ax, 4c00h
    int 21h
    
    
    etiqueta proc
        cmp ax, numeros[si]
        je decimaladigito 
        inc si
        cmp ax,   numeros[si]
        jne almacenamiento
        ret
    
    almacenamiento:
    sub ax, 0 ; se convierte el caracter a decimal 
    mov bx, caracter
    mov digito, bx
    jmp fin 
    
    decimaladigito:
    mov digito, 0FFh
    jmp fin
    
    
       
