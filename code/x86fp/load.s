        .text
        .global _start
_start:
        fldl    one			# 1.0 をスタックにプッシュ
        fldl    zero			# ゼロをスタックにプッシュ
        fldl    pi			# 円周率をスタックにプッシュ
	movl	$1, %eax
	int	$0x80
        .data
one:    .double	1.0
zero:   .double	0.0
pi:     .double	3.141592653589793
