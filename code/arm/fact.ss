	.text
	.global	fact
	
// int fact(int n)
//   n: W0, 返り値: w0
fact:
	stp	x19, x30, [sp, -16]!	// push X30; push X19
	mov	w19, w0			// W19 ← W0
	// if (n == 1)
	cmp	w0, 1			// W0 == 1?
	beq	.L2			// PC ← .L2 if ZF == 1
	// return n * fact(n - 1)
	sub	w0, w0, #1		// W0 ← <-> 1 
	bl	fact			// X30 ← PC + 4; PC ← fact
	mul	w19, w19, w0		// W19 ← <*> W0
.L2:
	// return 1
	mov	w0, w19			// W0 ← W19 
	ldp	x19, x30, [sp], 16	// pop X19; pop X30
	ret				// PC ← X30
	.global	main

// int main(void)
//   返り値: W0
main:
	str	x30, [sp, -16]!		// push X30 + 8 バイト確保
	// int n = fact(3)
	mov	w0, 3			// W0 ← 3
	bl	fact			// X30 ← PC + 4; PC ← fact
	// return 0
	mov	w0, 0			// W0 ← 0
	ldr	x30, [sp], 16		// pop X30 + 8 バイト開放
	ret
