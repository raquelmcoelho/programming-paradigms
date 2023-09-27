section	.text
   global _start   
_start:             
   mov	al,'9' ; al = 3
   sub  al,'0' ; al = numero
	
   mov 	bl, '2' ; bl = '2'
   sub  bl, '0' ; bl =  2
   mul 	bl      ; AH:AL = bl * al => 0:6 
   add	al, '0' ; al = 6
	
   mov 	[res], al ; al (6) � colocado na refer�ncia de res
   mov	ecx,msg	  ; mensagem preparada para ser enviada
   mov	edx, len  ;  comprimento daq mensagem setada
   mov	ebx,1	;(stdout)
   mov	eax,4	; (sys_write)
   int	0x80	
	
   mov	ecx,res ; resultado � copiado para o ecx
   mov	edx, 1  ; comprimento (1 byte)
   mov	ebx,1	;(stdout)
   mov	eax,4	; (sys_write)
   int	0x80	;

   mov edx,newLineLen
   mov ecx,newLineMsg
   mov ebx,1
   mov eax,4
   int 0x80 

   xor   ebx, ebx 
   mov	eax,1	; (sys_exit)
   int	0x80	;

; segmento de dados
section .data
msg db "O resultado eh:", 0xA,0xD 
len equ $- msg 
newLineMsg db  0xa
newLineLen equ $-newLineMsg  

; dados n�o inicializados
segment .bss
res resb 1