; inputs : rdi = str ; rsi = base

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

	global	_ft_atoi_base
	section	.text
_ft_atoi_base:
	save	rdi, rsi
	cmp		rsi, 0
	je		error					; return 0 if base == 0
	sub		r8, r8					; set r8 to 0
	mov		r9, r8
	inc		r9						; set r9 to 1
	mov		r10b, byte [rsi]	; save character for comparison
	cmp		r10b, 0
	je		error

check_base_doubles:
	cmp		byte [rsi + r9], r10b
	je		error
	cmp		byte [rsi + r9], 0
	je		base_len
	inc		r9
	jmp		check_base_doubles

base_len:
	cmp		r10b, ' '
	je		error
	cmp		r10b, 9
	je		error
	cmp		r10b, 10
	je		error
	cmp		r10b, 13
	je		error
	cmp		r10b, 11
	je		error
	cmp		r10b, 12
	je		error
	cmp		r10b, '-'
	je		error
	cmp		r10b, '+'
	je		error					; return 0 if base contains space, '-' or '+'
	inc		r8
	mov		r10b, byte [rsi + r8]	; save character for comparison
	cmp		r10b, 0
	je		check_base_len
	mov		r9, r8
	inc		r9						; set r9 to r8 + 1
	jmp		check_base_doubles

check_base_len:
	cmp		r8, 2
	jl		error					; error if base contains less than 2 characters
	sub		rax, rax				; set rax to 0
	dec		rdi
	mov		r11, 0

; At this point, r8 contains the length of the base, and the base is checked
; rax is set to 0

skip_whitespace:
	inc		rdi
	cmp		byte [rdi], ' '
	je		skip_whitespace
	cmp		byte [rdi], 9
	je		skip_whitespace
	cmp		byte [rdi], 10
	je		skip_whitespace
	cmp		byte [rdi], 13
	je		skip_whitespace
	cmp		byte [rdi], 11
	je		skip_whitespace
	cmp		byte [rdi], 12
	je		skip_whitespace
	dec		rdi

sign_handling:
	inc		rdi
	cmp		byte[rdi], '+'
	je		sign_handling
	cmp		byte[rdi], '-'
	jne		no_xor
	xor		r11, 1

no_xor:
	cmp		byte[rdi], '-'
	je		sign_handling

prepare_get_digit:
	sub		r9, r9				; set r9 to 0
	mov		r10b, byte [rdi]	; set r10b to digit in base 'base'

get_digit_base10:
	cmp		r10b, byte [rsi + r9]
	je		convert_base		; if characters are the same, r9 is the digit in base 10
	inc		r9
	cmp		byte [rsi + r9], 0
	je		return
	jmp		get_digit_base10

convert_base:
	imul	r8					; multiplies rax by r8 (base length) and puts the output in rax
	add		rax, r9				; adds the selected digit in base 10 to rax
	inc		rdi
	cmp		byte [rdi], 0
	je		return				; exits the program if reached end of str
	mov		r9, r8				; resets r9 to r8 for multiplication
	jmp		prepare_get_digit

error:								; return 0 when called
	sub		rax, rax

return:								; return rax
	cmp		r11, 0
	je		return_pos
	neg		rax
return_pos:
	restore	rdi, rsi
	ret
