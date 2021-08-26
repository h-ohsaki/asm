	.text
main:
	pushl	%ebp			# ESP ← <-> 4, [ESP] ← EBP
	movl	%esp, %ebp		# EBP ← ESP
	pushl	%ebx			# ESP ← <-> 4, [ESP] ← EBX
	## i = 123
	movl	$123, i			# [i] ← 123
	movl	$0, i+4			# [i + 4] ← 0
	movl	i, %eax			# EAX ← [i]
	movl	i+4, %edx		# EDX ← [i + 4]
	## i = i + 1
	addl	$1, %eax		# EAX ← <+> 1
	adcl	$0, %edx		# EDX ← <+> (0 + CF)
	movl	%eax, i			# [i] ← EAX
	movl	%edx, i+4		# [i + 4] ← EDX
	## j = 456
	movl	$456, j			# [j] ← 456
	movl	$0, j+4			# [j + 4] ← 0
	## j = i + j
	movl	i, %eax			# EAX ← [i]
	movl	i+4, %edx		# EDX ← [i + 4]
	movl	j, %ecx			# ECX ← [j]
	movl	j+4, %ebx		# EBX ← [j + 4]
	addl	%ecx, %eax		# EAX ← <+> ECX
	adcl	%ebx, %edx		# EDX ← <+> (EBX + CF)
	movl	%eax, j			# [j] ← EAX
	movl	%edx, j+4		# [j + 4] ← EDX
	## return j
	movl	j, %eax			# EAX ← [j]
	movl	j+4, %edx		# EDX ← [j + 4]
	popl	%ebx			# EBX ← [ESP], ESP ← <+> 4
	popl	%ebp			# EBP ← [ESP], ESP ← <+> 4
	ret				# EIP ← [ESP], ESP ← <+> 4
	.bss
j:
	.zero	8
i:
	.zero	8
