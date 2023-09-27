section .data
    numero1 db 11001011b   ; Primeiro número em binário
    numero2 db 10100101b   ; Segundo número em binário

section .text
    global _start

_start:
    ; Configurar a pilha
    mov esp, stack_top   ; Configurar o ponteiro da pilha

    ; Carregar os valores dos números em registradores
    mov al, byte [numero1]   ; Usar "byte" para carregar apenas 1 byte
    mov bl, byte [numero2]

    ; Somar os valores dos registradores
    add al, bl

    ; Converter o resultado em um caractere ASCII
    add al, '0'

    ; Exibir o resultado na tela
    mov ah, 0x0E       ; Função de saída do BIOS para escrever caractere
    mov bh, 0x00       ; Página do vídeo (0)
    mov bl, 0x07       ; Atributo de cor (7, branco sobre fundo preto)
    int 0x10           ; Chamada de interrupção do BIOS para saída de vídeo

    ; Finalizar o programa
    mov eax, 0x1       ; Código de saída 0
    xor ebx, ebx       ; Limpar registrador EBX
    int 0x80           ; Chamada de sistema para sair

section .bss
    ; Definir espaço para a pilha
    stack_bottom resb 16384
    stack_top equ $     ; Definir o ponteiro da pilha como o endereço atual
