	.global	_start
	.text
_start:
	movdqa	x, %xmm0
	subps	y, %xmm0

	movl    $1, %eax
        int     $0x80

	.data
	.align	16
x:	.float	1.23, 4.56, -7.8, 9.0
y:	.float	1.23, -1.23, 0, 4.56
