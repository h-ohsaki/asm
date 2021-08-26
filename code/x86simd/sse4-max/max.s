### 2 つのベクトルの各要素の最大値を取得するプログラム
	.text
	.global	_start
_start:
	## vec1から16バイト(128ビット)をXMM0に読み込み
	movdqa	vec1, %xmm0  		# XMM0 ← [vec1]
	## XMM0とvec2の各要素の最大値をXMM0に保存
	pmaxsb	vec2, %xmm0		# XMM0 ← max(XMM0, vec2)
	
	movl	$1, %eax		# システムコール 1 番は exit
	int	$0x80			# システムコール呼び出し
	
	.data
	.align 16			# 16バイト単位でメモリ配置
vec1:	.byte	-8, -7, -6, -5, -4, -3, -2, -1
	.byte	0, 1, 2, 3, 4, 5, 6, 7
vec2:	.byte	7, 6, 5, 4, 3, 2, 1, 0
	.byte	-1, -2, -3, -4, -5, -6, -7, -8
