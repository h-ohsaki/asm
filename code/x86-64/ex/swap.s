### レジスタ RAX と RBX の値を交換
	.global	_start
	.text
_start:
	mov	$0x123456789abcdef0, %rax # RAX ← 0x123456789abcdef0
	mov	$-1, %rbx		  # RBX ← 0xffffffffffffffff
	xchg	%rax, %rbx		  # RAX と RBX の値を交換
	
        movq    $60, %rax		  # exit システムコールは 60 番
        syscall				  # システムコール呼び出し
