.global	_start
i 		= 16
j 		= 17
tmp		= 19
_start:
	ldi	tmp, 3
	sts	a, tmp
	ldi	tmp, 8
	sts	a+1, tmp
	ldi	tmp, 7
	sts	a+2, tmp
	ldi	tmp, 2
	sts	a+3, tmp
	ldi	tmp, 6
	sts	a+4, tmp
	ldi	tmp, 9
	sts	a+5, tmp
	ldi	tmp, 10
	sts	a+6, tmp
	ldi	tmp, 5
	sts	a+7, tmp
	ldi	tmp, 4
	sts	a+8, tmp
	ldi	tmp, 1
	sts	a+9, tmp
	
	ldi	i, 1		; i ← 1
outer:
	mov	j, i		; j ← i
inner:
	mov	r30, j		; Z ← j (Z の下位バイト)
	ldi	r31, 0		;        (Z の上位バイト)
	movw	r26, r30	; X ← Z
	subi	r26, lo8(-(a-1)); X ← a + X - 1
	sbci	r27, hi8(-(a-1))
	ld	r18, X 		; r18 ← a[j-1]	
	subi	r30, lo8(-(a))	; Z ← a + Z
	sbci	r31, hi8(-(a))
	ld	r25, Z 		; r25 ← a[j]
	cp	r25, r18	; a[j] >= a[j-1]?
	brge	next
	ld	r25, Z		; a[j] と a[j-1] を交換
	ld	r18, X
	st	Z, r18
	st	X, r25
	subi	j, 1		; j ← j - 1
	brne	inner
next:
	inc	i		; i ← i + 1
	cpi	i, 10
	brne	outer
	
loop:	rjmp	loop

	.comm	a, 10, 1
