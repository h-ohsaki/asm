	.text
	.global	fib

// fib(n)
//   n: W0, 返り値: W0
fib:
	stp	x19, x20, [sp, -32]!	// push X20; push X19 + 16 バイト確保
	str	x30, [sp, 16]		// [SP + 16] ← X30
	mov	w19, w0			// W19 ← W0
	// if (n == 0)
	cbz	w0, .L2			// PC ← .L2 if W0 == 0
	// if (n == 1)
	cmp	w0, 1			// W0 == 1?
	beq	.L2			// PC ← .L2 if ZF == 1
	// fib (n - 1) + fib (n - 2)
	sub	w0, w0, #1		// W0 ← <-> 1
	bl	fib			// X30 ← PC + 4; PC ← fib
	mov	w20, w0			// W20 ← W0
	sub	w0, w19, #2		// W0 ← W19 - 2
	bl	fib			// X30 ← PC + 4; PC ← fib
	add	w19, w20, w0		// W19 ← W20 + W0
.L2:
	// 3 つの return 文をまとめた処理
	mov	w0, w19			// W0 ← W19
	ldr	x30, [sp, 16]		// X30 ← [SP + 16]
	ldp	x19, x20, [sp], 32	// pop X19; pop X20 + 16 バイト開放
	ret				// PC ← X30
	.global	main
	
// int main(void)
//   返り値: W0
main:
	str	x30, [sp, -16]!		// push X30 + 8 バイト確保
	// int n = fib (10)
	mov	w0, 10			// W0 ← 10
	bl	fib			// X30 ← PC + 4; PC ← fib
	// return 0
	mov	w0, 0			// W0 ← 0
	ldr	x30, [sp], 16		// pop X30 + 8 バイト開放
	ret				// PC ← X30
