section .data                           ; segmento de dados
   userMsg db 'Digite um numero: '      ; mensagem solicitando a entrada de um n�mero
   lenUserMsg equ $-userMsg             ;T coimprimento da mensagem
   dispMsg db 'Voce digitou: '
   lenDispMsg equ $-dispMsg                 

section .bss           ;Dados n�o inicializados
   num resb 5
	
section .text          ; segmento de c�digo
   global _start
	
_start:                ;Mensagem para o usu�rio (prompt)
   mov eax, 4          ; observe a sequencia dos registradores A - Numero SYSCALL,B - Descritor,
   mov ebx, 1          ; C - mensagem ,D - Comprimento
   mov ecx, userMsg    ; 
   mov edx, lenUserMsg
   int 80h

   ; L� e armazena a entrada fornecida pelo usu�rio 
   mov eax, 3
   mov ebx, 2
   mov ecx, num  
   mov edx, 5          ;5 bytes (numerico, 1 para sinal) de informa��o
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