.MODEL SMALL
.STACK
.DATA 
     
     lado1  dw 4
     lado2  dw 7
     lado3  dw 2
     perimetro_del_triangulo dw 0

.CODE
inicio:
      mov ax, @data ; Inicializar el segmento de datos
	  mov ds, ax 
      
      push lado1 ; push es una instruccion entonces no necesita almacenarse ni moverse
                 ; agrego lado1 en la pila
      push lado2 ; agrego lado2 en la pila
      push lado3 ; agrego lado3 en la pila
                                             
      call calcular
      
      mov perimetro_del_triangulo, bx
      
      mov ax, 4C00h ; Terminar    ;se coloca antes de hacer la ejecucion
      int 21h                     ; " "      "  "  " "  " " " "  "  " " 
                    ; es el final del programa

calcular proc ;proc para llamar la subrutina  
    push bp   ; puntero de la pila
    mov bp, sp ; SE COLOCA SIEMPRE, es un tipo de segmento 
    
    mov bx, 0                              ;bp         la pila completa
                                           ;ip 2
    add bx, ss[bp+4]                       ;lado1 4 
    add bx, ss[bp+6]                       ;lado2 6
    add bx, ss[bp+8]                       ;lado3 8
    
    pop bp   ;elimina el bp y deja a ip como puntero de la pila (lado 1=2, lado2=4, lado3=6)
    ret 6 ;se limpia la pila de bp+ 6 (lado1 + lado2 + lado3)
    
        
calcular endp ;termina la proc (la subrutina)
end inicio