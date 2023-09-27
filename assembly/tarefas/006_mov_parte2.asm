   ;Chamada de Sistema
   mov	eax,4
   ;Chama o kernel
   int	0x80
   ;Muda o nome para 'Mary'
   mov	[nome],dword 'Mary' ;dword
   ;Escrevendo o nome
   ;Comprimento
   mov	edx,lenUserMsg
   ;Mensagem a escrever
   mov	ecx,nome
   ;Descritor do Arquivo
   mov	ebx,1
   ;Chamada do sistema
   mov	eax,4
   ;Chama o kernel
   int	0x80
