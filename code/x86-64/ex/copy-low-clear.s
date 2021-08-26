### RAX の下位 32 ビットを RBX の下位 32 ビットにコピー (上位ビットはゼロクリア)
	.global	_start
	.text
_start:
	mov	$0x123456789abcdef0, %rax # RAX ← 0x123456789abcdef0
	mov	$-1, %rbx		  # RBX ← 0xffffffffffffffff
	## 32 ビットレジスタに書き込めば上位 32 ビットがクリアされる
	mov	%eax, %ebx		  # EBX ← EAX
	
        movq    $60, %rax		  # exit システムコールは 60 番
        syscall				  # システムコール呼び出し
