### スタックポインタ (レジスタ RSP) の値をレジスタ RAX にコピー
	.global	_start
	.text
_start:
	mov	%rsp, %rax		# RAX ← RSP
	
        movq    $60, %rax		# exit システムコールは 60 番
        syscall				# システムコール呼び出し
