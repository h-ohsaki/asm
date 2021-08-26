	.text
main:
	## i = 123
	movq	$123, i(%rip)		# [i] ← 123
	movq	i(%rip), %rax		# RAX ← [i]
	## i = i + 1
	addq	$1, %rax		# RAX ← <+> 1
	movq	%rax, i(%rip)		# [i] ← RAX
	## j = 456
	movq	$456, j(%rip)		# [j] ← 456
	## j = i + j
	movq	i(%rip), %rax		# RAX ← [i]
	movq	j(%rip), %rdx		# RDX ← [j]
	addq	%rdx, %rax		# RAX ← <+> RDX
	movq	%rax, j(%rip)		# [j] ← RAX
	## return j
	movq	j(%rip), %rax		# RAX ← [j]
	ret				# RIP ← [RSP], RSP ← <+> 8
	.bss
j:
	.zero	8
i:
	.zero	8
