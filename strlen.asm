;Strlen in ASM

bits 64

section .text
    global strlen:function

strlen:
    mov rcx, 0          ; Set RCX à 0 pour le compteur
    jmp looping         ; On exécute la boucle du strlen (voir plus bas)

looping:
    cmp BYTE [rdi], 0   ; rdi == string, [] permet de déréférencer, 0 limite == '\0' (fin de chaine)
    je ending           ; Si rdi == '\0' suite a son incrémentation, on execute la condition de fin car JE = Jump Equal et rdi = '\0'
    inc rdi             ; Incrémentation de RDI pour avancer dans la string
    inc rcx             ; Increment RCX pour compter le nombre de fois qu'on fait la boucle
    jmp looping         ; Boucle tant que str[rcx] != \0

ending:
    mov rax, rcx        ; On bouge la valeur de RCX dans RAX pour retourner la valeur de RCX
    ret                 ; Return de RAX