; segmento de dados
section .data
   ; mensagem solicitando a entrada de um n�mero
   userMsg db 'Digite um numero: '
   ; comprimento da mensagem
   lenUserMsg equ $-userMsg
   dispMsg db 'Voce digitou: '
   lenDispMsg equ $-dispMsg                 

;Dados n�o inicializados
section .bss
   num resb 5

; segmento de c�digo
section .text
   global _start
