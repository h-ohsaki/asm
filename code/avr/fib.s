	.text
SPL 		= 0x3d		; SPL I/O レジスタ
n		= 24		; 引数 n に r24 を使う
	
	rjmp _start		; リセット時のジャンプテーブル
fib:
	push	r28		; r28, r29 を退避
	push	r29
	tst	n		; n == 0?
	breq	zero
	cpi	n, 1		; n == 1?
	breq	one
	mov	r28, n		; r28 ← n
	ldi	n, -1		; n ← n - 1
	add	n, r28
	rcall	fib		; fib(n - 1)
	mov	r29, n		; r29 ← fib(n - 1)
	ldi	n, -2		; n ← n - 2
	add	n, r28
	rcall	fib		; fib(n - 2)
	add	n, r29		; fib(n - 1) + fib(n - 2)
	rjmp	done
zero:
	ldi	n, 0		; fib(0) = 0
	rjmp	done
one:
	ldi	n, 1		; fib(1) = 1
done:
	pop r29			; r28, r29 を復帰
	pop r28
	ret
	
_start:
	ldi	r16, 0x9f	; スタックポインタを初期化
	out	SPL, r16

	ldi	n, 10		; fib(10) を計算
	rcall	fib
loop:	rjmp	loop
