	.global sum_asm		# シンボル sum_asm を外部から参照可能に
	.text			# .text セクション開始
sum_asm:	
	movl	$0, %eax	# EAX ← 0
	movl	$array, %edx	# EDX ← 配列 array のアドレス
	movl	array_size,%ecx # ECX ← 配列の大きさ
L1:	
	add	(%edx),%eax	# EAX に配列の要素を加算
	add	$4,%edx		# 配列のアドレスを +4 (int = 32 ビットなので)
	loop	L1		# ECX を -1 し、ゼロでなければ L1 にジャンプ
	ret			# 計算結果はレジスタ EAX に格納されている
