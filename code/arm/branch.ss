	.text
	.global	main
	
// int main(void)
//  返り値: W0	
main:
	// 最適化によりロジックが変更になっている
	adrp	x1, .LANCHOR0			// X1 ← j & 0xfffffffffffff000  ページアドレス
	add	x2, x1, :lo12:.LANCHOR0		// X2 ← X1 + (j & 0xfff)
	ldr	w0, [x1, #:lo12:.LANCHOR0]	// W0 ← [j]
	ldr	w3, [x2, 4]			// W3 ← [i]
	sub	w2, w0, #1			// W2 ← W0 - 1
	// if (i == 123)
	cmp	w3, 123				// W3 == 123?
	csinc	w0, w2, w0, ne			// W0 ← ZF == 0 ? W2 : (W0 + 1)
	str	w0, [x1, #:lo12:.LANCHOR0]	// [j] ← W0
	ret					// PC ← X30
	.global	j
	.global	i
	.data
	.set	.LANCHOR0,. + 0
j:
	.word	456
i:
	.word	123
