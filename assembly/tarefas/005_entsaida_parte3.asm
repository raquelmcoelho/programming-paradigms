   ; Sa�da da mensagem 'voce digitou'
   mov eax, 4
   mov ebx, 1
   mov ecx, dispMsg
   mov edx, lenDispMsg
   int 80h  
   ; sa�da do n�mero digitado
   mov eax, 4
   mov ebx, 1
   mov ecx, num
   mov edx, 5
   int 80h  
   ; sa�da final
   mov eax, 1
   mov ebx, 0
   int 80h
