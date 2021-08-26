	.text
	.global	main
	
// int main(void)
//   返り値: W0
main:
	b	.L2				// PC ← .L2
.L3:
	// i = i - 1
	sub	w0, w0, #1			// W0 ← <-> 1
	adrp	x2, .LANCHOR0			// X2 ← .LANCHOR0 & 0xfffffffffff000  ページアドレス
	add	x1, x2, :lo12:.LANCHOR0		// X1 ← i
	str	w0, [x2, #:lo12:.LANCHOR0]	// [i] ← W0
	// j = j + 1
	ldr	w0, [x1, 4]			// W0 ← [j]
	add	w0, w0, 1			// W0 ← <+> 1
	str	w0, [x1, 4]			// [j] ← W0
.L2:
	// while (i > 0)
	adrp	x0, .LANCHOR0			// X0 ← .LANCHOR0 & 0xfffffffffff000  ページアドレス
	ldr	w0, [x0, #:lo12:.LANCHOR0]	// W0 ← [i]
	cmp	w0, 0				// W0 == 0?
	bgt	.L3				// より大きければ PC ← .L3
	// return j
	adrp	x0, .LANCHOR0			// X0 ← .LANCHOR0 & 0xfffffffffff000  ページアドレス
	add	x0, x0, :lo12:.LANCHOR0		// X0 ← i
	ldr	w0, [x0, 4]			// W0 ← [j]
	ret
	.global	j
	.global	i
	.data
	.set	.LANCHOR0,. + 0
i:
	.word	123
j:
	.word	456
