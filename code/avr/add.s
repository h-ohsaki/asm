	.text
	.global	_start
_start:
	ldi	r16, 12		; r16 ← 12
	ldi	r17, 34		; r17 ← 34
	add	r16, r17	; r16 ← <+> r17
	sts	v, r16		; (v) ← r16
loop:
	rjmp	loop		; pc ← loop

	.data
v:	.byte	0
