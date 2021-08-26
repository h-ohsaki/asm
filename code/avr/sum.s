	.text
	.global	_start
suml		= 16		; 合計(下位)
sumh		= 17		; 合計(上位)
il 		= 18		; ループカウンタ(下位)
ih 		= 19		; ループカウンタ(上位)
_start:
	ldi	suml, 0		; sum = 0
	ldi	sumh, 0
	ldi	il, 1		; i = 1
	ldi	ih, 0
loop:
	add	suml, il	; sum += i
	adc	sumh, ih
	inc	il		; i++ (i <= 255 を仮定)
	cpi	il, 101		; i >= 101?
	brlo	loop
done:
	rjmp	done
