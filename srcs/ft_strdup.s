; inputs : rdi = str

		global	_ft_strdup
		extern	_malloc
		section	.text
_ft_strdup:
		sub		rcx, rcx	; initialize counter to 0
		not		rcx			; set rcx to -1
		sub		al, al		; set al to 0
		push	rdi			; save initial pointer position
		cld
		repne	scasb		; repeat not equal scan s byte, increments rdi and decrements rcx while not equal to al
		not		rcx
		mov		rdi, rcx
		call	_malloc
		test	rax, rax	; Compares rax and rax,
		jz		return		; and jumps to fail if == 0
		mov		rdi, rax
		pop		rsi

copy_char:
		movsb				; Moves from rsi to rdi
		cmp		byte [rsi - 1], 0
		je		return
		jmp		copy_char

return:
		ret
