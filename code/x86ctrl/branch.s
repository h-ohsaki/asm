	.file	"branch.c"
	.text
	.globl	i
	.data
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.long	123
	.globl	j
	.align 4
	.type	j, @object
	.size	j, 4
j:
	.long	456
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
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
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
