### 命令ポインタ相対アドレス指定のサンプル
	.text
	.global	_start
_start:
	jmp	1f			# 1f は GAS の局所ラベル (次のラベル 1)
v:	.long	0x12345678		# 0x12345678 をメモリ上に確保
1:	movl	v, %eax			# EAX ← [v]
	movl	-17(%rip), %eax		# EAX ← [RIP - 17]
	movl	v(%rip), %eax		# EAX ← [RIP + (v - RIP)]

	movq	$60, %rax		# exit システムコールは 60 番
	syscall				# システムコール呼び出し
