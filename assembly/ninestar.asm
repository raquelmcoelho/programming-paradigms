section	.text
   global _start	 
	
_start:	         
   mov	edx,len  ; comprimento da mensagem message 
   mov	ecx,msg  ; mensagem para escrever
   mov	ebx,1    ; descritor do arquivo  (stdout)
   mov	eax,4    ; numero da chamada ao sistema (sys_write)
   int	0x80     ; call kernel
	
   mov	edx,lenStars   
   mov	ecx,stars   
   mov	ebx,1    
   mov	eax,4    
   int	0x80      

   mov edx,len2
   mov ecx,msg2
   mov ebx,1
   mov eax,4
   int 0x80 

   mov	eax,1    ; (sys_exit)
   int	0x80     ; call kernel
	
section	.data
msg  db 'Displaying n stars',0xa ; a message
len  equ $ - msg                 ; length of message
stars times 3 db '*'
lenStars equ $ - stars
msg2 db 0xa                      ; mudanca de linha
len2 equ $ - msg2