	.text
	.global	main
// int main(void)
//   返り値: W0	
main:
	// int i = 1
	mov	w0, 1				// W0 ← 1
	b	.L2				// PC ← .L2
.L3:
	// sum += i
	adrp	x2, .LANCHOR0			// X2 ← sum & 0xfffffffffffff000  ページアドレス
	ldr	w1, [x2, #:lo12:.LANCHOR0]	// W1 ← [sum]
	add	w1, w1, w0			// W1 ← <+> W0
	str	w1, [x2, #:lo12:.LANCHOR0]	// [sum] ← W1
	// i++
	add	w0, w0, 1			// W0 ← <+> 1
.L2:
	// i <= 100
	cmp	w0, 100				// W0 == 100?
	ble	.L3				// 以下なら PC ← .L3 (B.LE 命令)
	// return 0
	mov	w0, 0				// W0 ← 0
	ret					// PC ← X30
	.global	sum
	.bss
	.set	.LANCHOR0,. + 0
sum:
	// int sum = 0
	.zero	4
