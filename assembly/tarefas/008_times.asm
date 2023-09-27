section	.text
   global _start        ;must be declared for linker (ld)
	
_start:                 ;tell linker entry point
   mov	edx,9		;message length
   mov	ecx, stars	;message to write
   mov	ebx,1		;file descriptor (stdout)
   mov	eax,4		;system call number (sys_write)
   int	0x80		;call kernel

_saida:
    mov edx,newLineLen
    mov ecx,newLineMsg
    mov ebx,1
    mov eax,4
    int 0x80 

    mov	eax,1       ;system call number (sys_exit)
    int	0x80        ;call kernel

section	.data
    stars   times 9 db '*'
    newLineMsg db  0xa
    newLineLen equ $-newLineMsg