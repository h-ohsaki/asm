	.text
	.global	_start
sum		= 16		; 合計
i 		= 17		; ループカウンタ
_start:
	ldi	sum, 0		; sum = 0
	ldi	i, 1		; i = 1
loop:
	add	sum, i		; sum += i
	inc	i		; i++
	cpi	i, 11		; i >= 11?
	brlo	loop
done:
	rjmp	done
