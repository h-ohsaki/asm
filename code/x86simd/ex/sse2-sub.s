	.global	_start
	.text
_start:
	movdqa	x, %xmm0
	psubsw	y, %xmm0

	movl    $1, %eax
        int     $0x80

	.data
	.align	16
x:	.word	1, 2, 3, 4, 5, 6, 7, 8
y:	.word	1, 0, -1, -2, 1, 0, -1, -2
