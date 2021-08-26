main:
	pushl	%esi
	pushl	%ebx
	movl	$123, %esi
	addl	$1, %esi
	movl	$456, %ebx
	addl	%esi, %ebx
	movl	%ebx, %eax
	popl	%ebx
	popl	%esi
	ret
