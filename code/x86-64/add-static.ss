	.text
main:
	## i = 123
	movl	$123, i(%rip)		# [i] ← 123
	## i = i + 1
	movl	i(%rip), %eax		# EAX ← [i]
	addl	$1, %eax		# EAX ← <+> 1
	movl	%eax, i(%rip)		# [i] ← EAX
	## j = 456
	movl	$456, j(%rip)		# [j] ← 456
	## j = i + j
	movl	i(%rip), %eax		# EAX ← [i]
	movl	j(%rip), %edx		# EDX ← [j]
	addl	%edx, %eax		# EAX ← <+> EDX
	movl	%eax, j(%rip)		# [j] ← EAX
	## return j
	movl	j(%rip), %eax		# EAX ← [j]
	ret				# RIP ← [RSP], RSP ← <+> 8
	.bss
j:
	.zero	4
i:
	.zero	4
