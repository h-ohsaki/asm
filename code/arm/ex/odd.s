// X0 が奇数であれば X1 を 1 に、そうでなければ 0 にする
	.global	_start
	.text
_start:
	mov     x0, 101		// X0 ← 100
	tst	x0, 1		// X0 & 1 に従って PSTATE を設定
	cset	x1, ne		// X1 ← ゼロでないなら1、ゼロであれば0

	mov	x8, 93		// 93 番は exit
	svc	0		// システムコール呼び出し
