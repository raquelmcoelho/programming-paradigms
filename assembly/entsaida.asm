section .data                           ; segmento de dados
   userMsg db 'Digite um numero: '      ; mensagem solicitando a entrada de um número
   lenUserMsg equ $-userMsg             ; T coimprimento da mensagem
   dispMsg db 'Voce digitou: '
   lenDispMsg equ $-dispMsg                 

section .bss                            ; Dados não inicializados
   num resb 5
	
section .text                           ; segmento de código
   global _start
	
_start:                                 ; Mensagem para o usuário (prompt)
   mov eax, 4                           ; observe a sequencia dos registradores A - Numero SYSCALL,B - Descritor,
   mov ebx, 1                           ; C - mensagem, D - Comprimento
   mov ecx, userMsg 
   mov edx, lenUserMsg
   int 80h

   ; Lê e armazena a entrada fornecida pelo usuário 
   mov eax, 3
   mov ebx, 2
   mov ecx, num  
   mov edx, 5                           ; 5 bytes (numerico, 1 para sinal) de informação
   int 80h
	
   ; Saida da mensagem 'voce digitou'
   mov eax, 4
   mov ebx, 1
   mov ecx, dispMsg
   mov edx, lenDispMsg
   int 80h  

   ; saida do numero digitado
   mov eax, 4
   mov ebx, 1
   mov ecx, num
   mov edx, 5
   int 80h  
    
   ; saida final
   mov eax, 1
   mov ebx, 0
   int 80h