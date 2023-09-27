section	.text
   global _start         
	
_start:                  
   ;create the file
   mov  eax, 8
   mov  ebx, file_name
   mov	edx,lenmsgfilename 
   mov  ecx, 0777        ;ler, escrever e esecutar por todos
   int  0x80             
	
   mov [fd_out], eax
    
   ;escrever no arquivo
   mov	edx,lenmsg          ;número de bytes
   mov	ecx, msg         ;mensagem para escrever
   mov	ebx, [fd_out]    ;descritor do arquivo
   mov	eax,4            ; (sys_write)
   int	0x80             
	
   ; fecha o arquivo
   mov eax, 6
   mov ebx, [fd_out]
    
   ; escreve a mensagem indicando o fim do arquivos
   mov eax, 4
   mov ebx, 1
   mov ecx, msg_done
   mov edx, len_done
   int  0x80
    
   ;abre o arquivo para leitura
   mov eax, 5
   mov ebx, file_name
   mov ecx, 0             ;para acesso somente de leitura
   mov edx, 0777          ;ler escrever e executar por todos
   int  0x80
	
   mov  [fd_in], eax
    
   ;ler do arquivo
   mov eax, 3
   mov ebx, [fd_in]
   mov ecx, info
   mov edx, 26
   int 0x80
    
   ; fechar o arquivo
   mov eax, 6
   mov ebx, [fd_in]
   int  0x80    
	
   ; imprimir informações
   mov eax, 4
   mov ebx, 1
   mov ecx, info
   mov edx, 26
   int 0x80
       
   mov	eax,1             ;(sys_exit)
   int	0x80             

section	.data
file_name db 'myfile.txt',0
lenmsgfilename equ $-file_name
msg db 'Bem vindo ao assembly',0xa
lenmsg equ  $-msg

msg_done db 'Escrito no arquivo', 0xa
len_done equ $-msg_done

section .bss
fd_out resb 1
fd_in  resb 1
info resb  26