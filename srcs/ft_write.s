; inputs : rdi = fd ; rsi = buf ; rdx = nbytes
; Problem: how to detect wrong fd

		global	_ft_write
		section	.text

_ft_write:
		push	rdx
		mov		rax, 0x02000004	; system call for write
		syscall					; invoke operating system to do the write
		cmp		rdx, 0
		jne		error
		pop		rax
		ret

error:
		pop		rax
		sub		rax, rax
		dec		rax				; set rax to -1
		ret
