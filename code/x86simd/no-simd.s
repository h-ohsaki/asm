### SIMD 命令を使わない SIMD モドキのベクトル計算
	.text
	.global	_start
_start:
	movl	$0x00010203, %eax	# (0, 1, 2, 3) を 8 ビットごとに符号化
	movl	$0x04050607, %ebx	# (4, 5, 6, 7) を 8 ビットごとに符号化
	addl	%ebx, %eax		# (0, 1, 2, 3) + (4, 5, 6, 7) が計算できる
	
	movl	$1, %eax		# システムコール 1 番は exit
	int	$0x80			# システムコール呼び出し
