	.text
	.global	_start
_start:
	movb	$0x12, %al		# AL ← 0x12
	movw	$0x1234, %ax		# AX ← 0x1234
	movl	$0x12345678, %eax	# EAX ← 0x12345678
	movq	$0x123456789abcdef0, %rax # RAX ← 0x123456789abcdef0
	movb	%al, %bl		# BL ← <+> AL
	movw	%ax, %bx		# BX ← <+> AX
	movl	%eax, %ebx		# EBX ← <+> EAX
	movq	%rax, %rbx		# RBX ← <+> RAX
	
	addb	$0x12, %al		# AL ← <+> 0x12
	addw	$0x1234, %ax		# AX ← <+> 0x1234
	addl	$0x12345678, %eax	# EAX ← <+> 0x12345678
#	addq	$0x123456789abcdef0, %rax # 書けない!
	addb	%al, %bl		# BL ← <+> AL
	addw	%ax, %bx		# BX ← <+> AX
	addl	%eax, %ebx		# EBX ← <+> EAX
	addq	%rax, %rbx		# RBX ← <+> RAX

	movq	$60, %rax		# exit システムコールは 60 番
	syscall				# システムコール呼び出し
