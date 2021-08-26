// X0 (符号なし整数) が 123 以上であれば X1 を 1 に、そうでなければ 0 にする
	.global	_start
	.text
_start:
	mov     x0, 100		// X0 ← 100
	cmp	x0, 123		// X0 == 123?
	cset	x1, pl		// X1 ← 正またはゼロなら1、そうでなければ0

	mov	x8, 93		// 93 番は exit
	svc	0		// システムコール呼び出し
