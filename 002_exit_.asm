; nosso segundo  programa em assembly
global _start
_start:
    mov eax,1   ; coloca o valor 1 no registrador eax (proposito geral)
    mov ebx,42  ; coloca o valor 42 no registrador de ropoosito geral ebx, e
    add ebx,10  ; soma o valor 10 ao 42 que est� no ebx e coloca no pr�prio ebx
    int 0x80    ; chama uma iterrup��o para que o kernel execute uma system call
