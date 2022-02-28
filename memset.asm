;memset in assembly

bits 64

section .text
    global memset:function

memset:
    mov rax, 0                  ; On initialise rax à 0
    cmp dl, 0                   ; On compare le dl (caractère à copier) avec 0 (caractère nul)
    je end                      ; Si il est égal à 0, on passe à la suite (end)
    jmp looping                 ; Sinon, on passe à la boucle

looping:
    mov BYTE [rdi + rax], sil   ; On copie le caractère (sil) dans la mémoire à l'adresse rdi + rax (adresse de départ)
    inc rax                     ; On incrémente rax pour passer au caractère suivant (si il y en a un)
    cmp rax, rdx                ; On compare rax avec rdx (nombre de caractères à copier) (rdx qui correspond a size_t)
    jne looping                 ; Si rax n'est pas égal à rcx, on passe à la suite (looping)

end:
    mov rax, rdi                ; On met rax à rdi (adresse de départ)
    ret                         ; On retourne rdi (adresse de départ)