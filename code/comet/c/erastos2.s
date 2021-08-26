	.file	"erastos2.c"
	.intel_syntax noprefix
	.text
	.globl	A
	.bss
	.align 32
	.type	A, @object
	.size	A, 404
A:
	.zero	404
	.section	.rodata
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	lea	ecx, [esp+4]
	.cfi_def_cfa 1, 0
	and	esp, -16
	push	DWORD PTR [ecx-4]
	push	ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	mov	ebp, esp
	push	esi
	push	ebx
	push	ecx
	.cfi_escape 0xf,0x3,0x75,0x74,0x6
	.cfi_escape 0x10,0x6,0x2,0x75,0x7c
	.cfi_escape 0x10,0x3,0x2,0x75,0x78
	sub	esp, 28
	mov	ebx, 2
	jmp	.L2
.L7:
	mov	eax, DWORD PTR A[0+ebx*4]
	test	eax, eax
	jne	.L12
	lea	esi, [ebx+ebx]
	jmp	.L5
.L6:
	mov	DWORD PTR A[0+esi*4], 1
	add	esi, ebx
.L5:
	cmp	esi, 100
	jle	.L6
	jmp	.L4
.L12:
	nop
.L4:
	add	ebx, 1
.L2:
	cmp	ebx, 100
	jle	.L7
	mov	DWORD PTR [ebp-28], 2
	jmp	.L8
.L10:
	mov	eax, DWORD PTR [ebp-28]
	mov	eax, DWORD PTR A[0+eax*4]
	test	eax, eax
	jne	.L9
	sub	esp, 8
	push	DWORD PTR [ebp-28]
	push	OFFSET FLAT:.LC0
	call	printf
	add	esp, 16
.L9:
	add	DWORD PTR [ebp-28], 1
.L8:
	cmp	DWORD PTR [ebp-28], 100
	jle	.L10
	mov	eax, 0
	lea	esp, [ebp-12]
	pop	ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	pop	ebx
	.cfi_restore 3
	pop	esi
	.cfi_restore 6
	pop	ebp
	.cfi_restore 5
	lea	esp, [ecx-4]
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
