	.text
.LC0:
	.string	"%d -> %d\n"
	.text
	.global	hanoi
	
// void hanoi(int n, int from, int to, int aux)
//   n: W0, from: W1, to: W2, aux: W3, 返り値: なし
hanoi:
	stp	x19, x20, [sp, -48]!	// push X20; push X19 + 32 バイトを確保
	stp	x21, x22, [sp, 16]	// push X22; push X21
	str	x30, [sp, 32]		// [SP + 32] ← X30
	mov	w21, w1			// W21 ← W1
	mov	w20, w2			// W20 ← W2
	// if (n == 1)
	cmp	w0, 1			// W0 == 1?
	beq	.L5			// PC ← .L5 if ZF == 1
	// hanoi (n - 1, from, aux, to)
	mov	w22, w3			// W22 ← W3
	sub	w19, w0, #1		// W9 ← W0 - 1
	mov	w3, w2			// W3 ← W2
	mov	w2, w22			// W2 ← W22
	mov	w0, w19			// W0 ← W19
	bl	hanoi			// X30 ← PC + 4; PC ← hanoi
	// printf ("%d -> %d\n", from, to)
	mov	w2, w20			// W2 ← W20
	mov	w1, w21			// W1 ← W21
	adrp	x0, .LC0		// X0 ← .LC0 & 0xfffffffffffff000  ページアドレス
	add	x0, x0, :lo12:.LC0	// X0 ← <+> .LC0 & 0xfff
	bl	printf			// X30 ← PC + 4; PC ← printf
	// hanoi (n - 1, aux, to, from)
	mov	w3, w21			// W3 ← W21
	mov	w2, w20			// W2 ← W20
	mov	w1, w22			// W1 ← W22
	mov	w0, w19			// W0 ← W19
	bl	hanoi			// X30 ← PC + 4; PC ← hanoi
.L1:
	ldp	x21, x22, [sp, 16]	// pop X1; pop X22
	ldr	x30, [sp, 32]		// X30 ← [SP + 32]
	ldp	x19, x20, [sp], 48	// pop X19; pop X20 + 32 バイトを開放
	ret
.L5:
	// printf ("%d -> %d\n", from, to)
	adrp	x0, .LC0		// X0 ← .LC0 & 0xfffffffffffff000  ページアドレス
	add	x0, x0, :lo12:.LC0	// X0 ← <+> .LC0 & 0xfff
	bl	printf			// X30 ← PC + 4; PC ← printf
	b	.L1			// PC ← .L1
	.global	main
	
// int main(void)
//   返り値: W0
main:					
	str	x30, [sp, -16]!		// push X30 + 8 バイトを確保
	// hanoi (5, 100, 200, 300)
	mov	w3, 300			// W3 ← 300
	mov	w2, 200			// W2 ← 200
	mov	w1, 100			// W1 ← 100
	mov	w0, 5			// W0 ← 5
	bl	hanoi			// X30 ← PC + 4; PC ← hanoi
	// return 0
	mov	w0, 0			// W0 ← 0
	ldr	x30, [sp], 16		// pop X30 + 8 バイトを開放
	ret				// PC ← X30
