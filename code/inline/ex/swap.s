	.file	"swap.c"
	.text
	.section	.rodata
.LC0:
	.string	"i = %d, j = %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$123, -4(%rbp)
	movl	$456, -8(%rbp)
	movl	-4(%rbp), %eax
	movl	-8(%rbp), %edx
#APP
# 6 "swap.c" 1
	xchgl %edx, %eax
# 0 "" 2
#NO_APP
	movl	%edx, -4(%rbp)
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
