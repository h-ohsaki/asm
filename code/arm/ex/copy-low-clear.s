// X0 の下位 32 ビットを X1 の下位 32 ビットにコピー (上位ビットはゼロクリア)
	.global	_start
	.text
_start:
	mov     x0, 0xdef0	// X0 ← 0x123456789abcdef0
	movk    x0, 0x9abc, lsl 16
	movk    x0, 0x5678, lsl 32
	movk    x0, 0x1234, lsl 48
	mov	x1, -1		// X1 ← 0xffffffffffffffff

	mov	w1, w0		// W1 ← W0 (X1 の 上位 32 ビットはクリアされる)
	
	mov	x8, 93		// 93 番は exit
	svc	0		// システムコール呼び出し
