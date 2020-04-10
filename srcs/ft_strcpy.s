; inputs: rdi = dst ; rsi = src

	global	_ft_strcpy
	section	.text
_ft_strcpy:
	mov		rax, rdi


cpy_char:
	movsb
	cmp		byte [rsi - 1], 0
	je		return
	jmp		cpy_char

return:
	ret
