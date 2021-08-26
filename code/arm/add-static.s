	.arch armv8-a
	.file	"add-static.c"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB0:
	.cfi_startproc
	adrp	x0, .LANCHOR0
	add	x1, x0, :lo12:.LANCHOR0
	mov	w2, 123
	str	w2, [x0, #:lo12:.LANCHOR0]
	ldr	w2, [x0, #:lo12:.LANCHOR0]
	add	w2, w2, 1
	str	w2, [x0, #:lo12:.LANCHOR0]
	mov	w2, 456
	str	w2, [x1, 4]
	ldr	w0, [x0, #:lo12:.LANCHOR0]
	ldr	w2, [x1, 4]
	add	w0, w0, w2
	str	w0, [x1, 4]
	ldr	w0, [x1, 4]
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.global	j
	.global	i
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	i, %object
	.size	i, 4
i:
	.zero	4
	.type	j, %object
	.size	j, 4
j:
	.zero	4
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
