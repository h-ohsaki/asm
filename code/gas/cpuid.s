	.global _start
	.text
_start:	
	movl	$1,%eax   # 1: CPU の情報・機能ビットを取得
	cpuid
	movl	%edx,%ebx # レジスタ EDX の値をレジスタ EBX にコピー
	shrl	$24,%ebx  # 24 ビット右シフト
	movl	$1,%eax   # システムコール 2 番は exit
	int	$0x80     # システムコール呼び出し
