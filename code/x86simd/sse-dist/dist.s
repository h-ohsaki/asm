### 座標 (X, Y) のユークリッド距離を計算するプログラム (SSE3 命令を使用)
	.text
	.global	_start
_start:	
	## x, y の値(64ビット×2)をまとめてXMM0に読み込む
	movapd	x, %xmm0		# XMM0 ← [x]
	## XMM0の各要素をそれぞれ2乗
	## XMM0 ← x*x : y*y
	mulpd	%xmm0, %xmm0		# XMM0 ← <*> XMM0
	## XMM0の2つの要素の和を両方の要素に格納
	## XMM0 ← x*x+y*y : x*x+y*y
	haddpd	%xmm0, %xmm0		# XMM0 を水平方向に加算
	## XMM0の各要素の平方根を計算
	## XMM0 ← sqrt(x*x+y*y) : sqrt(x*x+y*y)
	sqrtpd	%xmm0, %xmm0		# XMM0 ← sqrt(XMM0)
	## XMM0の最下位の要素をメモリdistに格納
	movsd	%xmm0, dist		# [dist] ← XMM0 の下位64ビット
        
        movl    $1, %eax                # exit のシステムコールは 1 番
        int     $0x80                   # システムコール呼び出し
	
	.data
dist:	.double	0		        # 計算したユークリッド距離を格納する領域
	.align	16			# 16 バイト単位のアドレスに配置
x:	.double	1.23			# X 座標の値 (倍精度)
y:	.double	-4.56			# Y 座標の値 (倍精度)
