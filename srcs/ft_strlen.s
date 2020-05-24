; inputs: rdi = str

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

		global	_ft_strlen
		section	.text
_ft_strlen:
	save	rdi, rsi, rdx
	sub		rcx, rcx	; set rcx to 0
	not		rcx			; set rcx to -1
	sub		al, al		; set al to 0
	cld
	repne	scasb		; repeat not equal scan s byte, increments rdi and decrements rcx while not equal to al
	not		rcx
	dec		rcx
	mov		rax, rcx	; set rax to rcx
	restore	rdi, rsi, rdx
	ret
