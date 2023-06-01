.MODEL SMALL
.STACK
.DATA 

    Nota1     dw 9
    Nota2     dw 9
    Nota3     dw 9
    SumaN     dw 0
    NotaFinal dw 0
       
    

.CODE
inicio:
    mov ax, @data ; inicializar el segmento de datos
    mov ds, ax    ;
    
      mov ax, 0 
      call notas 
      mov SumaN, ax 
      mov ax, 4c00h
      int 21h
      
      notas proc
            add ax, Nota1
            add ax, Nota2
            add ax, Nota3 
                
            contar:
            cmp ax, 20
            jg aprob
            jmp fin 
            aprob:
            inc NotaFinal
            jmp fin
            
    
    fin:
    ret
    notas endp
END inicio