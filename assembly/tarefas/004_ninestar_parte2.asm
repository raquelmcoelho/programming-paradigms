
   mov edx,l2
   mov ecx,msg2
   mov ebx,1
   mov eax,4
   int 0x80 

   mov	eax,1    ; (sys_exit)
   int	0x80     ; call kernel
	
section	.data
msg  db 'Imprimindo 9 asteriscos',0xa ;a message
len  equ $ - msg  ;length of message
s2 times 9 db '*'
msg2 db 0xa ; mudança de linha
l2 equ $ - msg2
