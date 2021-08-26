	.global	_start
	.text
_start:
	movq	x, %mm0
	psubsw	y, %mm0

	movl    $1, %eax
        int     $0x80

	.data
x:	.word	1, 2, 3, 4
y:	.word	1, 0, -1, -2
