section	.text
   global _start         
	
_start:                  

   mov bx, 3             ;calcular o fatorial de 3
   call  proc_fact
   add   ax, 30h
   mov  [fact], ax
    
   mov	  edx,len        ;comprimento da mensagem
   mov	  ecx,msg        ;mensagem a escrever
   mov	  ebx,1          ;(stdout)
   mov	  eax,4          ;(sys_write)
   int	  0x80          

   mov   edx,1           ;comprimento da mensagem
   mov	  ecx,fact       ;mensagem para escrever
   mov	  ebx,1          ;(stdout)
   mov	  eax,4          ; (sys_write)
   int	  0x80           
    
   mov	  eax,1          ; (sys_exit)
   int	  0x80           
	
proc_fact:
   cmp   bl, 1
   jg    calcula
   mov   ax, 1
   ret
	
calcula:
   dec   bl
   call  proc_fact
   inc   bl
   mul   bl        ;ax = al * bl
   ret

section	.data
msg db 'Factorial 3 is:',0xa	
len equ $ - msg			

section .bss
fact resb 1