	.text
	.global	_start
_start:
	movb	$0x12, %al		# AL ← 0x12
	movw	$0x1234, %ax		# AX ← 0x1234
	movl	$0x12345678, %eax	# EAX ← 0x12345678
	movb	%al, %bl		# BL ← <+> AL
	movw	%ax, %bx		# BX ← <+> AX
	movl	%eax, %ebx		# EBX ← <+> EAX
	
	addb	$0x12, %al		# AL ← <+> 0x12
	addw	$0x1234, %ax		# AX ← <+> 0x1234
	addl	$0x12345678, %eax	# EAX ← <+> 0x12345678
	addb	%al, %bl		# BL ← <+> AL
	addw	%ax, %bx		# BX ← <+> AX
	addl	%eax, %ebx		# EBX ← <+> EAX
	
	movl	$1, %eax		# exit システムコールは 1 番
	int	$0x80			# システムコール呼び出し
