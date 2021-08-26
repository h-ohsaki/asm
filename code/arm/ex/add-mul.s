// (12 + 34) / (5 - 6) * (7 - 89) を計算
	.global	_start
	.text
_start:
	mov     x0, 12		// X0 ← 12
	add	x0, x0, 34	// X0 ← <+> 34
	mov	x1, 5		// X1 ← 5
	sub	x1, x1, 6	// X1 ← <-> 6
	sdiv	x0, x0, x1	// X0 ← </> X1
	mov	x1, 7		// X1 ← 7
	sub	x1, x1, 89	// X1 ← <-> 89
	mul	x0, x0, x1	// X0 ← <*> X1

	mov	x8, 93		// 93 番は exit
	svc	0		// システムコール呼び出し
