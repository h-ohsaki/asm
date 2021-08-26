// レジスタ X0 の値を、レジスタ X1 と X2 の両方にコピー
	.global	_start
	.text
_start:
	mov     x0, 0xdef0	// X0 ← 0x123456789abcdef0
	movk    x0, 0x9abc, lsl 16
	movk    x0, 0x5678, lsl 32
	movk    x0, 0x1234, lsl 48
	
	mov	x1, x0		// X1 ← X0
	mov	x2, x0		// X2 ← X0
	
	mov	x8, 93		// 93 番は exit
	svc	0		// システムコール呼び出し
