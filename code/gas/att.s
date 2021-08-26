	.global _start
	.text
_start:	
	movl	$0x12345678, %eax # 32 ビットの即値をレジスタ EAX に格納
	addl	$0x9abcdef0, %eax # レジスタ EAXに 32 ビットの即値を加算
	
	movw	$0x1234, %ax      # 16 ビットの即値をレジスタ AX に格納
	addw	$0x9abc, %ax      # レジスタ AX に 16 ビットの即値を加算

	movb	$0x12, %al        # 8 ビットの即値をレジスタ AL に格納
	addb	$0x9a, %al        # レジスタ AL に 8 ビットの即値を加算

	movl	$0x9abcdef0, i	  # 32 ビットの即値を i 番地に格納
	.data
i:	.long	0x12345678
