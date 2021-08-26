// レジスタ X0 の値を 4 倍
	.global	_start
	.text
_start:
	mov     x0, 1234	// X0 ← 1234
	lsl	x0, x0, 2	// X0 ← <<<> 2

	mov	x8, 93		// 93 番は exit
	svc	0		// システムコール呼び出し
