; inputs : rdi = fd ; rsi = buf ; rdx = nbytes

		global	_ft_write
		extern ___error
		section	.text

_ft_write:
		push	rdi
		push	rsi
		push	rdx
		mov		rax, 0x02000004	; system call for write
		syscall					; invoke operating system to do the write
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
