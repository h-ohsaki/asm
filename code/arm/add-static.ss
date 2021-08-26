	.text
	.global	main
	
// int main(void)
//   返り値: W0
main:
	// i = 123
	adrp	x0, .LANCHOR0			// X0 ← i & 0xfffffffffffff000 ページアドレス
	add	x1, x0, :lo12:.LANCHOR0		// X1 ← X0 + (i & 0xfff)
	mov	w2, 123				// W2 ← 123
	str	w2, [x0, #:lo12:.LANCHOR0]	// [i] ← W2
	ldr	w2, [x0, #:lo12:.LANCHOR0]	// W2 ← [i]
	// i =  + 1
	add	w2, w2, 1			// W2 ← <+> 1
	str	w2, [x0, #:lo12:.LANCHOR0]	// [i] ← W2
	// j = 456
	mov	w2, 456				// W2 ← 456
	str	w2, [x1, 4]			// [j] ← W2
	// j = i + j
	ldr	w0, [x0, #:lo12:.LANCHOR0]	// W0 ← [i]
	ldr	w2, [x1, 4]			// W2 ← [j]
	add	w0, w0, w2			// W0 ← <+> W2
	str	w0, [x1, 4]			// [j] ← W0
	// return j
	ldr	w0, [x1, 4]			// W0 ← [j]
	ret					// PC ← X30
	.global	j
	.global	i
	.bss
	.set	.LANCHOR0,. + 0
i:
	.zero	4
j:
	.zero	4
