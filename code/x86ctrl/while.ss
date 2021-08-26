	.text
	.data
i:
	.long	123
j:
	.long	456
	.text
main:
	jmp	.L2
.L3:
	movl	i, %eax
	subl	$1, %eax
	movl	%eax, i
	movl	j, %eax
	addl	$1, %eax
	movl	%eax, j
.L2:
	movl	i, %eax
	testl	%eax, %eax
	jg	.L3
	movl	j, %eax
	ret
