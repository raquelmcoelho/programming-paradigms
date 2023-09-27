; segmento de dados
section .data
   ; mensagem solicitando a entrada de um número
   userMsg db 'Digite um numero: '
   ; comprimento da mensagem
   lenUserMsg equ $-userMsg
   dispMsg db 'Voce digitou: '
   lenDispMsg equ $-dispMsg                 

;Dados não inicializados
section .bss
   num resb 5

; segmento de código
section .text
   global _start
