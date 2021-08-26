	.text
main:
	pushl	%esi			# RSP ← <-> 4, [RSP] ← ESI
	pushl	%ebx			# RSP ← <-> 4, [RSP] ← EBX
	## i = 123
	movl	$123, %esi		# ESI ← 123
	## i = i + 1
	addl	$1, %esi		# ESI ← <+> 1
	## j = 456
	movl	$456, %ebx		# EBX ← 456
	## j = i + j
	addl	%esi, %ebx		# EBX ← <+> ESI
	## return j
	movl	%ebx, %eax		# EAX ← EBX
	popl	%ebx			# RBX ← [RSP], RSP ← <+> 4
	popl	%esi			# ESI ← [RSP], RSP ← <+> 4
	ret				# EIP ← [RSP], RSP ← <+> 4
