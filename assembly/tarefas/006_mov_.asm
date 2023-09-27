section	.data
    nome db 'Mano Josuelito ',0xa
    lenUserMsg equ $-nome
    newLineMsg db  0xa
    newLineLen equ $-newLineMsg

section	.text
   global _start
_start:
	
   ;Escrevendo o nome Manoel Josuelito
   ;Comprimento da mensagem
   mov	edx,lenUserMsg
   ;Mensagem a ser escrita
   mov	ecx, nome
   ;Descritor do arquivo (stdout)
   mov	ebx,1       ;file descriptor (stdout)
   ;Número da chamada de Sistema
   mov	eax,4
   ;Chama o kernel
   int	0x80

   ;Muda o nome para 'Marieta'
   mov	[nome],dword 'Mary' ;dword
	
   ;Escrevendo o nome
   ;Comprimento
   mov	edx,lenUserMsg
   ;Mensagem a escrever
   mov	ecx,nome    ;message to write
   ;Descritor do Arquivo
   mov	ebx,1
   ;Número da chamada do sistema
   mov	eax,4
   ;Chama o kernel
   int	0x80

   ;chama subrotina
   call _novaLinha
   ;salta para a saída
   jmp  _saida

_novaLinha:
    mov edx,newLineLen
    mov ecx,newLineMsg
    mov ebx,1
    mov eax,4
    int 0x80 
    ret
_saida:
    ; Número da chamada sys_exit
    mov	eax,1
    ;chama o kernel
    int	0x80


