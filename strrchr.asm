;Strchr in ASM

bits 64

section .text
    global strrchr:function

strrchr:
    mov rcx, 0              ;initialiser le compteur de caractère
    jmp looping             ;on jump jusqu'a looping pour commencer

looping:
    cmp BYTE [rdi], 0       ;On compare le caractere avec 0 (fin de chaine)
    je ending               ;Si c'est egal on jump vers ending (fin de la fonction)
    cmp BYTE [rdi], sil     ;On compare avec l'argument sil (caractere a chercher)
    je found                ;Si c'est egal on jump vers found (caractere trouve)
    inc rdi                 ;On incremente le pointeur de chaine (pointeur vers le caractere suivant)
    inc rcx                 ;On incremente le compteur de boucle (compteur de caractere)
    jmp looping             ;On jump jusqu'a looping (boucle)

found:
    mov rax, rdi            ;On stocke le pointeur dans rax (pointeur de chaine)
    mov rdi, rcx            ;On stocke le compteur dans rdi (compteur de boucle)
    ret                     ;On retourne

ending:
    mov rax, 0              ;On stocke 0 dans rax (pointeur de chaine)
    mov rdi, rcx            ;On stocke le compteur dans rdi (compteur de boucle)
    ret                     ;On retourne