section	.text
   global _start        
	
_start:	                
   call    display
   mov	   eax,1	        ;(sys_exit)
   int	   0x80	        
	
display:
   mov    rcx, 256  ; uso em 64 bits
	
next:
   push    rcx
   mov     eax, 4
   mov     ebx, 1
   mov     rcx, achar
   mov     edx, 1
   int     80h
	
   pop     rcx	
   mov	   edx, [achar]
   cmp	   byte [achar], 0dh
   inc	   byte [achar]
   loop    next
   ret
	
section .data
achar db '0'  