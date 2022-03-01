;memset in assembly

bits 64

section .text
    global memset:function

memset:
    mov rax, 0                      ; On initialise rax à 0
    cmp dl, 0                       ; On compare le dl (caractère à copier) avec 0 (caractère nul)
    je ending                       ; Si il est égal à 0, on passe à la suite (ending)
    jmp looping                     ; Sinon, on passe à la boucle

looping:
    mov r8, rax                     ; On stocke rax dans r8
    mov r9, r8                      ; On stocke r8 dans r9
    add r9, rdi                     ; On ajoute rdi à r9 (on ajoute le nombre de caractères à copier) pour avoir la position finale
    mov BYTE [r9], sil              ; On copie le caractère à copier dans la mémoire à l'adresse r9
    inc rax                         ; On incrémente rax pour passer au caractère suivant (si il y en a un)
    cmp rax, rdx                    ; On compare rax avec rdx (nombre de caractères à copier) (rdx qui correspond a size_t)
    jne looping                     ; Si rax n'est pas égal à rcx, on passe à la suite (looping)

ending:
    mov rax, rdi                    ; On met rax à rdi (adresse de départ)
    ret                             ; On retourne rdi (adresse de départ)