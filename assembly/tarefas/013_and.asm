section .text
   global _start            ;declaração do ponto de entrada main
	
_start:                     ;declaraão para o linker do ponto de entrada
   mov   ax,   7h           ;ponto 8h no registro ax
   and   ax, 1              ;operação and com 1
   jz    evnn               ; salta para o endereço referenciado por evnn caso a ax seja zero (número par)
   mov   eax, 4             ;(sys_write)
   mov   ebx, 1             ;(stdout)
   mov   ecx, odd_msg       ;message to write
   mov   edx, len2          ;length of message
   int   0x80               ;call kernel
   jmp   outprog

evnn:   
  
   mov   ah,  09h
   mov   eax, 4             ;(sys_write)
   mov   ebx, 1             ;(stdout)
   mov   ecx, even_msg      ;message to write
   mov   edx, len1          ;length of message
   int   0x80               ;call kernel

outprog:

   mov edx,newLineLen
   mov ecx,newLineMsg
   mov ebx,1
   mov eax,4
   int 0x80 
   
   mov   eax,1              ;system call number (sys_exit)
   int   0x80               ;call kernel

section   .data
even_msg  db  'Número Par!' ;mensagem mostrando que o número é par
len1  equ  $ - even_msg 
   
odd_msg db  'Número ímpar!'    ;mensagem mostrando que o número é ímpar
len2  equ  $ - odd_msg

newLineMsg db  0xa
newLineLen equ $-newLineMsg 