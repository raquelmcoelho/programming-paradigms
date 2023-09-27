section	.text
   global _start         
	
_start:	                 

   mov	eax, 45		 ;sys_brk
   xor	ebx, ebx
   int	80h

   add	eax, 16384	 ;número de bytes a ser reservado
   mov	ebx, eax
   mov	eax, 45		 ;sys_brk
   int	80h
	
   cmp	eax, 0
   jl	exit	     ;exit, caso erro
   mov	edi, eax	 ;EDI = endereço disponível mais alto
   sub	edi, 4		 ;apontando para a última  DWORD  
   mov	ecx, 4096	 ;número de DWORDs allocadas
   xor	eax, eax	 ;limpa eax
   std			 ;backward - retorna
   rep	stosd            ;repete para toda a área alocada
   cld			 ;coloca o DF flag para o estado nomal
	
   mov	eax, 4
   mov	ebx, 1
   mov	ecx, msg
   mov	edx, len
   int	80h		 ;imprime uma mensagem

exit:
   mov	eax, 1
   xor	ebx, ebx
   int	80h
	
section	.data
msg    	db	"Aloca 16k de memória!", 10
len     equ	$ - msg