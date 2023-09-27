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
   mov	ebx,1


