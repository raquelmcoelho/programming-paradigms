_start:
   ; Mensagem para o usuário (prompt)
   ; Observe a sequência dos registradores A - Numero SYSCALL, B - Descritor,
   ; C - mensagem , D - Comprimento
   mov eax, 4
   mov ebx, 1
   mov ecx, userMsg
   mov edx, lenUserMsg
   int 80h

   ; Lê e armazena a entrada fornecida pelo usuário 
   mov eax, 3
   mov ebx, 2
   mov ecx, num  
   ;5 bytes (numerico, 1 para o sinal(-/+))
   mov edx, 5
   int 80h
