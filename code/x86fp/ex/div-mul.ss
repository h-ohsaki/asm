	.text
	.data
x1:
	.long	858993459
	.long	1072902963
x2:
	.long	858993459
	.long	1074475827
x3:
	.long	0
	.long	1075052544
x4:
	.long	0
	.long	1075314688
x5:
	.long	0
	.long	1075576832
x6:
	.long	-858993459
	.long	1075956940
	.text
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-8, %esp
	subl	$16, %esp
	fldl	x1
	fldl	x2
	faddp	%st, %st(1)
	fldl	x3
	fldl	x4
	fsubrp	%st, %st(1)
	fdivrp	%st, %st(1)
	fldl	x5
	fldl	x6
	fsubrp	%st, %st(1)
	fmulp	%st, %st(1)
	fstpl	8(%esp)
	movl	$0, %eax
	leave
	ret
