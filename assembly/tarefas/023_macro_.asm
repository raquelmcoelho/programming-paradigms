; Uma macro com dois parâmmetros
; implementa a system call write
   %macro write_string 2 
      mov   eax, 4
      mov   ebx, 1
      mov   ecx, %1
      mov   edx, %2
      int   80h
   %endmacro
 
section	.text
   global _start            
	
_start:                     
   write_string msg1, len1               
   write_string msg2, len2    
   write_string msg3, len3 
	
   mov eax,1                ; (sys_exit)
   int 0x80                 

section	.data
msg1 db	'Alo programadoress...!',0xA,0xD 	
len1 equ $ - msg1			

msg2 db 'Bem vindo ao mundo da,', 0xA,0xD 
len2 equ $- msg2 

msg3 db 'Programação assembly para linux ',0xA,0xD
len3 equ $- msg3
