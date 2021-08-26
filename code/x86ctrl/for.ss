	.text
	.data
i:
	.long	123
j:
	.long	456
	.text
main:
	movl	$0, i
	jmp	.L2
.L3:
	movl	j, %eax
	subl	$1, %eax
	movl	%eax, j
	movl	i, %eax
	addl	$1, %eax
	movl	%eax, i
.L2:
	movl	i, %eax
	cmpl	$4, %eax
	jle	.L3
	movl	j, %eax
	ret
