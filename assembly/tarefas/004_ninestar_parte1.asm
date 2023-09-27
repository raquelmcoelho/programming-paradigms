section	.text
   global _start	 
	
_start:	         
   mov	edx,len  ; comprimento da mensagem message 
   mov	ecx,msg  ; mensagem para escrever
   mov	ebx,1    ; descritor do arquivo  (stdout)
   mov	eax,4    ; número da chamada ao sistema (sys_write)
   int	0x80     ; call kernel
	
   mov	edx,9    
   mov	ecx,s2   
   mov	ebx,1    
   mov	eax,4    
   int	0x80      
