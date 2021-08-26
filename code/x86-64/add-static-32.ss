	.text
main:
	## i = 123
	movl	$123, i			# [i] ← 123
	## i = i + 1
	movl	i, %eax			# EAX ← [i]
	addl	$1, %eax		# EAX ← <+> 1
	movl	%eax, i			# [i] ← EAX
	## j = 456
	movl	$456, j			# [j] ← 456
	## j = i + j
	movl	i, %eax			# EAX ← [i]
	movl	j, %edx			# EDX ← [j]
	addl	%edx, %eax		# EAX ← <+> EDX
	movl	%eax, j			# [j] ← EAX
	## return j
	movl	j, %eax			# EAX ← [j]
	ret				# EIP ← [ESP], ESP ← <+> 4
	.bss
j:
	.zero	4
i:
	.zero	4
