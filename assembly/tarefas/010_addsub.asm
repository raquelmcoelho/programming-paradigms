SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

segment .data 

    msg1 db "Entre com um digito", 0xA,0xD 
    len1 equ $- msg1 

    msg2 db "Entre com um segundo digito", 0xA,0xD 
    len2 equ $- msg2 

    msg3 db "A soma eh: "
    len3 equ $- msg3

    newLineMsg db  0xa
    newLineLen equ $-newLineMsg

segment .bss

   num1 resb 2 
   num2 resb 2 
   res resb 1    

section	.text
   global _start    ;	
_start:             ; informa ao linker o ponto de entrada
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg1         
   mov edx, len1 
   int 0x80                

   mov eax, SYS_READ 
   mov ebx, STDIN  
   mov ecx, num1 
   mov edx, 2
   int 0x80            

   mov eax, SYS_WRITE        
   mov ebx, STDOUT         
   mov ecx, msg2          
   mov edx, len2         
   int 0x80

   mov eax, SYS_READ  
   mov ebx, STDIN  
   mov ecx, num2 
   mov edx, 2
   int 0x80        

   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg3          
   mov edx, len3         
   int 0x80

   ; movendo o primeiro numero para o registrador eax e o segundo para ebx
   ; e subtraindo o ascii 0 para converter em número decimal
	
   mov eax, [num1]
   sub eax, '0'
	
   mov ebx, [num2]
   sub ebx, '0'

   ; soma eax e ebx 
   add eax, ebx
   ; adiciona 0 para converter a soma de decimal para ASCII
   add eax, '0'

   ; armazenando a soma no local de memoria referenciado por res
   mov [res], eax

   ; imprime a soma
   mov eax, SYS_WRITE        
   mov ebx, STDOUT
   mov ecx, res         
   mov edx, 1        
   int 0x80

exit:    
   
    mov edx,newLineLen
    mov ecx,newLineMsg
    mov ebx,STDOUT
    mov eax,SYS_WRITE
    int 0x80 
    xor ebx, ebx 
    mov eax, SYS_EXIT   
    int 0x80

