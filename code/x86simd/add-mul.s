## 8 要素のベクトルの加算・乗算のサンプル (SSE 命令を使用)
	.text
	.global	_start
_start:
	movdqa	vec1, %xmm0		# 8 ワード(128ビット)をXMM0に読み込み
	movdqa	vec2, %xmm1		# 8 ワード(128ビット)をXMM1に読み込み
	## 8個の16ビット整数をそれぞれ加算
	paddw	%xmm0, %xmm1		# XMM1 ← <+> XMM0
	## 8個の16ビット整数をそれぞれ乗算し、下位16ビットを保存
	pmullw	%xmm1, %xmm0		# XMM0 ← <*> XMM1
	
	movl	$1, %eax		# システムコール 1 番は exit
	int	$0x80			# システムコール呼び出し

	.data
	.align 16			# 16 バイト単位でメモリ配置
vec1:	.word	0, 1, 2, 3, 4, 5, 6, 7	# 16 ビット × 8 個
vec2:	.word	1, -1, 2, -2, 3, -3, 4, -4 # 16 ビット × 8 個
