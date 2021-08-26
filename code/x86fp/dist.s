	.text
	.global	_start
_start:
	fldl	x			# [x] をプッシュ
	fmul	%st(0), %st(0)		# ST(0) ← <*> ST(0)
	fldl	y			# [y] をプッシュ
	fmul	%st(0), %st(0)		# ST(0) ← <*> ST(0)
	faddp	%st(0), %st(1)		# ST(1) ← <+> ST(0); トップを捨てる
	fsqrt				# ST(0) ← sqrt(ST(0))
	fstpl	dist			# [dist] ← ST(0); トップを捨てる
	
	movl	$0, %ebx		# EBX ← 0 (終了ステータス)
	movl	$1, %eax		# exit のシステムコールは 1 番
	int	$0x80			# システムコール呼び出し

	.data
dist:	.double	0			# 計算したユークリッド距離を格納する領域
x:	.double	1.23			# X 座標の値
y:	.double	-4.56			# Y 座標の値
