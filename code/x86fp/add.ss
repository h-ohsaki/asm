	.text
	.data
x:	# double x = 12.3
	.long	-1717986918
	.long	1076402585
y:	# double y = 4.56
	.long	-1546188227
	.long	1074937200
	.bss
z:	# double z
	.zero	8
	.text
main:
	# z = x + y
	fldl	x
	fldl	y
	faddp	%st, %st(1)
	fstpl	z
	# return 0
	movl	$0, %eax		# EAX ← 0
	ret				# PC ← [ESP]; ESP ← <+> 4
