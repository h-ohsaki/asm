	.text
	.global	_start
_start:
	fldz				# 0 をプッシュ
	movl	$0, %eax		# EAX ← 0
1:	
	faddl	v(, %eax, 8)		# ST(0) ← <+> [v + EAX*8] (倍精度は 8 バイト)
	inc	%eax			# EAX ← <+> 1
	cmpl	$4, %eax		# EAX == 4?
	jl	1b			# より小さければ (前方の) ラベル 1 へジャンプ
	fstpl	sum			# [sum] ← ST(0); トップを捨てる
	
	movl	$0, %ebx		# EBX ← 0 (終了ステータス)
	movl	$1, %eax		# exit のシステムコールは 1 番
	int	$0x80			# システムコール呼び出し

	.data
sum:	.double	0			# 計算結果を格納する領域
v:	.double	1.111			# 倍精度 (64 ビット) の浮動小数点数 x 4
	.double	2.222
	.double	3.333
	.double -4.444
