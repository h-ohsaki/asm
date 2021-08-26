main:
	movl	$123, i
	movl	i, %eax
	addl	$1, %eax
	movl	%eax, i
	movl	$456, j
	movl	i, %edx
	movl	j, %eax
	addl	%edx, %eax
	movl	%eax, j
	movl	j, %eax
	ret
