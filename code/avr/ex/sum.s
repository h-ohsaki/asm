; 1 - 2 + 3 - 4 + ... + 99 - 100 の計算
	.global	_start
	.text
; 総和
sum_l		= 26
sum_h		= 27
; ループカウンタ	
i_l		= 28
i_h		= 29
_start:
	ldi	sum_l, 0	; sum = 0
	ldi	sum_h, 0
	ldi	i_l, 1		; i = 1
	ldi	i_h, 0
loop:	
	sbrs	i_l, 0		; i_l の最下位ビットが 1 なら次の命令をスキップ
	; i_l が奇数の時だけ RJMP 命令が実行される
	rjmp	odd		; PC ← odd
	; i が偶数の場合の処理
	sub	sum_l, i_l	; sum_l ← <-> i_l
	sbc	sum_h, i_h	; sum_h ← <-> (i_h + CF)
	rjmp	next		; PC ← next
odd:	; i が奇数の場合の処理
	add	sum_l, i_l	; sum_l ← <+> i_l
	adc	sum_h, i_h	; sum_h ← <+> (i_h + CF)
next:	
	inc	i_l		; i_l ← <+> 1
	cpi	i_l, 101	; i_l >= 101?
	; i <= 100 なら loop に戻る
	brlo	loop		; PC ← loop if CF==1
done:
	rjmp	done		; PC ← done
