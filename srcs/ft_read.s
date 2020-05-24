; inputs : rdi = fd ; rsi = buf ; rdx = nbytes

		global	_ft_read
		extern ___error
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

_ft_read:
		save	rdi, rsi, rdx
		mov		rax, 0x02000003	; system call for read
		syscall					; invoke operating system to do the read
		jc		error
		restore	rdi, rsi, rdx
		ret

error:
		mov		r9, rax
		call	___error
		mov		dword [rax], r9d
		sub		rax, rax
		dec		rax				; set rax to -1
		restore	rdi, rsi, rdx
		ret
