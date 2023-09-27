section	.text
   global _start        
	
_start:	                
   mov	ecx,'4'
   sub   ecx, '0'
	
   mov 	edx, '5'
   sub   edx, '0'
	
   call    sum          ;chama o procedimento soma
   mov 	[res], eax
   mov	ecx, msg	
   mov	edx, len
   mov	ebx,1	        ;(stdout)
   mov	eax,4	        ;(sys_write)
   int	0x80	       
	
   mov	ecx, res
   mov	edx, 1
   mov	ebx, 1	        ;(stdout)
   mov	eax, 4	        ;(sys_write)
   int	0x80	        ;
	
   mov eax,4
   mov ebx,1
   mov ecx,newLineMsg
   mov edx,newLineLen
   int 0x80
   mov	eax,1	        ;(sys_exit)
   int	0x80	        
sum:
   mov     eax, ecx
   add     eax, edx
   add     eax, '0'
   ret
	
section .data
msg db "A soma eh: "
len equ $- msg   
newLineMsg db  0xa
newLineLen equ $-newLineMsg

segment .bss
res resb 1