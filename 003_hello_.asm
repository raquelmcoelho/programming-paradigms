section .text
   global _start     ; deve ser declarado para o linker saber onde começa o programa
	
_start:	            ;inicio do programa
   mov	edx,len     ;comprimento da mensagem 
   mov	ecx,msg     ;mensagem para escrever 
   mov	ebx,1       ; descritor de arquivo  (stdout)
   mov	eax,4       ; número da chamada ao sistema (sys_write)
   int	0x80        ; chama o kernel (interrupção)
	
   mov	eax,1       ; número da chamada ao sistema (sys_exit)
   int	0x80        ; chama o sistema

section	.data
    msg db 'Hello, world!', 0xa     ;string  a ser impressa
    len equ $ - msg                 ;comprimento da string