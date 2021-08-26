	.file	"add.c"
	.text
	.globl	i
	.bss
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.globl	j
	.align 4
	.type	j, @object
	.size	j, 4
j:
	.zero	4
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
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
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
