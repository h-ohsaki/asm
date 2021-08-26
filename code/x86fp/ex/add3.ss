	.text
	.data
x1:
	.long	2061584302
	.long	1072934420
x2:
	.long	-1546188227
	.long	1074937200
x3:
	.long	687194767
	.long	1075810140
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
	fsubrp	%st, %st(1)
	fstpl	8(%esp)
	movl	$0, %eax
	leave
	ret
