section	.text
   global _start ; deve ser declarado para o linker (ld)
_start:	         ; ponto de entrada para o linker
   mov	edx,len  ; comprimento da mensagem em edx
   mov	ecx,msg  ; mensagem a ser escrita
   mov	ebx,1    ; descritor de arquivo (stdout)
   mov	eax,4    ; chamada do sistema (sys_write)
   int	0x80     ; chama o kernel

   mov	eax,1    ; chamada do sistema (sys_exit)
   int	0x80     ; chama o kernel

section	.data
msg db 'Queima *** do IFCE', 0xa   ; string
len equ $ - msg                    ; comprimento da string