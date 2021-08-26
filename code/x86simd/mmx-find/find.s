### 文字列中にヌル文字 (0x00) が存在するかを判定するプログラム (MMX 命令のみ使用)
	.text
	.global	_start
_start:
	## string 番地に格納された 8 文字 (8 バイト) を MM0 に読み込み
	movq	string, %mm0		# MMX0 ← [string]
	## ヌル文字 (0x00) が含まれる位置を判定する処理
	## MM1 中の対応する箇所が 0xff または 0x00 になる
	pxor	%mm1, %mm1		# MM1 ← 64 ビットすべてゼロ
	pcmpeqb	%mm0, %mm1		# 各バイトが 0x00 か? (結果は MM1 に保存される)
        ## ヌル文字があったかの判定 (なければ EAX はゼロになる)
	packsswb %mm1, %mm1		# 64 ビットの情報を 32 ビットに集約
	movd	%mm1, %eax		# MM1 の下位 32 ビットを EAX に読み込み
	
	movl	$1, %eax		# システムコール 1 番は exit
	int	$0x80			# システムコール呼び出し

	.data
	.align 16			# 16 バイト単位でメモリ配置
string:	
	.asciz	"Hello!"		# 8 文字 (= 64 ビット) のバイト列
	.byte	0xff			# 8 文字にするためのパディング
