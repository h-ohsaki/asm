; (123 + 45) >> 3 の計算
	.global	_start
	.text
_start:
	ldi	r16, 123	; R16 ← 123
	subi	r16, -45	; R16 ← <-> -45
	; 1 ビットの右シフトを 3 回繰り返す
	lsr	r16		; R16 ← 123
	lsr	r16		; R16 ← 123
	lsr	r16		; R16 ← 123
done:
	rjmp	done		; PC ← done
