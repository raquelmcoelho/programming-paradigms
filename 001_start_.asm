; nosso primeiro programa em assembly
; adicionar coment�rios
global _start ; define o ponto de in�cio de execu��o do programa
_start:
    mov eax,1   ; coloca o 1 no reg. eax (proposito geral)
                ; neste caso o eax fornce o c�digo que identifica uma system call
                ; nesta caso a system call sera EXIT(X) onde o X ser� o valor no registrador ebx
    mov ebx,42  ; coloca o valor 42 no registrador de prop�sito geral ebx, e
    int 0x80    ; chama uma iterrup��o do kernel
