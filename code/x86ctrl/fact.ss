	.text
	.data
i:
	.long	123
	.text
fact:
	subl	$12, %esp
	cmpl	$1, 16(%esp)
	jne	.L2
	movl	$1, %eax
	jmp	.L3
.L2:
	movl	16(%esp), %eax
	subl	$1, %eax
	subl	$12, %esp
	pushl	%eax
	call	fact
	addl	$16, %esp
	imull	16(%esp), %eax
.L3:
	addl	$12, %esp
	ret
main:
	leal	4(%esp), %ecx
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ecx
	subl	$4, %esp
	subl	$12, %esp
	pushl	$3
	call	fact
	addl	$16, %esp
	movl	%eax, i
	movl	i, %eax
	movl	-4(%ebp), %ecx
	leave
	leal	-4(%ecx), %esp
	ret
