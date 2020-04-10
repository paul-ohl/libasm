; inputs : rdi = str1 ; rsi = str2

		global	_ft_strcmp
		section	.text
_ft_strcmp:

count:
		mov		al, byte [rdi]
		cmp		al, 0			; checking if reached end of str1
		je		compare_chars
		cmp		al, byte [rsi]	; checking if difference btw rdi and rsi
		jne		compare_chars

		inc		rsi				; else go to next character in the string
		inc		rdi				; go to next character in the string
		jmp		count			; loop

compare_chars:
		cmp		al, byte [rsi]	; checking if difference btw rdi and rsi
		je		ret_0
		jg		ret_1
		jl		ret_minus_1

ret_0:
		mov	rax, 0				; return 0 if equal
		ret

ret_1:
		mov	rax, 1				; return 1 if str1 > str2
		ret

ret_minus_1:
		mov	rax, -1				; return -1 if str1 < str2
		ret
