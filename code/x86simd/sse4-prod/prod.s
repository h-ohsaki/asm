### 2 つのベクトルの内積を計算するプログラム (SSE4.1 命令を使用)
	.text
	.global	_start
_start:
	## vec1 番地に格納されたベクトルのデータを XMMX0 に読み込み
	movdqa	vec1, %xmm0		# XMM0 ← [vec1]
	## XMM0とvec2の内積を計算し、XMM0の上位・下位にそれぞれ保存
	dppd	$0b110011, vec2, %xmm0	# XMM0 ← XMM0 と [vec2] の内積
	
	movl	$1, %eax		# システムコール 1 番は exit
	int	$0x80			# システムコール呼び出し
	
	.data
	.align 16			# 16バイト単位でメモリ配置
vec1:	.double	1.11, 2.22		# 倍精度(64ビット)×2
vec2:	.double	-3.33, 4.44		# 倍精度(64ビット)×2
