.MODEL SMALL
.STACK
.DATA  

     caracter  db "7"
     digito    db ?

.CODE 
inicio:
       mov ax,@data
       mov ds,ax   
       
       
       mov al,caracter
       
       call caracterAdecimal
       
       
caracterAdecimal proc
    cmp al,"0"
    jl noEsDigito
    cmp al,"9"
    jg noEsDigito
    
    sub al,"0"
    mov digito,al
    ret
    
noEsDigito:
       mov digito,0FFh
       ret
       
caracterAdecimal endp

end inicio