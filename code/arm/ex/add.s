// 123 + 456 を計算
	.global	_start
	.text
_start:
	mov     x0, 123		// X0 ← 123
	add	x0, x0, 456	// X0 ← <+> 456

	mov	x8, 93		// 93 番は exit
	svc	0		// システムコール呼び出し
