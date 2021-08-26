	.global rdtsc 		# シンボル sum_asm を外部から参照可能に
	.global strlen_asm	# シンボル strlen_asm を外部から参照可能に
	.global strlen_asm2	# シンボル strlen_asm2 を外部から参照可能に
	.text			# .text セクション開始
# IA-32 アーキテクチャ CPU の TSC (Time Stamp Counter) を取得する	
rdtsc:	
	rdtscp			# CPU の TSC を取得 (EDX:EAX に格納される)
	ret			# 下位 32 ビットを返り値として返す
# ヌルで終端されている文字列の長さ返す
strlen_asm:
	push	%ebp		# レジスタ EBP を退避
	movl	%esp, %ebp	# EBP ← フレームアドレス
	push	%ecx		# レジス ECX を退避
	movl	8(%ebp), %esi	# ESI ← str のアドレス
	movl	$0, %eax	# EAX ← 文字列長
	movb	$0, %cl		# CL ← 終端文字
L1:	
	cmpb	%cl, (%esi)	# [ESI] が終端文字か?
	je	L2		# Yes なら L2 にジャンプ
	inc	%eax		# 文字列長を + 1
	inc	%esi		# str のアドレスを + 1
	jmp	L1		# L1 に戻る
L2:	
	pop	%ecx		# レジスタ ECX を復帰
	pop	%ebp		# レジスタ EBP を復帰
	ret			# 呼び出し元に戻る
# ヌルで終端されている文字列の長さ返す
strlen_asm2:
	push	%ebp		# レジスタ EBP を退避
	movl	%esp, %ebp	# EBP ← フレームアドレス
	push	%edi		# レジスタ EDI を退避
	cld			# DF フラグをクリア (SCASB の探索を順方向に)
	movb	$0, %al		# AL ← 終端文字
	movl	8(%ebp), %edi	# EDI ← str のアドレス
	movl	$0xffffffff, %ecx # ECX ← REPNE の最大繰り返し回数
	repne	scasb		# [EDI] == AL になるまで EDI を増やしてループ
	sub	8(%ebp), %edi	# 文字列長 = 終端文字のアドレス - 開始アドレス - 1
	leal 	-1(%edi), %eax
	pop	%edi		# レジスタ EDI を復帰
	pop	%ebp		# レジスタ EBP を復帰
	ret			# 呼び出し元に戻る
