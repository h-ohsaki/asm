	.arch armv8-a
	.text
	.global	_start
_start:
	b	_start		// _start への相対ジャンプ
	b	-4		// これも _start への相対ジャンプ
	b	far_v		// 128 Mバイト以上先にジャンプ (できない)
	
	.zero	0x08000000	// 128 M バイト分をゼロで埋める
far_v:	.zero 	1		// 1 バイトの領域を確保
