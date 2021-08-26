; レジスタ R16 の値を 16 倍にする	
	.global	_start
	.text
_start:
	ldi	r16, 12		; R16 ← 12
	; 4 回左にビットシフトしてもよいが、ここでは SWAP 命令を使う
	swap	r16		; R16 の上位・下位 4 ビットを交換
	andi	r16, 0xf0	; R16 の下位 4 ビットを 0 に
done:
	rjmp	done		; PC ← done
