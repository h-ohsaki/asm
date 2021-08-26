// プログラムカウンタの値をレジスタ X0 にコピー
	.global	_start
	.text
_start:
	adr     x0, 0		//X0 ← PC
	
	mov	x8, 93		// 93 番は exit
	svc	0		// システムコール呼び出し
