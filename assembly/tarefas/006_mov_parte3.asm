   ;chama subrotina
   call _novaLinha
   ;salta para saida
   jmp  _saida

_novaLinha:
    mov edx,newLineLen
    mov ecx,newLineMsg
    mov ebx,1
    mov eax,4
    int 0x80 
    ret
_saida:
    ; Chamada sys_exit
    mov	eax,1
    ;chama o kernel
    int	0x80


