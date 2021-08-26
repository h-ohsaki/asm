	.intel_syntax noprefix    # インテルアセンブラ構文に切り替え
	.global _start
	.text
_start:	
	mov	eax,0x12345678    # 32 ビットの即値をレジスタ EAX に格納
	add	eax,0x9abcdef0    # レジスタ EAX に 32 ビットの即値を加算
	
	mov	ax,0x1234         # 16 ビットの即値をレジスタ AX に格納
	add	ax,0x9abc         # レジスタ AX に 16 ビットの即値を加算

	mov	al,0x12           # 8 ビットの即値をレジスタ AL に格納
	add	al,0x9a           # レジスタ AL に 8 ビットの即値を加算

	mov	dword ptr i, 0x9abcdef0 # 32 ビットの即値を i 番地に格納
	.data
i:	.long	0x12345678
