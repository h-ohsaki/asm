## BGRA 形式のピクセルデータ x 4 を RGBA 形式に変換するプログラム
	.global	_start
	.text
_start:
	movdqa	src, %xmm0		# 4 バイト x 4 個のピクセルデータ読み込み
	pshufb	pat, %xmm0		# Blue と Red を交換する
	movdqa	%xmm0, dst		# 変換後のピクセルデータをメモリにコピー

	movl    $1, %eax
        int     $0x80

	.data
	.align	16
	## BGRA (Blue, Green, Red, Alpha) x 4
src:	.byte	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
	## PSHUFB 命令によるバイト単位の配置パターン
	## 各ピクセルの Blue と Red を交換する
pat:	.byte	2, 1, 0, 3, 6, 5, 4, 7, 10, 9, 8, 11, 14, 13, 12, 15
dst:	.zero	16
