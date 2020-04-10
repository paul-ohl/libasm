; inputs : rdi = fd ; rsi = buf ; rdx = nbytes

		global	_ft_read
		section	.text

_ft_read:
		mov		rax, 0x02000003	; system call for read
		syscall					; invoke operating system to do the read
		cmp		rdx, 0
		jne		error
		ret

error:
		sub		rax, rax
		dec		rax				; set rax to -1
		ret
