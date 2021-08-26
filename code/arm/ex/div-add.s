// 789 / (123 + 456) を計算
	.global	_start
	.text
_start:
	mov     x0, 789		// X0 ← 123
	mov     x1, 123		// X1 ← 123
	add	x1, x1, 456	// X1 ← <+> 456
	udiv	x0, x0, x1	// X0 ← </> X1

	mov	x8, 93		// 93 番は exit
	svc	0		// システムコール呼び出し
