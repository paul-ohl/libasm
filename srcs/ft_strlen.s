; inputs: rdi = str

		global	_ft_strlen
		section	.text
_ft_strlen:
	sub		rcx, rcx	; set rcx to 0
	not		rcx			; set rcx to -1
	sub		al, al		; set al to 0
	cld
	repne	scasb		; repeat not equal scan s byte, increments rdi and decrements rcx while not equal to al
	not		rcx
	dec		rcx
	mov		rax, rcx	; set rax to rcx
	ret
