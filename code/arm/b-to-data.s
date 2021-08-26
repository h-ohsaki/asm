	.arch armv8-a
	.text
	.global	_start
_start:
	b	_start		// _start への相対ジャンプ
	b	-4		// これも _start への相対ジャンプ
	b	v		// .data セクションへの相対ジャンプ (できるか?)

	.data			// .data セクションを開始
v:	.zero 	1		// 1 バイトの領域を確保
