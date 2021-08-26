        .text
        .global _start
_start:
        fldl    x			# [x] をプッシュ
	fmull	four			# ST(0) ← <*> [four]
	
	movl	$1, %eax
	int	$0x80
	
        .data
x:	.double	1.23
four:   .double	4.0
