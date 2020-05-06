; inputs : rdi = fd ; rsi = buf ; rdx = nbytes

		global	_ft_read
		extern ___error
		section	.text

_ft_read:
		mov		rax, 0x02000003	; system call for read
		syscall					; invoke operating system to do the read
		cmp		rdx, 0
		jne		error
		ret

error:
		mov		r9, rax
		call	___error
		mov		byte [rax], r9b
		sub		rax, rax
		dec		rax				; set rax to -1
		ret
