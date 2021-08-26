### プログラムカウンタ (レジスタ RIP) の値をレジスタ RAX にコピー
	.global	_start
	.text
_start:
	## 命令ポインタ相対アドレス指定: メモリロケーション = RIP (ベースレジスタ)
	## LEA 命令はメモリロケーションの実効アドレスをレジスタにコピーする
	lea	(%rip), %rax		# RAX ← RIP
	
        movq    $60, %rax		# exit システムコールは 60 番
        syscall				# システムコール呼び出し
