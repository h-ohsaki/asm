; R16 (符号なし整数) が 123 以上であれば R17 を 1、そうでなければ 0 にする
	.global	_start
	.text
_start:
	ldi	r16, 100	; R16 ← 100
	ldi	r17, 0		; R17 ← 0
	cpi	r16, 123	; R16 >= 123?
	brlo	done		; PC ← done if CF==1
	ldi	r17, 1		; R17 ← 1
done:
	rjmp	done		; PC ← done
