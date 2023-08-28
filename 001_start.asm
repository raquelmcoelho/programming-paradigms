; nosso primeiro programa em assembly
; adicionar comentarios
;
global _start ; define o ponto de inicio de execucao do programa

_start:
    mov eax,1   ; coloca o valor 1 no registrador eax (proposito geral)
                ; neste caso o eax fornce o código que identifica uma system call a ser executadaa pelo kernel
                ; nesta caso a system call sera EXIT(X) onde o X será o valor no registrador ebx
    mov ebx,42  ; coloca o valor 42 no registrador de ropoosito geral ebx, e
    int 0x80    ; chama uma iterrupção para que o kernel execute uma system call
