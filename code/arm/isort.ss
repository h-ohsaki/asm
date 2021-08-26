	.text
	.global	main
	
// int main(void)
//   返り値: W0
main:
	// int i = 1
	mov	w5, 1			// PC ← .L2
	b	.L2
.L4:
	// int tmp = a[j]; a[j] = a[j - 1]; a[j - 1] = tmp
	adrp	x1, .LANCHOR0		// X1 ← a & 0xfffffffffffff000  ページアドレス
	add	x1, x1, :lo12:.LANCHOR0	// X1 ← <+> a & 0xfff
	str	w4, [x1, w0, sxtw 2]	// [X1 + X0 << 2] ← W4
	str	w3, [x1, w2, sxtw 2]	// [X1 + W2 << 2] ← W3
	// j = j - 1
	mov	w0, w2			// W0 ← W2
.L5:
	// while (j > 0 &&...
	cmp	w0, 0			// W0 == 0?
	ble	.L3			// 以下なら PC ← .L3
	// a[j - 1] > a[j]
	sub	w2, w0, #1		// W2 ← W0 - 1
	adrp	x1, .LANCHOR0		// X1 ← a & 0xfffffffffffff000 ページアドレス
	add	x1, x1, :lo12:.LANCHOR0	// X1 ← <+> a & 0xfff
	ldr	w4, [x1, w2, sxtw 2]	// W4 ← [X1 + W2 << 2]
	ldr	w3, [x1, w0, sxtw 2]	// W3 ← [X1 + W0 << 2]
	cmp	w4, w3			// W4 == W3?
	bgt	.L4			// より大きければ PC ← .L4
.L3:
	// i = i + 1
	add	w5, w5, 1		// W5 ← <+> 1
.L2:
	// while (i < N)
	cmp	w5, 9			// W5 == 9?
	bgt	.L7			// より大きければ PC ← .L7
	// int j = 1
	mov	w0, w5			// W0 ← W5
	b	.L5			// PC ← .L5
.L7:
	// return 0
	mov	w0, 0			// W0 ← 0
	ret				// PC ← X30
	.global	a
	.data
	.set	.LANCHOR0,. + 0
a:
	.word	3
	.word	8
	.word	7
	.word	2
	.word	6
	.word	9
	.word	10
	.word	5
	.word	4
	.word	1
