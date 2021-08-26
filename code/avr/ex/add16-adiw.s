; 1234 + 56 の計算 (ADIW 命令を使用)
	.global	_start
	.text
_start:
	; 8 ビットに収まらないためレジスタペアを使って計算
	ldi	r26, lo8(1234)	; R26 ← 1234 の下位 8 ビット
	ldi	r27, hi8(1234)	; R27 ← 1234 の上位 8 8ット
	; 加算する値が 0〜63 であれば ADIW 命令が使える
	adiw	r26, 56		; R27:R26 ← <+> 56
done:
	rjmp	done		; PC ← done
