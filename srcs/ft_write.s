; inputs : rdi = fd ; rsi = buf ; rdx = nbytes

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

		global	_ft_write
		extern ___error
		section	.text

_ft_write:
		save	rdi, rsi, rdx
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
		restore	rdi, rsi, rdx
		ret
