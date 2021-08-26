; R16 が奇数であれば R17 を 1 に、そうでなければ 0 にする
	.global	_start
	.text
_start:
	ldi	r16, 100	; R16 ← 100
	ldi	r17, 0		; R17 ← 0
	sbrc	r16, 0		; R16 の最下位ビットが 0 なら次の命令をスキップ
	; R16 が奇数の場合だけ次の命令が実行される
	ldi	r17, 1		; R17 ← 1
done:
	rjmp	done
