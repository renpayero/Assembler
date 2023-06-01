.MODEL SMALL
.STACK
.DATA 
    
    NE1 dw  120
    NE2 dw  500
    contsi  dw  ?
    contdi  dw  ?
    


.CODE
inicio:
    mov ax,@data    ;   Inicializar el segmento de datos
    mov ds, ax      ;      
    
    mov si, NE1     ;inicializamos si con el valor de NE1
    mov di, NE2     ;inicializamos di con el valor de NE2
    mov ax, 0       ;Inicializamos ax para luego guardar el valor del num mas grande como pide el ejercicio
    mov dx, 0       ;inicializamos dx para guardar la direccion de memoria de si y luego pasarla a una variable
    call mayor      ;llamada a subrutina
    mov ax, 4c00h
    int 21h
    
    mayor proc                      ;subrutina
        mov dx, [si]                ;movemos la direccion de memoria de si a dx
        mov contsi, dx              ;movemos la direccion de memoria de si que ahora esta en dx a la variable contsi
        cmp contsi, offset[di]      ;comparamos ambas direcciones    
        jg contsimay                ;si contsi es mayor a la direccion de memoria de di salta a la etiqueta contsimay
        mov ax, offset[di]          ;como la direccion de memoria memoria de di es mayor a la de si se guarda en ax
        ret 
        mayor endp
        
        
        contsimay:
        mov ax, contsi              ;si la direccion de memoria de contsi fuera mayor se guardaria en ax
        ret
        
                          
                         
    
       



     mov ax, 4c00h
    int 21h
