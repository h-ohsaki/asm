; レジスタ R16 の値を、レジスタ R17 と R18 の両方にコピー
	.global	_start
	.text
_start:
	ldi	r16, 123	; R16 ← 123
	mov	r17, r16	; R17 ← R16
	mov	r18, r16	; R18 ← R16
done:
	rjmp	done		; PC ← done
