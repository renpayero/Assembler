.MODEL SMALL
.STACK
.DATA

      Importe dw 7
      Descuento dw  0 
      Neto  dw  0




.CODE
inicio:
    mov ax,@data    ;   Inicializar el segmento de datos
    mov ds, ax      ;    
    
    mov Descuento, 50
    mov ax, Importe 
   
   
        cmp Importe, 1000 
        jl  SinDescuento
        mov ax, Importe
        sub ax, Descuento
        
        mov Neto, ax
        
        
               
    SinDescuento proc 
        mov Neto, ax
            
    
    
    mov ax, 4C00h   ;   Terminar  
    int 21h
END inicio