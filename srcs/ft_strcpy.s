; inputs: rdi = dst ; rsi = src

%macro save 1-*
	%rep %0
		push %1
		%rotate 1
	%endrep
%endmacro
%macro restore 1-*
	%rep %0
		%rotate -1
		pop %1
	%endrep
%endmacro

	global	_ft_strcpy
	section	.text
_ft_strcpy:
	save	rdi, rsi
	mov		rax, rdi


cpy_char:
	movsb
	cmp		byte [rsi - 1], 0
	je		return
	jmp		cpy_char

return:
	restore	rdi, rsi
	ret
