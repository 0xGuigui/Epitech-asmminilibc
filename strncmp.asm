;Strncmp in ASM

bits 64
section .text
    global strncmp:function

strncmp:
    mov rax, 0                      ;initialiser rax à 0
    dec rdx                         ;decrementer rdx pour avoir la longueur de la chaine de caractères
    jmp looping                     ;on va dans la boucle

looping:
    cmp rdx, 0                      ;on compare le nombre de caractères à comparer
    jle endncmp                     ;si le caractère est nul, on sort de la boucle
    mov cl, BYTE[rsi]               ;on prend le caractère de la chaine 1
    cmp BYTE[rdi], cl               ;compare les deux caractères de la chaine
    jne end                         ;si les deux adresses ne sont pas égales, on sort de la boucle
    cmp BYTE [rdi], 0               ;on compare le caractère de la première adresse
    je end                          ;si le caractère est nul, on sort de la boucle
    cmp BYTE [rsi], 0               ;on compare le caractère de la deuxième adresse
    je end                          ;si le nombre de caractères à comparer est égal à 0, on sort de la boucle
    dec rdx                         ;on décrémente le nombre de caractères à comparer
    inc rdi                         ;on incrémente rdi
    inc rsi                         ;on incrémente rsi
    jmp looping                     ;on recommence la boucle

endncmp:
    mov rax, 0                      ;initialiser rax à 0 pour le retour
    ret                             ;on retourne rax

end:
    movzx rax, BYTE [rdi]           ;on récupère le caractère de la première adresse
    movzx rcx, BYTE [rsi]           ;on récupère le caractère de la deuxième adresse
    sub rax, rcx                    ;on soustrait les deux caractères de la chaine
    ret                             ;on retourne rax