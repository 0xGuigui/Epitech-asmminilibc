;memcpy in assembly

bits 64

section .text
    global memcpy:function

memcpy:
	mov rcx, 0				; On initialise le compteur de boucle
	cmp rdx, 0 				; On compare le nombre de caractères à copier avec 0
	je end					; Si le nombre de caractères à copier est égal à 0, on sort de la fonction
    jmp looping				; Sinon on passe à la boucle

looping:
    mov r8, rcx				; On stocke le compteur de boucle dans r8
	mov al, [rsi + r8]		; On récupère le caractère à copier dans al
	mov [rdi + r8], al		; On copie le caractère dans le pointeur d'arrivée en lui donnant la valeur de al
	inc rcx					; On incrémente le compteur de boucle
	cmp rdx, rcx			; On compare le nombre de caractères à copier avec le compteur de boucle (on vérifie que le compteur de boucle n'a pas atteint le nombre de caractères à copier)
	jne looping				; Si le compteur de boucle n'est pas égal au nombre de caractères à copier, on passe à la boucle
	jmp end					; Sinon on sort de la fonction

end:
	mov rax, rdi			; On stocke le pointeur d'arrivée dans rax (on retourne le pointeur d'arrivée)
	ret						; On retourne le pointeur d'arrivée