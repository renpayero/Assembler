.MODEL SMALL
.STACK
.DATA 
   
   nombrearch dw 'miarchivo.jpg'
   

.CODE
inicio:
    mov ax,@data    ;   Inicializar el segmento de datos
    mov ds, ax      ;    
    
    mov si, 0 ;indice para recorrer "nombrearch"
    
    iterar:
           cmp nombrearch[si], 00000000b
           je fin
           
           inc dx
           inc si
           
           loop iterar ; itera la estructura de control
    
    
      
    

fin:
mov cx, dx         
mov ax, 4c00h
int 21h                                                              
END inicio