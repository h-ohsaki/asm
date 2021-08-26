	.intel_syntax noprefix    # インテルアセンブラ構文に切り替え
	.global _start
	.text
_start:	
	mov	eax, 12		# レジスタ EAX に 12 を格納
	add	eax, 34		# レジスタ EAX に 34 を加える
	
	mov	ebx, eax 	# レジスタ EAX の値をレジスタ EBX にコピー
	mov	eax, 1		# システムコール 1 番は exit
	int	0x80     	# システムコール実行
