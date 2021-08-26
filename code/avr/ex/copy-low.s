; R16 の下位 4 ビットを R17 の下位 4 ビットにコピー	
	.global	_start
	.text
_start:
	ldi	r16, 0x12	; R16 ← 0x12
	ldi	r17, 0x34	; R17 ← 0x34
	andi	r16, 0x0f	; R16 ← <&> 0x0f
	andi	r17, 0xf0	; R17 ← <&> 0xf0
	or	r17, r16	; R17 ← <|> R16
done:
	rjmp	done		; PC ← done
