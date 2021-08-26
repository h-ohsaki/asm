	.file	"for.c"
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
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
