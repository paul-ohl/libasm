; inputs : rdi = str ; rsi = base

	global	_ft_atoi_base
	section	.text
_ft_atoi_base:
	cmp		rsi, 0
	jle		error					; return 0 if base <= 0
	sub		r8, r8					; set r8 to 0
	mov		r9, r8
	inc		r9						; set r9 to 1
	mov		r12b, byte [rsi + r8]	; save character for comparison
	cmp		r12b, 0
	je		error

check_base_doubles:
	cmp		byte [rsi + r9], r12b
	je		error
	cmp		byte [rsi + r9], 0
	je		base_len
	inc		r9
	jmp		check_base_doubles

base_len:
	cmp		r12b, ' '
	je		error
	cmp		r12b, '-'
	je		error
	cmp		r12b, '+'
	je		error					; return 0 if base contains space, '-' or '+'
	inc		r8
	mov		r12b, byte [rsi + r8]	; save character for comparison
	cmp		r12b, 0
	je		check_base_len
	mov		r9, r8
	inc		r9						; set r9 to r8 + 1
	jmp		check_base_doubles

check_base_len:
	cmp		r8, 2
	jl		error					; error if base contains less than 2 characters
	sub		rax, rax				; set rax to 0
	mov		r11, rax
	mov		r9, r8

; At this point, r8 and r9 contains the length of the base, and the base is checked
; rax is set to 0

multiply_by_base:	; executes r8 * rax, r9 must equal r8 and r11 must equal rax before starting the function
	dec		r9
	cmp		r9, 0
	je		prepare_get_digit
	add		rax, r11
	jmp		multiply_by_base

prepare_get_digit:
	sub		r9, r9				; set r9 to 0
	mov		r10b, byte [rdi]	; set r10b to digit in base 'base'

get_digit_base10:
	cmp		r10b, byte [rsi + r9]
	je		convert_base		; if characters are the same, r9 is the digit in base 10
	inc		r9
	cmp		byte [rsi + r9], 0
	je		error
	jmp		get_digit_base10

convert_base:
	add		rax, r9				; adds the selected digit in base 10 to rax
	inc		rdi
	cmp		byte [rdi], 0
	je		return				; exits the program if reached end of str
	mov		r9, r8				; resets r9 to r8 for multiplication
	mov		r11, rax			; resets r11 to rax for multiplication
	jmp		multiply_by_base

error:								; return 0 when called
	sub		rax, rax

return:								; return rax
	ret

debug_error:						; TO DELETE
	sub		rax, rax
	dec		rax
	ret
