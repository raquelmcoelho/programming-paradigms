; nosso primeiro programa em assembly
; adicionar comentários
global _start ; define o ponto de início de execução do programa
_start:
    mov eax,1   ; coloca o 1 no reg. eax (proposito geral)
                ; neste caso o eax fornce o código que identifica uma system call
                ; nesta caso a system call sera EXIT(X) onde o X será o valor no registrador ebx
    mov ebx,42  ; coloca o valor 42 no registrador de propósito geral ebx, e
    int 0x80    ; chama uma iterrupção do kernel
