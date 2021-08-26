### RAX の下位 32 ビットを RBX の下位 32 ビットにコピー (上位ビットは保存)
	.global	_start
	.text
_start:
	mov	$0x123456789abcdef0, %rax # RAX ← 0x123456789abcdef0
	mov	$-1, %rbx		  # RBX ← 0xffffffffffffffff
	## RBX の上位 32 ビットの取り出し
	mov	$0xffffffff00000000, %rcx # RCX ← 0xffffffff00000000
	and	%rcx, %rbx		  # RBX ← <&> RCX
	## RAX の下位 32 ビットの取り出し
	mov	%eax, %eax		  # EAX ← EAX
	## RBX の上位と RAX の下位をマージ
	or	%rax, %rbx		  # RBX ← <|> RAX
	
        movq    $60, %rax		  # exit システムコールは 60 番
        syscall				  # システムコール呼び出し
