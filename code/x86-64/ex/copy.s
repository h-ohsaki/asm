### レジスタ RAX の値を、レジスタ RBX と R8 の両方にコピー
	.global	_start
	.text
_start:
	mov	$0x123456789abcdef0, %rax # RAX ← 0x123456789abcdef0
	mov	%rax, %rbx		  # RBX ← RAX
	mov	%rax, %r8		  # R8 ← RAX
	
        movq    $60, %rax		  # exit システムコールは 60 番
        syscall				  # システムコール呼び出し
