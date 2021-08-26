	.global _start
	.text
_start:	
	movl	$12,%eax  # レジスタ EAX に 12 を格納
	addl	$34,%eax  # レジスタ EAX に 34 を加える
	
	movl	%eax,%ebx # レジスタ EAX の値をレジスタ EBX にコピー
	movl	$1,%eax   # システムコール 1 番は exit
	int	$0x80     # システムコール実行
