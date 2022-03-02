;Strcmp in ASM

bits 64

section .text
    global strcmp:function

strcmp:
    mov rax, 0                      ; initialiser rax à 0
    jmp looping                     ; on va dans la boucle

looping:
    mov cl, BYTE[rsi]               ; on prend le caractère de la chaine 1
    cmp BYTE[rdi], cl               ; compare les deux caractères de la chaine
    jne end                         ; si les deux adresses ne sont pas égales, on sort de la boucle
    cmp byte [rdi], 0               ; on compare le caractère de la première adresse avec 0 (fin de chaine)
    je end                          ; si le caractère est nul, on sort de la boucle
    cmp byte [rsi], 0               ; on compare le caractère de la deuxième adresse avec 0 (fin de chaine)
    je end                          ; si le caractère est nul, on sort de la boucle
    inc rdi                         ; on incrémente rdi
    inc rsi                         ; on incrémente rsi
    jmp looping                     ; on recommence la boucle jusqu'à ce que les deux adresses soient égales

end:
    movzx rax, BYTE[rdi]            ; on récupère le caractère de la première adresse dans rax
    movzx rcx, BYTE[rsi]            ; on récupère le caractère de la deuxième adresse dans rcx
    sub rax, rcx                    ; on soustrait les deux caractères de la chaine
    ret                             ; on retourne rax