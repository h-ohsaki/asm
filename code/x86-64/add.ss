	.text
main:
	pushq	%rbp			# RSP ← <-> 8, [RSP] ← RBP
	pushq	%rbx			# RSP ← <-> 8, [RSP] ← RBX
	## i = 123
	movl	$123, %ebp		# EBP ← 123
	## i = i + 1
	addl	$1, %ebp		# EBP ← <+> 1
	## j = 456
	movl	$456, %ebx		# EBX ← 456
	## j = i + j
	addl	%ebp, %ebx		# EBX ← <+> EBP
	## return j
	movl	%ebx, %eax		# EAX ← EBX
	popq	%rbx			# RBX ← [RSP], RSP ← <+> 8
	popq	%rbp			# RBP ← [RSP], RSP ← <+> 8
	ret				# RIP ← [RSP], RSP ← <+> 8
