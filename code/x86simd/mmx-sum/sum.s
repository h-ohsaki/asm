### ベクトルの要素の和を計算するプログラム (MMX 命令のみ使用)
### (x0, x1, ..., x7)  → x0 + x1 + ... + x7
	.text
	.global	_start
_start:
	## vec 番地に格納されたベクトルのデータを MM0 に読み込み
	movq	vec, %mm0		# MM0 ← [vec]
	## MMX0 の下位 4 要素を x0+x4, x1+x5, x2+x6, x3+x7 にする
	## MMX0 を 32 ビットシフトしたものを加算する
	## 上位 32 ビットはゴミ (使用しない)
	movq	%mm0, %mm1		# MM1 ← MM0
	psrlq	$32, %mm1		# MM1 ← MM1 >> 32
	paddb	%mm1, %mm0		# MM0 ← <+> MM1
	## MM0 の下位 2 要素を (x0+x4)+(x2+x6), (x1+x5)+(x3+x7) にする
	## MM0 を 16 ビットシフトしたものを加算する
	## 上位 48 ビットはゴミ (使用しない)
	movq	%mm0, %mm1
	psrlq	$16, %mm1
	paddb	%mm1, %mm0
	## MM0 の下位 2 要素の和を最下位に格納する → MM0 の 第 1 要素が総和
	## MM0 を 8 ビットシフトしたものを加算する
	## 上位 56 ビットはゴミ (使用しない)
	movq	%mm0, %mm1
	psrlq	$8, %mm1
	paddb	%mm1, %mm0

	movl	$1, %eax		# システムコール 1 番は exit
	int	$0x80			# システムコール呼び出し

	.data
	.align 16			# 16 バイト単位でメモリ配置
vec:	.byte	1, 2, 3, 4, 5, 6, 7, 8	# 8 ビット(バイト) × 8
