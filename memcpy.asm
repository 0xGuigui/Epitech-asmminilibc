;memcpy in assembly

bits 64

section .text
    global memcpy:function

memcpy:
	mov rcx, 0				; On initialise le compteur de boucle
	cmp rdx, 0 				; On compare le nombre de caractères à copier avec 0
	je ending				; Si le nombre de caractères à copier est égal à 0, on sort de la fonction
    jmp looping				; Sinon on passe à la boucle

looping:
    mov r8, rcx				; On stocke le compteur de boucle dans r8
	mov r9, r8				; On stocke le compteur de boucle dans r9
	add r9, rsi				; On ajoute le pointeur de départ à r9
	mov al, [r9]			; On stocke le caractère à copier dans al
	mov r10, r8				; On stocke le compteur de boucle dans r10
	add r10, rdi			; On ajoute le pointeur de destination à r10
	mov [r10], al			; On copie le caractère dans le pointeur d'arrivée en lui donnant la valeur de al
	inc rcx					; On incrémente le compteur de boucle
	cmp rdx, rcx			; On compare le nombre de caractères à copier avec le compteur de boucle (on vérifie que le compteur de boucle n'a pas atteint le nombre de caractères à copier)
	jne looping				; Si le compteur de boucle n'est pas égal au nombre de caractères à copier, on passe à la boucle
	jmp ending				; Sinon on sort de la fonction

ending:
	mov rax, rdi			; On stocke le pointeur d'arrivée dans rax (on retourne le pointeur d'arrivée)
	ret						; On retourne le pointeur d'arrivée