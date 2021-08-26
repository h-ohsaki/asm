// スタックポインタ (レジスタ SP) の値をレジスタ X0 にコピー
	.global	_start
	.text
_start:
	mov     x0, sp		// X0 ← SP
	
	mov	x8, 93		// 93 番は exit
	svc	0		// システムコール呼び出し
