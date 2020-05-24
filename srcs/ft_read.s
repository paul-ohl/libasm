; inputs : rdi = fd ; rsi = buf ; rdx = nbytes

		global	_ft_read
		extern ___error
		section	.text

_ft_read:
		push	rdi
		push	rsi
		push	rdx
		mov		rax, 0x02000003	; system call for read
		syscall					; invoke operating system to do the read
		jc		error
		pop		rdi
		pop		rsi
		pop		rdx
		ret

error:
		mov		r9, rax
		call	___error
		mov		dword [rax], r9d
		sub		rax, rax
		dec		rax				; set rax to -1
		pop		rdi
		pop		rsi
		pop		rdx
		ret
