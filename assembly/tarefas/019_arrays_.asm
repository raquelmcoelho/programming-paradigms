section	.text
   global _start   
	
_start:	
 		
   mov  eax,3      ;numero de bytes a serem somados 
   mov  ebx,0      ;EBX guarda a soma
   mov  ecx,x     ;ECX aponta para o elemento atual a ser somado

top:  
   add  ebx, [ecx]
   add  ecx,1      ;move ponteiro para o próximo elemento
   dec  eax        ;decrementa o contador
   jnz  top        ;se o contador não é zero continua

done: 

   add   ebx, '0'
   mov  [sum], ebx ;finaliza guardando o resutado em sum

display:

   mov  edx,1      ;comprimento da mensgem
   mov  ecx, sum   ;messagem a escrever
   mov  ebx, 1     ; (stdout)
   mov  eax, 4     ; (sys_write)
   int  0x80       

   mov eax, 4
   mov ebx,1
   mov ecx,newLineMsg
   mov edx,newLineLen
   int 0x80

   mov  eax, 1     ;(sys_exit)
   int  0x80       

section	.data
newLineMsg db  0xa
newLineLen equ $-newLineMsg
global x
x:    
   db  2
   db  4
   db  3

sum: 
   db  0

