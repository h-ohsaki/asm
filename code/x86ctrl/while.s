	.file	"while.c"
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
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
