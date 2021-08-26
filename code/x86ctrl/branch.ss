	.text
	.data
i:
	.long	123
j:
	.long	456
	.text
main:
	movl	i, %eax
	cmpl	$123, %eax
	jne	.L2
	movl	j, %eax
	addl	$1, %eax
	movl	%eax, j
	jmp	.L3
.L2:
	movl	j, %eax
	subl	$1, %eax
	movl	%eax, j
.L3:
	movl	j, %eax
	ret
