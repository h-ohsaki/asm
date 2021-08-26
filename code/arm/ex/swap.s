// レジスタ X0 と X1 の値を交換
	.global	_start
	.text
_start:
	mov     x0, 0xdef0	// X0 ← 0x123456789abcdef0
	movk    x0, 0x9abc, lsl 16
	movk    x0, 0x5678, lsl 32
	movk    x0, 0x1234, lsl 48
	mov	x1, -1		// X1 ← 0xffffffffffffffff

	mov	x2, x0		// X2 ← X0
	mov	x0, x1		// X0 ← X1
	mov	x1, x2		// X1 ← X2
	
	mov	x8, 93		// 93 番は exit
	svc	0		// システムコール呼び出し
