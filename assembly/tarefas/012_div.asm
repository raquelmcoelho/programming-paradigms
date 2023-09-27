section	.text
   global _start    ; must be declared for using gcc
	
_start:             ; tell linker entry point
   mov	ax,'8'      
   sub  ax,'0'      ; eax conterá o número 8
	
   mov 	bl, '2'
   sub  bl, '0'     ; bl conterá  o número 2
   div 	bl          ; ax é dividido por bl 
   add	ax, '0'     ; convertido em número
	
   mov 	[res], ax   ; ax vai para res
   mov	ecx,msg	    ; prepara msg 
   mov	edx, len    
   mov	ebx,1	;file descriptor (stdout)
   mov	eax,4	;system call number (sys_write)
   int	0x80	;call kernel
	
   mov	ecx,res  ; res vai para ecx
   mov	edx, 1
   mov	ebx,1	;file descriptor (stdout)
   mov	eax,4	;system call number (sys_write)
   int	0x80	;call kernel
	
   mov	eax,1	;system call number (sys_exit)
   int	0x80	;call kernel
	
section .data
msg db "The result is:", 0xA,0xD 
len equ $- msg   
segment .bss
res resb 1