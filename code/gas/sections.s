	.global _start
	.text		# .text セクションの開始
_start:	
	movl	i, %eax	# EAX ← 1234
	movl	%eax, j # [j] ← EAX
	.data		# .data セクションの開始
i:	
	.long	1234	# 32 ビットの整数 1234 を確保
	.lcomm	j, 4	# .bss セクションに 4 バイトを確保
