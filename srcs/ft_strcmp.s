; inputs : rdi = str1 ; rsi = str2

		global	_ft_strcmp
		section	.text

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

_ft_strcmp:
		save	rdi, rsi, rdx

count:
		mov		al, byte [rdi]
		cmp		al, 0			; checking if reached end of str1
		je		return
		cmp		al, byte [rsi]	; checking if difference btw rdi and rsi
		jne		return

		inc		rsi				; else go to next character in the string
		inc		rdi				; go to next character in the string
		jmp		count			; loop

return:
		movzx	rax, byte [rdi]	; moves byte of rdi in rax and completes with the sign
		movzx	rdx, byte [rsi]
		sub		rax, rdx
		restore	rdi, rsi, rdx
		ret
