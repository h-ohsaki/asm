	.text
	.global	_start
i 		= 16		; 変数 i を格納するレジスタ
tmp 		= 17		; 一時変数を格納するレジスタ
_start:
	ldi	i, 12		; i ← 12
	ldi	tmp, 34		; tmp ← 34
	add	i, tmp		; i ← <+> tmp
	sts	v, i		; (v) ← i
loop:
	rjmp	loop		; pc ← loop

	.data
v:	.byte	0
