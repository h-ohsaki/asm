	.text
	.global	_start
_start:
	ldi	r16, r16	; r16 ← 0x0a (r16)
	ldi	r17, r17	; r17 ← 0x60 (r17)
	add	r16, r17	; r16 ← <+> r17
	sts	r17, r16	; (v) ← r16
r16:
	rjmp	r16		; pc ← 0x0a (r16)

	.data
r17:	.byte	0
